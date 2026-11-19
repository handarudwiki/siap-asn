"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { Button, Logo, cn } from "@/components/ui";
import { logTabSwitch, saveAnswer, submitAttempt } from "@/app/(app)/tryout/actions";
import { duration } from "@/lib/format";

export type ExamQuestion = {
  id: string;
  n: number;
  test_code: "TWK" | "TIU" | "TKP";
  stem: string;
  image_url: string | null;
  options: { label: string; text: string }[];
  answer: string | null;
  flagged: boolean;
};

type AnswerState = Record<string, { label: string | null; flagged: boolean }>;
type Pending = { label: string | null; flagged: boolean; timeMs: number };
type SaveStatus = "saved" | "saving" | "offline";

const LETTERS = ["A", "B", "C", "D", "E"];

export function ExamScreen({
  attemptId,
  title,
  deadline,
  serverNow,
  questions,
}: {
  attemptId: string;
  title: string;
  deadline: string;
  serverNow: string;
  questions: ExamQuestion[];
}) {
  const router = useRouter();
  const storageKey = `sa-attempt-${attemptId}`;
  const [offset] = useState(() => new Date(serverNow).getTime() - Date.now());
  const deadlineMs = new Date(deadline).getTime();
  const [now, setNow] = useState(() => Date.now() + offset);
  const [idx, setIdx] = useState(0);
  const [answers, setAnswers] = useState<AnswerState>(() => {
    const base: AnswerState = Object.fromEntries(questions.map((q) => [q.id, { label: q.answer, flagged: q.flagged }]));
    // merge unsynced local answers (e.g. after a disconnect)
    try {
      const local = JSON.parse(localStorage.getItem(`sa-attempt-${attemptId}`) ?? "{}") as AnswerState;
      return { ...base, ...local };
    } catch {
      return base;
    }
  });
  const [status, setStatus] = useState<SaveStatus>("saved");
  const [showSubmit, setShowSubmit] = useState(false);
  const [showNav, setShowNav] = useState(false);
  const [warning, setWarning] = useState<string | null>(null);
  const [fontSize, setFontSize] = useState(1);
  const [submitting, setSubmitting] = useState(false);

  const pending = useRef<Map<string, Pending>>(new Map());
  const flushing = useRef(false);
  const shownAt = useRef<number>(0);
  const finished = useRef(false);

  const remaining = deadlineMs - now;
  const q = questions[idx];

  // ---------- persistence ----------
  const finish = useCallback(async () => {
    if (finished.current) return;
    finished.current = true;
    setSubmitting(true);
    try {
      localStorage.removeItem(storageKey);
    } catch {}
    await submitAttempt(attemptId);
  }, [attemptId, storageKey]);

  const flush = useCallback(async () => {
    if (flushing.current) return;
    flushing.current = true;
    try {
      while (pending.current.size) {
        const [qid, p] = pending.current.entries().next().value as [string, Pending];
        setStatus("saving");
        let res: Awaited<ReturnType<typeof saveAnswer>>;
        try {
          res = await saveAnswer(attemptId, qid, p.label, p.flagged, p.timeMs);
        } catch {
          setStatus("offline");
          setTimeout(() => void flush(), 3000);
          return;
        }
        if (!res.ok) {
          if (res.code === "TIME_UP" || res.code === "ALREADY_SUBMITTED") {
            finished.current = true;
            router.replace(`/tryout/hasil/${attemptId}`);
            return;
          }
          setStatus("offline");
          setTimeout(() => void flush(), 3000);
          return;
        }
        // only drop if unchanged meanwhile
        if (pending.current.get(qid) === p) pending.current.delete(qid);
      }
      setStatus("saved");
      try {
        localStorage.removeItem(storageKey);
      } catch {}
    } finally {
      flushing.current = false;
    }
  }, [attemptId, router, storageKey]);

  const queue = useCallback(
    (qid: string, next: { label: string | null; flagged: boolean }, extraTime = 0) => {
      const prev = pending.current.get(qid);
      pending.current.set(qid, { ...next, timeMs: (prev?.timeMs ?? 0) + extraTime });
      try {
        const local = JSON.parse(localStorage.getItem(storageKey) ?? "{}");
        local[qid] = next;
        localStorage.setItem(storageKey, JSON.stringify(local));
      } catch {}
      void flush();
    },
    [flush, storageKey],
  );

  // push any locally cached answers that the server hasn't seen
  useEffect(() => {
    try {
      const local = JSON.parse(localStorage.getItem(storageKey) ?? "{}") as AnswerState;
      for (const [qid, a] of Object.entries(local)) {
        const server = questions.find((x) => x.id === qid);
        if (server && (server.answer !== a.label || server.flagged !== a.flagged)) pending.current.set(qid, { ...a, timeMs: 0 });
      }
      if (pending.current.size) void flush();
    } catch {}
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ---------- timer ----------
  useEffect(() => {
    const t = setInterval(() => setNow(Date.now() + offset), 250);
    return () => clearInterval(t);
  }, [offset]);

  useEffect(() => {
    if (remaining <= 0 && !finished.current) void flush().then(finish);
  }, [remaining, flush, finish]);

  // ---------- time-on-question tracking ----------
  useEffect(() => {
    shownAt.current = Date.now();
  }, [idx]);

  const go = useCallback(
    (to: number) => {
      if (to < 0 || to >= questions.length || to === idx) return;
      const spent = Date.now() - shownAt.current;
      const cur = questions[idx];
      if (spent > 500) queue(cur.id, answers[cur.id], spent);
      setIdx(to);
      setShowNav(false);
    },
    [answers, idx, queue, questions],
  );

  const choose = useCallback(
    (label: string) => {
      const next = { ...answers[q.id], label: answers[q.id].label === label ? null : label };
      setAnswers((a) => ({ ...a, [q.id]: next }));
      queue(q.id, next);
    },
    [answers, q, queue],
  );

  const toggleFlag = useCallback(() => {
    const next = { ...answers[q.id], flagged: !answers[q.id].flagged };
    setAnswers((a) => ({ ...a, [q.id]: next }));
    queue(q.id, next);
  }, [answers, q, queue]);

  // ---------- anti-cheat basics (FR-L38) ----------
  useEffect(() => {
    const onVis = () => {
      if (document.visibilityState === "hidden" && !finished.current) {
        void logTabSwitch(attemptId);
        setWarning("Perpindahan tab terdeteksi dan dicatat. Tetap di halaman ujian.");
      }
    };
    const block = (e: Event) => e.preventDefault();
    const beforeUnload = (e: BeforeUnloadEvent) => {
      if (pending.current.size && !finished.current) e.preventDefault();
    };
    document.addEventListener("visibilitychange", onVis);
    document.addEventListener("copy", block);
    document.addEventListener("cut", block);
    document.addEventListener("contextmenu", block);
    window.addEventListener("beforeunload", beforeUnload);
    const online = () => void flush();
    window.addEventListener("online", online);
    return () => {
      document.removeEventListener("visibilitychange", onVis);
      document.removeEventListener("copy", block);
      document.removeEventListener("cut", block);
      document.removeEventListener("contextmenu", block);
      window.removeEventListener("beforeunload", beforeUnload);
      window.removeEventListener("online", online);
    };
  }, [attemptId, flush]);

  // ---------- keyboard ----------
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (showSubmit || (e.target as HTMLElement)?.tagName === "TEXTAREA") return;
      const k = e.key.toUpperCase();
      const opt = q.options.findIndex((_, i) => LETTERS[i] === k);
      if (opt >= 0) choose(q.options[opt].label);
      else if (e.key === "ArrowRight") go(idx + 1);
      else if (e.key === "ArrowLeft") go(idx - 1);
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [choose, go, idx, q, showSubmit]);

  const counts = useMemo(() => {
    const vals = Object.values(answers);
    return {
      answered: vals.filter((a) => a.label).length,
      flagged: vals.filter((a) => a.flagged).length,
      total: questions.length,
    };
  }, [answers, questions.length]);

  const sections = useMemo(() => {
    const out: { code: string; from: number; to: number }[] = [];
    questions.forEach((x, i) => {
      const last = out.at(-1);
      if (last && last.code === x.test_code) last.to = i;
      else out.push({ code: x.test_code, from: i, to: i });
    });
    return out;
  }, [questions]);

  const lowTime = remaining < 5 * 60000;
  // options are displayed A–E in (possibly shuffled) order; the stored value is the original label
  const current = answers[q.id];

  const Navigator = (
    <div className="space-y-4">
      {sections.map((s) => (
        <div key={s.code}>
          <p className="mb-2 text-xs font-bold text-slate-500">{s.code}</p>
          <div className="grid grid-cols-8 gap-1.5 sm:grid-cols-10 lg:grid-cols-6 xl:grid-cols-8">
            {questions.slice(s.from, s.to + 1).map((x, j) => {
              const i = s.from + j;
              const a = answers[x.id];
              return (
                <button
                  key={x.id}
                  onClick={() => go(i)}
                  aria-label={`Soal ${i + 1}${a.label ? ", terjawab" : ""}${a.flagged ? ", ragu-ragu" : ""}`}
                  aria-current={i === idx}
                  className={cn(
                    "grid h-8 place-items-center rounded-md text-xs font-semibold transition",
                    a.flagged ? "bg-amber-400 text-slate-900" : a.label ? "bg-emerald-500 text-white" : "bg-slate-100 text-slate-600 hover:bg-slate-200",
                    i === idx && "ring-2 ring-brand-600 ring-offset-1",
                  )}
                >
                  {i + 1}
                </button>
              );
            })}
          </div>
        </div>
      ))}
      <div className="flex flex-wrap gap-3 text-[11px] text-slate-500">
        <span className="flex items-center gap-1"><i className="h-3 w-3 rounded bg-emerald-500" /> Terjawab</span>
        <span className="flex items-center gap-1"><i className="h-3 w-3 rounded bg-amber-400" /> Ragu-ragu</span>
        <span className="flex items-center gap-1"><i className="h-3 w-3 rounded bg-slate-200" /> Belum</span>
      </div>
    </div>
  );

  return (
    <div className="no-select flex min-h-screen flex-col bg-slate-100">
      <header className="sticky top-0 z-30 border-b border-slate-200 bg-white">
        <div className="mx-auto flex max-w-7xl items-center justify-between gap-3 px-4 py-3">
          <div className="flex min-w-0 items-center gap-3">
            <Logo className="hidden sm:inline-flex" />
            <p className="truncate text-sm font-semibold text-slate-700">{title}</p>
          </div>
          <div className="flex items-center gap-2 sm:gap-4">
            <span
              className={cn(
                "text-xs",
                status === "saved" ? "text-emerald-600" : status === "saving" ? "text-slate-500" : "font-semibold text-red-600",
              )}
              aria-live="polite"
            >
              {status === "saved" ? "✓ Tersimpan" : status === "saving" ? "Menyimpan…" : "Offline – menyinkron ulang"}
            </span>
            <span
              className={cn("rounded-lg px-3 py-1.5 font-mono text-lg font-bold tabular-nums", lowTime ? "animate-pulse bg-red-600 text-white" : "bg-slate-900 text-white")}
              role="timer"
              aria-label="Sisa waktu"
            >
              {duration(remaining)}
            </span>
          </div>
        </div>
      </header>

      {warning && (
        <div className="bg-amber-100 px-4 py-2 text-center text-sm text-amber-900" role="alert">
          {warning}{" "}
          <button className="ml-2 font-semibold underline" onClick={() => setWarning(null)}>
            Tutup
          </button>
        </div>
      )}

      <div className="mx-auto flex w-full max-w-7xl flex-1 gap-6 px-4 py-6">
        <main className="min-w-0 flex-1">
          <div className="rounded-2xl bg-white p-5 shadow-sm sm:p-8" style={{ fontSize: `${fontSize}rem` }}>
            <div className="mb-4 flex flex-wrap items-center justify-between gap-2">
              <p className="text-sm font-bold text-brand-700">
                Soal {idx + 1} <span className="font-medium text-slate-400">/ {questions.length}</span> · {q.test_code}
              </p>
              <div className="flex items-center gap-1" aria-label="Ukuran huruf">
                <button className="rounded border border-slate-200 px-2 text-sm" onClick={() => setFontSize((f) => Math.max(0.875, f - 0.125))} aria-label="Perkecil huruf">
                  A−
                </button>
                <button className="rounded border border-slate-200 px-2 text-sm" onClick={() => setFontSize((f) => Math.min(1.5, f + 0.125))} aria-label="Perbesar huruf">
                  A+
                </button>
              </div>
            </div>
            <p className="whitespace-pre-line leading-relaxed text-slate-900">{q.stem}</p>
            {q.image_url && (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={q.image_url} alt="Gambar soal" className="mt-4 max-h-96 rounded-lg" draggable={false} />
            )}
            <div className="mt-6 space-y-2.5" role="radiogroup" aria-label="Pilihan jawaban">
              {q.options.map((o, i) => {
                const picked = current.label === o.label;
                return (
                  <button
                    key={o.label}
                    role="radio"
                    aria-checked={picked}
                    onClick={() => choose(o.label)}
                    className={cn(
                      "flex w-full items-start gap-3 rounded-xl border-2 px-4 py-3 text-left transition",
                      picked ? "border-brand-600 bg-brand-50" : "border-slate-200 hover:border-slate-300",
                    )}
                  >
                    <span className={cn("grid h-7 w-7 shrink-0 place-items-center rounded-full text-sm font-bold", picked ? "bg-brand-600 text-white" : "bg-slate-100 text-slate-700")}>
                      {LETTERS[i]}
                    </span>
                    <span className="pt-0.5">{o.text}</span>
                  </button>
                );
              })}
            </div>
          </div>

          <div className="mt-4 flex flex-wrap items-center justify-between gap-3">
            <Button variant="secondary" onClick={() => go(idx - 1)} disabled={idx === 0}>
              ← Sebelumnya
            </Button>
            <Button variant={current.flagged ? "accent" : "secondary"} onClick={toggleFlag} aria-pressed={current.flagged}>
              {current.flagged ? "★ Ragu-ragu" : "☆ Ragu-ragu"}
            </Button>
            {idx < questions.length - 1 ? (
              <Button onClick={() => go(idx + 1)}>Berikutnya →</Button>
            ) : (
              <Button variant="danger" onClick={() => setShowSubmit(true)}>
                Selesai
              </Button>
            )}
          </div>

          <button className="mt-4 w-full rounded-xl border border-slate-300 bg-white py-3 text-sm font-semibold lg:hidden" onClick={() => setShowNav((s) => !s)} aria-expanded={showNav}>
            Navigasi soal · {counts.answered}/{counts.total} terjawab
          </button>
          {showNav && <div className="mt-3 rounded-2xl bg-white p-4 lg:hidden">{Navigator}</div>}
        </main>

        <aside className="hidden w-80 shrink-0 lg:block">
          <div className="sticky top-24 space-y-4 rounded-2xl bg-white p-5 shadow-sm">
            <div className="grid grid-cols-3 gap-2 text-center">
              <div className="rounded-lg bg-emerald-50 p-2">
                <p className="text-lg font-bold text-emerald-700">{counts.answered}</p>
                <p className="text-[11px] text-emerald-700">Terjawab</p>
              </div>
              <div className="rounded-lg bg-slate-50 p-2">
                <p className="text-lg font-bold">{counts.total - counts.answered}</p>
                <p className="text-[11px] text-slate-500">Belum</p>
              </div>
              <div className="rounded-lg bg-amber-50 p-2">
                <p className="text-lg font-bold text-amber-700">{counts.flagged}</p>
                <p className="text-[11px] text-amber-700">Ragu</p>
              </div>
            </div>
            <div className="max-h-[55vh] overflow-y-auto pr-1">{Navigator}</div>
            <Button variant="danger" className="w-full" onClick={() => setShowSubmit(true)}>
              Kumpulkan jawaban
            </Button>
          </div>
        </aside>
      </div>

      {showSubmit && (
        <div className="fixed inset-0 z-50 grid place-items-center bg-slate-900/50 p-4" role="dialog" aria-modal="true" aria-labelledby="submit-title">
          <div className="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl">
            <h2 id="submit-title" className="text-lg font-bold">
              Kumpulkan jawaban?
            </h2>
            <p className="mt-2 text-sm text-slate-600">
              Anda menjawab <b>{counts.answered}</b> dari {counts.total} soal.
              {counts.total - counts.answered > 0 && (
                <>
                  {" "}
                  <b className="text-red-600">{counts.total - counts.answered} soal belum dijawab</b> (bernilai 0).
                </>
              )}
              {counts.flagged > 0 && <> {counts.flagged} soal masih ditandai ragu-ragu.</>}
            </p>
            <p className="mt-2 text-sm text-slate-600">Sisa waktu: {duration(remaining)}. Setelah dikumpulkan, jawaban tidak bisa diubah.</p>
            <div className="mt-6 flex justify-end gap-2">
              <Button variant="ghost" onClick={() => setShowSubmit(false)} disabled={submitting}>
                Kembali
              </Button>
              <Button
                variant="danger"
                disabled={submitting}
                onClick={async () => {
                  await flush();
                  await finish();
                }}
              >
                {submitting ? "Mengumpulkan…" : "Ya, kumpulkan"}
              </Button>
            </div>
          </div>
        </div>
      )}

      {submitting && !showSubmit && (
        <div className="fixed inset-0 z-50 grid place-items-center bg-white/80">
          <p className="font-semibold">Waktu habis — mengumpulkan jawaban…</p>
        </div>
      )}
    </div>
  );
}
