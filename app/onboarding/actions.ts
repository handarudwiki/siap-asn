"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";

export async function saveOnboarding(_: { error?: string } | undefined, formData: FormData) {
  const user = await requireUser({ allowUnonboarded: true });
  const parsed = z
    .object({
      full_name: z.string().trim().min(2, "Nama wajib diisi"),
      target: z.enum(["cpns", "kedinasan"], { error: "Pilih target ujian" }),
      formation_type: z.string().min(1),
      exam_date: z.string().optional(),
      daily_study_minutes: z.coerce.number().int().min(15).max(600),
    })
    .safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: parsed.error.issues[0].message };

  const supabase = await createClient();
  // match passing-grade profile for the formation (latest year)
  const { data: pg } = await supabase
    .from("passing_grade_profiles")
    .select("id")
    .eq("formation_type", parsed.data.formation_type)
    .order("year", { ascending: false })
    .limit(1)
    .maybeSingle();

  const { error } = await supabase
    .from("profiles")
    .update({
      full_name: parsed.data.full_name,
      target: parsed.data.target,
      formation_type: parsed.data.formation_type,
      exam_date: parsed.data.exam_date || null,
      daily_study_minutes: parsed.data.daily_study_minutes,
      passing_grade_profile_id: pg?.id ?? null,
      onboarded: true,
    })
    .eq("id", user.id);
  if (error) return { error: error.message };
  redirect("/dashboard?welcome=1");
}
