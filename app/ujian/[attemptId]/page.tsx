import { Suspense } from "react";
import { notFound, redirect } from "next/navigation";
import type { Metadata } from "next";
import { ExamScreen, type ExamQuestion } from "@/components/tryout/exam-screen";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Ujian berlangsung", robots: { index: false } };
export const instant = false;

async function Exam({ params }: { params: PageProps<"/ujian/[attemptId]">["params"] }) {
  const { attemptId } = await params;
  await requireUser();
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("get_attempt", { p_attempt: attemptId });
  if (error || !data) notFound();
  const payload = data as {
    attempt: { id: string; title: string; deadline: string; submitted_at: string | null; server_now: string };
    questions: ExamQuestion[];
  };
  if (payload.attempt.submitted_at) redirect(`/tryout/hasil/${attemptId}`);
  return (
    <ExamScreen
      attemptId={attemptId}
      title={payload.attempt.title}
      deadline={payload.attempt.deadline}
      serverNow={payload.attempt.server_now}
      questions={payload.questions}
    />
  );
}

export default function ExamPage(props: PageProps<"/ujian/[attemptId]">) {
  return (
    <Suspense fallback={<div className="grid min-h-screen place-items-center text-slate-500">Menyiapkan soal…</div>}>
      <Exam params={props.params} />
    </Suspense>
  );
}
