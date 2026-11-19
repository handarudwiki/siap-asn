"use server";

import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import { canPublishRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { bool, num, str } from "@/lib/admin";
import { slugify } from "@/lib/format";

export type LessonFormState = { error?: string; ok?: string } | undefined;

export async function saveLesson(_: LessonFormState, fd: FormData): Promise<LessonFormState> {
  const user = await requireStaff();
  const id = str(fd, "id");
  const intent = str(fd, "intent") || "save";
  const title = str(fd, "title");
  if (!title) return { error: "Judul wajib diisi." };
  if (!str(fd, "subtopic_id")) return { error: "Pilih sub-topik." };

  const statusFor: Record<string, string | undefined> = { submit: "in_review", publish: "published", reject: "draft", archive: "archived", draft: "draft" };
  const nextStatus = statusFor[intent];
  if ((intent === "publish" || intent === "reject") && !canPublishRole(user.profile.role)) return { error: "Hanya Reviewer/Admin yang dapat menerbitkan atau menolak." };

  const row = {
    title,
    slug: str(fd, "slug") || slugify(title),
    subtopic_id: str(fd, "subtopic_id"),
    summary: str(fd, "summary") || null,
    content: (fd.get("content") as string) ?? "",
    video_url: str(fd, "video_url") || null,
    pdf_url: str(fd, "pdf_url") || null,
    is_free: bool(fd, "is_free"),
    sort_order: num(fd, "sort_order", 0)!,
    est_minutes: num(fd, "est_minutes", 10)!,
    ...(nextStatus ? { status: nextStatus } : {}),
    ...(intent === "reject" ? { reviewer_note: str(fd, "reviewer_note") || "Perlu revisi" } : intent === "publish" ? { reviewer_note: null } : {}),
  };

  const supabase = await createClient();
  if (id) {
    const { error } = await supabase.from("lessons").update(row).eq("id", id);
    if (error) return { error: error.message };
    revalidatePath(`/admin/materi/${id}`);
    revalidatePath("/admin/materi");
    return { ok: nextStatus ? `Status: ${nextStatus}` : "Tersimpan." };
  }
  const { data, error } = await supabase.from("lessons").insert({ ...row, created_by: user.id }).select("id").single();
  if (error) return { error: error.message.includes("duplicate") ? "Slug sudah dipakai." : error.message };
  redirect(`/admin/materi/${data.id}`);
}

export async function restoreVersion(fd: FormData) {
  await requireStaff();
  const supabase = await createClient();
  const { data: v } = await supabase.from("lesson_versions").select("lesson_id, title, content").eq("id", str(fd, "version_id")).single();
  if (!v) return;
  await supabase.from("lessons").update({ title: v.title, content: v.content, status: "draft" }).eq("id", v.lesson_id);
  revalidatePath(`/admin/materi/${v.lesson_id}`);
}

export async function deleteLesson(fd: FormData) {
  await requireStaff("admin");
  const supabase = await createClient();
  await supabase.from("lessons").delete().eq("id", str(fd, "id"));
  redirect("/admin/materi");
}
