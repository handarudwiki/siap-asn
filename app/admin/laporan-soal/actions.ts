"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { str } from "@/lib/admin";

export async function resolveReport(fd: FormData) {
  await requireStaff();
  const supabase = await createClient();
  await supabase
    .from("question_reports")
    .update({ status: str(fd, "status") === "rejected" ? "rejected" : "resolved", resolution: str(fd, "resolution") || null })
    .eq("id", str(fd, "id"));
  revalidatePath("/admin/laporan-soal");
}
