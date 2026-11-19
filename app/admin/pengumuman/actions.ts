"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { bool, str } from "@/lib/admin";
import { back } from "@/app/admin/_ops/util";

const PATH = "/admin/pengumuman";

export async function saveAnnouncement(fd: FormData) {
  const user = await requireStaff("admin");
  const id = str(fd, "id");
  const title = str(fd, "title");
  const body = str(fd, "body");
  if (!title || !body) back(PATH, { error: "Judul dan isi wajib diisi." });
  const segment = ["all", "free", "premium"].includes(str(fd, "segment")) ? str(fd, "segment") : "all";
  const row = { title, body, segment, published: bool(fd, "published") };
  const supabase = await createClient();
  const { error } = id
    ? await supabase.from("announcements").update(row).eq("id", id)
    : await supabase.from("announcements").insert({ ...row, created_by: user.id });
  if (error) back(PATH, { error: error.message });
  revalidatePath(PATH);
  revalidatePath("/dashboard");
  back(PATH, { ok: "Pengumuman tersimpan." });
}

export async function deleteAnnouncement(fd: FormData) {
  await requireStaff("admin");
  const supabase = await createClient();
  const { error } = await supabase.from("announcements").delete().eq("id", str(fd, "id"));
  if (error) back(PATH, { error: error.message });
  revalidatePath(PATH);
  back(PATH, { ok: "Pengumuman dihapus." });
}
