"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { bool, num, str } from "@/lib/admin";
import { back } from "@/app/admin/_ops/util";

const PATH = "/admin/passing-grade";

export async function saveProfile(fd: FormData) {
  await requireStaff("super_admin");
  const id = str(fd, "id");
  const rule = str(fd, "rule_type") === "cumulative" ? "cumulative" : "per_test";
  const row = {
    name: str(fd, "name"),
    year: num(fd, "year", new Date().getFullYear()),
    formation_type: str(fd, "formation_type") || "umum",
    rule_type: rule,
    twk_min: num(fd, "twk_min"),
    tiu_min: num(fd, "tiu_min"),
    tkp_min: num(fd, "tkp_min"),
    total_min: num(fd, "total_min"),
    is_default: bool(fd, "is_default"),
    notes: str(fd, "notes") || null,
  };
  if (!row.name) back(PATH, { error: "Nama profil wajib diisi." });
  if (rule === "per_test" && (row.twk_min == null || row.tiu_min == null || row.tkp_min == null)) back(PATH, { error: "Aturan per tes memerlukan ambang TWK, TIU, dan TKP." });
  if (rule === "cumulative" && row.total_min == null) back(PATH, { error: "Aturan kumulatif memerlukan nilai total minimum." });
  const supabase = await createClient();
  if (row.is_default) {
    const q = supabase.from("passing_grade_profiles").update({ is_default: false }).eq("is_default", true);
    await (id ? q.neq("id", id) : q);
  }
  const { error } = id ? await supabase.from("passing_grade_profiles").update(row).eq("id", id) : await supabase.from("passing_grade_profiles").insert(row);
  if (error) back(PATH, { error: error.message.includes("duplicate") ? "Profil untuk tahun & formasi tersebut sudah ada." : error.message });
  revalidatePath(PATH);
  back(PATH, { ok: "Profil passing grade tersimpan." });
}
