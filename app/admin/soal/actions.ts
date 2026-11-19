"use server";

import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import { canPublishRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { num, str } from "@/lib/admin";
import type { QuestionOption, TestCode } from "@/lib/types";

export type QuestionFormState = { error?: string; ok?: string } | undefined;

/** FR-A12 – mirrors the DB trigger so editors get a friendly message first. */
export async function validateOptions(test: TestCode, options: QuestionOption[]) {
  if (options.length !== 5) return "Soal harus memiliki 5 opsi (A–E).";
  if (options.some((o) => !o.text.trim())) return "Semua opsi wajib diisi.";
  const pts = options.map((o) => o.points ?? 0).sort();
  if (test === "TKP") {
    if (pts.join() !== "1,2,3,4,5") return "TKP: setiap opsi harus bernilai 1–5 dan setiap nilai dipakai sekali.";
  } else if (pts.join() !== "0,0,0,0,5") return "TWK/TIU: tentukan tepat satu kunci jawaban.";
  return null;
}

function readOptions(fd: FormData, test: TestCode): QuestionOption[] {
  const correct = str(fd, "correct");
  return (["A", "B", "C", "D", "E"] as const).map((label) => ({
    label,
    text: str(fd, `opt_${label}`),
    points: test === "TKP" ? num(fd, `pts_${label}`, 0)! : label === correct ? 5 : 0,
  }));
}

export async function saveQuestion(_: QuestionFormState, fd: FormData): Promise<QuestionFormState> {
  const user = await requireStaff();
  const id = str(fd, "id");
  const intent = str(fd, "intent") || "save";
  const test = str(fd, "test_code") as TestCode;
  const stem = str(fd, "stem");
  if (!stem) return { error: "Teks soal wajib diisi." };
  const options = readOptions(fd, test);
  const invalid = await validateOptions(test, options);
  if (invalid) return { error: invalid };

  const statusFor: Record<string, string | undefined> = { submit: "in_review", publish: "published", reject: "draft", archive: "archived", draft: "draft" };
  const nextStatus = statusFor[intent];
  if ((intent === "publish" || intent === "reject") && !canPublishRole(user.profile.role)) return { error: "Hanya Reviewer/Admin yang dapat menerbitkan atau menolak." };

  const row = {
    test_code: test,
    subtopic_id: str(fd, "subtopic_id") || null,
    stem,
    image_url: str(fd, "image_url") || null,
    options,
    explanation: str(fd, "explanation"),
    difficulty: str(fd, "difficulty") || "medium",
    usage: str(fd, "usage") || "both",
    source: str(fd, "source") || null,
    year: num(fd, "year"),
    ...(nextStatus ? { status: nextStatus } : {}),
    ...(intent === "reject" ? { reviewer_note: str(fd, "reviewer_note") || "Perlu revisi" } : intent === "publish" ? { reviewer_note: null } : {}),
  };

  const supabase = await createClient();
  if (id) {
    const { error } = await supabase.from("questions").update(row).eq("id", id);
    if (error) return { error: error.message.includes("Create a new version") ? "Soal sudah dipakai di try-out yang dikerjakan peserta. Buat versi baru untuk mengubah isi." : error.message };
    revalidatePath(`/admin/soal/${id}`);
    revalidatePath("/admin/soal");
    return { ok: nextStatus ? `Status diperbarui: ${nextStatus}` : "Tersimpan." };
  }
  const { data, error } = await supabase.from("questions").insert({ ...row, created_by: user.id }).select("id").single();
  if (error) return { error: error.message };
  if (intent === "new") redirect("/admin/soal/baru?saved=1");
  redirect(`/admin/soal/${data.id}`);
}

export async function findSimilar(stem: string, excludeId?: string) {
  await requireStaff();
  if (stem.trim().length < 15) return [];
  const supabase = await createClient();
  const { data } = await supabase.rpc("find_similar_questions", { p_stem: stem, p_exclude: excludeId ?? null });
  return ((data ?? []) as { id: string; stem: string; status: string; similarity: number }[]).filter((d) => d.similarity >= 0.5);
}

/** BR-08: locked questions are changed through a new version. */
export async function createVersion(fd: FormData) {
  const user = await requireStaff();
  const supabase = await createClient();
  const { data: q } = await supabase.from("questions").select("*").eq("id", str(fd, "id")).single();
  if (!q) return;
  const { id: _old, created_at: _c, updated_at: _u, ...rest } = q;
  void _old; void _c; void _u;
  const { data, error } = await supabase
    .from("questions")
    .insert({ ...rest, parent_id: q.id, version: q.version + 1, status: "draft", reviewer_note: null, created_by: user.id })
    .select("id")
    .single();
  if (error) return;
  redirect(`/admin/soal/${data.id}`);
}

export async function deleteQuestion(fd: FormData) {
  await requireStaff("admin");
  const supabase = await createClient();
  const { error } = await supabase.from("questions").delete().eq("id", str(fd, "id"));
  if (error) redirect(`/admin/soal/${str(fd, "id")}?error=delete`);
  redirect("/admin/soal");
}

export async function bulkStatus(fd: FormData) {
  const user = await requireStaff();
  const status = str(fd, "status");
  if (status === "published" && !canPublishRole(user.profile.role)) return;
  const ids = fd.getAll("ids").map(String).filter(Boolean);
  if (!ids.length) return;
  const supabase = await createClient();
  await supabase.from("questions").update({ status }).in("id", ids);
  revalidatePath("/admin/soal");
}
