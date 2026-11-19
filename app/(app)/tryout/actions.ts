"use server";

import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";
import { errorMessage } from "@/lib/format";

export async function startTryout(tryoutId: string): Promise<{ error: string } | never> {
  await requireUser();
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("start_tryout", { p_tryout: tryoutId });
  if (error) return { error: errorMessage(error) };
  redirect(`/ujian/${data}`);
}

export async function saveAnswer(attemptId: string, questionId: string, label: string | null, flagged: boolean, timeMs: number) {
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("save_answer", {
    p_attempt: attemptId,
    p_question: questionId,
    p_label: label,
    p_flagged: flagged,
    p_time_ms: Math.round(timeMs),
  });
  if (error) {
    const code = ["TIME_UP", "ALREADY_SUBMITTED"].find((c) => error.message.includes(c));
    return { ok: false as const, code: code ?? "ERROR", message: errorMessage(error) };
  }
  return { ok: true as const, serverNow: (data as { server_now: string }).server_now };
}

export async function submitAttempt(attemptId: string) {
  const supabase = await createClient();
  const { error } = await supabase.rpc("submit_attempt", { p_attempt: attemptId });
  if (error && !error.message.includes("ALREADY_SUBMITTED")) return { error: errorMessage(error) };
  redirect(`/tryout/hasil/${attemptId}`);
}

export async function logTabSwitch(attemptId: string) {
  const supabase = await createClient();
  await supabase.rpc("log_tab_switch", { p_attempt: attemptId });
}
