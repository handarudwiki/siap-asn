"use client";

import { useMemo, useState } from "react";
import { Badge, cn } from "@/components/ui";

export type ReviewItem = {
  id: string;
  n: number;
  test_code: "TWK" | "TIU" | "TKP";
  stem: string;
  image_url: string | null;
  subtopic: string | null;
  options: { label: string; text: string; points?: number }[];
  explanation: string | null;
  answer: string | null;
  points: number | null;
  time_spent_ms: number;
};

export function ReviewList({ items }: { items: ReviewItem[] }) {
  const [filter, setFilter] = useState<"all" | "wrong" | "blank" | "TWK" | "TIU" | "TKP">("all");
  const shown = useMemo(
    () =>
      items.filter((i) =>
        filter === "all" ? true : filter === "wrong" ? i.answer && (i.points ?? 0) < 5 : filter === "blank" ? !i.answer : i.test_code === filter,
      ),
    [items, filter],
  );
  const filters: [typeof filter, string][] = [
    ["all", "Semua"],
    ["wrong", "Tidak penuh"],
    ["blank", "Kosong"],
    ["TWK", "TWK"],
    ["TIU", "TIU"],
    ["TKP", "TKP"],
  ];
  return (
    <div>
      <div className="mb-4 flex flex-wrap gap-2">
        {filters.map(([k, l]) => (
          <button
            key={k}
            onClick={() => setFilter(k)}
            className={cn("rounded-full px-3 py-1 text-sm font-medium", filter === k ? "bg-brand-600 text-white" : "bg-white text-slate-600 ring-1 ring-slate-200")}
          >
            {l}
          </button>
        ))}
      </div>
      <ol className="space-y-4">
        {shown.map((it) => {
          const best = [...it.options].sort((a, b) => (b.points ?? 0) - (a.points ?? 0))[0];
          return (
            <li key={it.id} className="rounded-2xl border border-slate-200 bg-white p-5">
              <div className="mb-2 flex flex-wrap items-center gap-2 text-xs">
                <b>No. {it.n}</b>
                <Badge tone="brand">{it.test_code}</Badge>
                {it.subtopic && <Badge>{it.subtopic}</Badge>}
                <Badge tone={!it.answer ? "slate" : (it.points ?? 0) === 5 ? "green" : it.test_code === "TKP" ? "amber" : "red"}>
                  {!it.answer ? "Kosong · 0" : `${it.points ?? 0} poin`}
                </Badge>
                <span className="text-slate-400">{Math.round(it.time_spent_ms / 1000)} dtk</span>
              </div>
              <p className="whitespace-pre-line text-sm font-medium">{it.stem}</p>
              {it.image_url && (
                // eslint-disable-next-line @next/next/no-img-element
                <img src={it.image_url} alt="Gambar soal" className="mt-3 max-h-72 rounded-lg" />
              )}
              <ul className="mt-3 space-y-1.5 text-sm">
                {it.options.map((o) => (
                  <li
                    key={o.label}
                    className={cn(
                      "flex gap-2 rounded-lg px-3 py-2",
                      best && o.label === best.label && o.points !== undefined ? "bg-emerald-50 text-emerald-900" : o.label === it.answer ? "bg-red-50 text-red-900" : "bg-slate-50",
                    )}
                  >
                    <b>{o.label}.</b>
                    <span className="flex-1">{o.text}</span>
                    {o.label === it.answer && <span className="text-xs font-semibold">Jawaban Anda</span>}
                    {it.test_code === "TKP" && o.points !== undefined && <span className="text-xs font-bold">{o.points}</span>}
                  </li>
                ))}
              </ul>
              {it.explanation !== null && (
                <div className="mt-3 rounded-lg bg-brand-50 p-3 text-sm text-slate-700">
                  <b className="text-brand-800">Pembahasan: </b>
                  <span className="whitespace-pre-line">{it.explanation || "Belum tersedia."}</span>
                </div>
              )}
            </li>
          );
        })}
      </ol>
    </div>
  );
}
