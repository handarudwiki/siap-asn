"use server";

import { redirect } from "next/navigation";
import { requireUser } from "@/lib/auth";
import { createAdminClient } from "@/lib/supabase/admin";
import { createClient } from "@/lib/supabase/server";

/** PDP right to erasure: deletes the auth user (profile & learning data cascade). */
export async function deleteAccount(_: { error?: string } | undefined, formData: FormData) {
  const user = await requireUser({ allowUnonboarded: true });
  if (formData.get("confirm") !== "HAPUS") return { error: 'Ketik "HAPUS" untuk konfirmasi.' };
  try {
    const admin = createAdminClient();
    const { error } = await admin.auth.admin.deleteUser(user.id);
    if (error) return { error: error.message };
  } catch {
    return { error: "Penghapusan otomatis belum dikonfigurasi. Hubungi dukungan untuk menghapus akun." };
  }
  const supabase = await createClient();
  await supabase.auth.signOut();
  redirect("/?akun=dihapus");
}
