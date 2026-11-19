"use client";

import Link from "next/link";
import { useEffect, useRef, useState, useTransition } from "react";
import { Alert, Badge, Button, Card, LinkButton, Progress, Textarea, cn } from "@/components/ui";
import { answerPractice, reportQuestion, toggleSavedQuestion, type PracticeFeedback, type PracticeQuestion } from "@/app/(app)/actions";
import { duration } from "@/lib/format";

export function PracticeSession({ questions, title, timerMinutes }: { questions: PracticeQuestion[]; title: string; timerMinutes: number | null }) {
  const [idx, setIdx] = useState(0);
  const [selected, setSelected] = useState<string | null>(null);
  const [feedback, setFeedback] = useState<Record<string, PracticeFeedback>>({});
  const [saved, setSaved] = useState<Record<string, boolean>>({});
  const [error, setError] = useState<string | null>(null);
  const [reporting, setReporting] = useState(false);
  const [reportText, setReportText] = useState("");
  const [reportDone, setReportDone] = useState(false);
  const [pending, start] = useTransition();
  const [remaining, setRemaining] = useState(timerMinutes ? timerMinutes * 60000 : null);
  const startedAt = useRef<number | null>(null);

  useEffect(() => {
    if (!timerMinutes) return;
    startedAt.current ??= Date.now();
    const t = setInterval(() => setRemaining(Math.max(0, timerMinutes * 60000 - (Date.now() - startedAt.current!))), 500);
    return () => clearInterval(t);
  }, [timerMinutes]);

  const finished = idx >= questions.length || remaining === 0;
  const answered = Object.values(feedback);
  const score = answered.reduce((s, f) => s + f.points, 0);
  const maxScore = answered.length * 5;

  if (finished) {
    const correct = answered.filter((f) => f.is_correct).length;
    return (
      <Card className="mx-auto max-w-xl text-center">
        <p className="text-sm font-semibold text-slate-500">{remaining === 0 ? "Waktu habis" : "Latihan selesai"}</p>
        <p className="mt-2 text-5xl font-extrabold">
          {score}
          <span className="text-xl text-slate-400">/{maxScore}</span>
        </p>
        <p className="mt-2 text-slate-600">
          {correct} dari {answered.length} soal mendapat poin penuh.
        </p>
        <div className="mt-6 flex flex-col justify-center gap-2 sm:flex-row">
          <Button onClick={() => window.location.reload()}>Set baru</Button>
          <LinkButton href="/latihan" variant="secondary">
            Kembali ke latihan
          </LinkButton>
        </div>
      </Card>
    );
  }

  const q = questions[idx];
  const fb = feedback[q.id];

  function submit() {
    if (!selected) return;
    setError(null);
    start(async () => {
      const res = await answerPractice(q.id, selected);
      if ("error" in res && res.error) setError(res.error);
      else if ("feedback" in res && res.feedback) setFeedback((f) => ({ ...f, [q.id]: res.feedback! }));
    });
  }

  function next() {
    setIdx((i) => i + 1);
    setSelected(null);
    setReporting(false);
    setReportDone(false);
    setReportText("");
  }

  return (
    <div className="mx-auto max-w-3xl">
      <div className="mb-4 flex items-center justify-between gap-4">
        <div>
          <Link href="/latihan" className="text-sm text-brand-700 hover:underline">
            ← Latihan
          </Link>
          <h1 className="text-lg font-bold">{title}</h1>
        </div>
        {remaining !== null && (
          <span className={cn("rounded-lg px-3 py-1 font-mono font-bold", remaining < 60000 ? "bg-red-50 text-red-600" : "bg-slate-100")}>{duration(remaining)}</span>
        )}
      </div>
      <Progress value={(idx / questions.length) * 100} />
      <p className="mt-2 text-xs text-slate-500">
        Soal {idx + 1} dari {questions.length}
      </p>

      <Card className="mt-4">
        <div className="mb-3 flex items-center gap-2">
          <Badge tone="brand">{q.test_code}</Badge>
          <Badge>{q.difficulty === "easy" ? "Mudah" : q.difficulty === "hard" ? "Sulit" : "Sedang"}</Badge>
        </div>
        <p className="whitespace-pre-line font-medium leading-relaxed">{q.stem}</p>
        {q.image_url && (
          // eslint-disable-next-line @next/next/no-img-element
          <img src={q.image_url} alt="Gambar soal" className="mt-4 max-h-80 rounded-lg" />
        )}
        <div className="mt-5 space-y-2" role="radiogroup" aria-label="Pilihan jawaban">
          {q.options.map((o) => {
            const full = fb?.options.find((x) => x.label === o.label);
            const isBest = fb && fb.best_label === o.label;
            const isPicked = (fb ? undefined : selected) === o.label || (fb && selected === o.label);
            return (
              <button
                key={o.label}
                role="radio"
                aria-checked={selected === o.label}
                disabled={!!fb}
                onClick={() => setSelected(o.label)}
                className={cn(
                  "flex w-full items-start gap-3 rounded-xl border px-4 py-3 text-left text-sm transition",
                  !fb && selected === o.label && "border-brand-500 bg-brand-50",
                  !fb && selected !== o.label && "border-slate-200 hover:border-slate-300",
                  fb && isBest && "border-emerald-500 bg-emerald-50",
                  fb && !isBest && isPicked && "border-red-400 bg-red-50",
                  fb && !isBest && !isPicked && "border-slate-200 opacity-80",
                )}
              >
                <span className={cn("grid h-6 w-6 shrink-0 place-items-center rounded-full text-xs font-bold", selected === o.label ? "bg-brand-600 text-white" : "bg-slate-100")}>{o.label}</span>
                <span className="flex-1">{o.text}</span>
                {fb && q.test_code === "TKP" && <span className="text-xs font-bold text-slate-500">{full?.points} poin</span>}
              </button>
            );
          })}
        </div>

        {error && (
          <div className="mt-4">
            <Alert>
              {error} {error.includes("Upgrade") && <Link href="/paket" className="font-semibold underline">Lihat paket</Link>}
            </Alert>
          </div>
        )}

        {fb && (
          <div className={cn("mt-5 rounded-xl p-4", fb.is_correct ? "bg-emerald-50" : "bg-amber-50")}>
            <p className="font-bold">
              {q.test_code === "TKP" ? `Anda mendapat ${fb.points} dari 5 poin` : fb.is_correct ? "Benar! +5" : `Kurang tepat. Jawaban: ${fb.best_label}`}
            </p>
            <p className="mt-2 whitespace-pre-line text-sm text-slate-700">{fb.explanation || "Pembahasan belum tersedia."}</p>
          </div>
        )}

        <div className="mt-5 flex flex-wrap items-center justify-between gap-3">
          <div className="flex gap-2">
            <Button
              size="sm"
              variant="ghost"
              onClick={() => {
                const v = !saved[q.id];
                setSaved((s) => ({ ...s, [q.id]: v }));
                start(() => toggleSavedQuestion(q.id, v));
              }}
            >
              {saved[q.id] ? "★ Tersimpan" : "☆ Simpan soal"}
            </Button>
            <Button size="sm" variant="ghost" onClick={() => setReporting((r) => !r)}>
              ⚑ Laporkan
            </Button>
          </div>
          {fb ? (
            <Button onClick={next}>{idx + 1 === questions.length ? "Lihat hasil" : "Soal berikutnya →"}</Button>
          ) : (
            <Button onClick={submit} disabled={!selected || pending}>
              {pending ? "Memeriksa…" : "Periksa jawaban"}
            </Button>
          )}
        </div>

        {reporting && (
          <div className="mt-4 rounded-xl border border-slate-200 p-4">
            {reportDone ? (
              <p className="text-sm text-emerald-700">Terima kasih! Laporan Anda diteruskan ke tim konten.</p>
            ) : (
              <>
                <Textarea rows={3} value={reportText} onChange={(e) => setReportText(e.target.value)} placeholder="Apa yang salah dari soal ini? (kunci, typo, pembahasan…)" />
                <Button
                  size="sm"
                  className="mt-2"
                  onClick={() =>
                    start(async () => {
                      const r = await reportQuestion(q.id, reportText);
                      if ("error" in r && r.error) setError(r.error);
                      else setReportDone(true);
                    })
                  }
                >
                  Kirim laporan
                </Button>
              </>
            )}
          </div>
        )}
      </Card>
    </div>
  );
}
