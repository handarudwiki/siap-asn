"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";
import { errorMessage } from "@/lib/format";

// ---------- Lessons ----------
export async function toggleLessonDone(lessonId: string, done: boolean, slug: string) {
  const user = await requireUser();
  const supabase = await createClient();
  if (done) await supabase.from("lesson_progress").upsert({ user_id: user.id, lesson_id: lessonId });
  else await supabase.from("lesson_progress").delete().eq("user_id", user.id).eq("lesson_id", lessonId);
  revalidatePath(`/materi/${slug}`);
  revalidatePath("/materi");
}

export async function saveLessonNote(lessonId: string, data: { bookmarked?: boolean; note?: string }) {
  const user = await requireUser();
  const supabase = await createClient();
  await supabase
    .from("lesson_notes")
    .upsert({ user_id: user.id, lesson_id: lessonId, ...data, updated_at: new Date().toISOString() });
}

// ---------- Practice ----------
export type PracticeQuestion = {
  id: string;
  test_code: "TWK" | "TIU" | "TKP";
  stem: string;
  image_url: string | null;
  options: { label: string; text: string }[];
  difficulty: string;
};

export async function loadPractice(params: { subtopicId?: string | null; mode?: "random" | "saved" | "weak"; limit?: number }) {
  await requireUser();
  const supabase = await createClient();
  const limit = params.limit ?? 10;

  if (params.mode === "weak") {
    const { data: weak } = await supabase.rpc("get_weak_subtopics", { p_limit: 3 });
    const ids = ((weak ?? []) as { subtopic_id: string }[]).map((w) => w.subtopic_id);
    if (ids.length === 0) {
      const { data, error } = await supabase.rpc("get_practice_questions", { p_subtopic: null, p_limit: limit, p_mode: "random" });
      return { questions: (data ?? []) as PracticeQuestion[], error: error ? errorMessage(error) : null, note: "Belum cukup data untuk mendeteksi titik lemah — ini set acak." };
    }
    const per = Math.ceil(limit / ids.length);
    const results = await Promise.all(ids.map((id) => supabase.rpc("get_practice_questions", { p_subtopic: id, p_limit: per, p_mode: "random" })));
    const err = results.find((r) => r.error)?.error;
    return { questions: results.flatMap((r) => (r.data ?? []) as PracticeQuestion[]).slice(0, limit), error: err ? errorMessage(err) : null, note: null };
  }

  const { data, error } = await supabase.rpc("get_practice_questions", {
    p_subtopic: params.subtopicId ?? null,
    p_limit: limit,
    p_mode: params.mode ?? "random",
  });
  return { questions: (data ?? []) as PracticeQuestion[], error: error ? errorMessage(error) : null, note: null };
}

export type PracticeFeedback = {
  points: number;
  is_correct: boolean;
  best_label: string;
  options: { label: string; text: string; points: number }[];
  explanation: string;
  test_code: string;
};

export async function answerPractice(questionId: string, label: string) {
  await requireUser();
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("answer_practice", { p_question: questionId, p_label: label });
  if (error) return { error: errorMessage(error) };
  return { feedback: data as PracticeFeedback };
}

export async function toggleSavedQuestion(questionId: string, save: boolean) {
  const user = await requireUser();
  const supabase = await createClient();
  if (save) await supabase.from("saved_questions").upsert({ user_id: user.id, question_id: questionId });
  else await supabase.from("saved_questions").delete().eq("user_id", user.id).eq("question_id", questionId);
}

export async function reportQuestion(questionId: string, message: string) {
  const user = await requireUser();
  const msg = message.trim();
  if (msg.length < 5) return { error: "Tuliskan detail laporan (min. 5 karakter)." };
  const supabase = await createClient();
  const { error } = await supabase.from("question_reports").insert({ question_id: questionId, user_id: user.id, message: msg.slice(0, 2000) });
  return error ? { error: error.message } : { ok: true };
}

// ---------- Profile ----------
export async function updateProfile(_: { error?: string; ok?: boolean } | undefined, formData: FormData) {
  const user = await requireUser();
  const parsed = z
    .object({
      full_name: z.string().trim().min(2),
      phone: z.string().trim().max(20).optional(),
      target: z.enum(["cpns", "kedinasan"]),
      formation_type: z.string().min(1),
      exam_date: z.string().optional(),
      daily_study_minutes: z.coerce.number().int().min(15).max(600),
      font_scale: z.coerce.number().min(0.875).max(1.5),
    })
    .safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: "Periksa kembali isian Anda." };
  const supabase = await createClient();
  const { data: pg } = await supabase
    .from("passing_grade_profiles")
    .select("id")
    .eq("formation_type", parsed.data.formation_type)
    .order("year", { ascending: false })
    .limit(1)
    .maybeSingle();
  const { error } = await supabase
    .from("profiles")
    .update({ ...parsed.data, phone: parsed.data.phone || null, exam_date: parsed.data.exam_date || null, passing_grade_profile_id: pg?.id ?? null })
    .eq("id", user.id);
  if (error) return { error: error.message };
  revalidatePath("/", "layout");
  return { ok: true };
}
