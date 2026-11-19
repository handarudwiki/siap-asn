"use client";

import Link from "next/link";
import { useActionState, useState, useTransition } from "react";
import { Alert, Button, Field, Input, Select, Textarea, cn } from "@/components/ui";
import { findSimilar, saveQuestion } from "@/app/admin/soal/actions";
import type { ContentStatus, Question, TestCode } from "@/lib/types";

const LABELS = ["A", "B", "C", "D", "E"] as const;
type SubOpt = { id: string; label: string; test_code: string };

export function QuestionEditor({ question, subtopics, canPublish, locked }: { question: Question | null; subtopics: SubOpt[]; canPublish: boolean; locked: boolean }) {
  const [state, action, pending] = useActionState(saveQuestion, undefined);
  const [test, setTest] = useState<TestCode>(question?.test_code ?? "TWK");
  const [similar, setSimilar] = useState<{ id: string; stem: string; similarity: number }[]>([]);
  const [, start] = useTransition();
  const opt = (l: string) => question?.options.find((o) => o.label === l);
  const initialCorrect = question && question.test_code !== "TKP" ? question.options.find((o) => o.points === 5)?.label : "A";
  const [points, setPoints] = useState<Record<string, number>>(() => Object.fromEntries(LABELS.map((l, i) => [l, opt(l)?.points || 5 - i])));
  const status = (question?.status ?? "draft") as ContentStatus;
  const tkpValid = Object.values(points).sort().join() === "1,2,3,4,5";

  return (
    <form action={action} className="space-y-5">
      {question && <input type="hidden" name="id" value={question.id} />}
      {state?.error && <Alert>{state.error}</Alert>}
      {state?.ok && <Alert tone="green">{state.ok}</Alert>}
      {question?.reviewer_note && status === "draft" && <Alert tone="amber">Catatan reviewer: {question.reviewer_note}</Alert>}
      {locked && <Alert tone="amber">Soal ini dipakai di try-out yang sudah dikerjakan. Isi soal dikunci agar hasil lama tetap konsisten — gunakan “Buat versi baru”.</Alert>}

      <div className="grid gap-4 md:grid-cols-4">
        <Field label="Tes" htmlFor="test_code">
          <Select id="test_code" name="test_code" value={test} onChange={(e) => setTest(e.target.value as TestCode)} disabled={locked}>
            <option value="TWK">TWK</option>
            <option value="TIU">TIU</option>
            <option value="TKP">TKP</option>
          </Select>
          {locked && <input type="hidden" name="test_code" value={test} />}
        </Field>
        <div className="md:col-span-3">
          <Field label="Sub-topik" htmlFor="subtopic_id">
            <Select id="subtopic_id" name="subtopic_id" defaultValue={question?.subtopic_id ?? ""}>
              <option value="">—</option>
              {subtopics
                .filter((s) => s.test_code === test)
                .map((s) => (
                  <option key={s.id} value={s.id}>
                    {s.label}
                  </option>
                ))}
            </Select>
          </Field>
        </div>
      </div>

      <Field label="Teks soal" htmlFor="stem">
        <Textarea
          id="stem"
          name="stem"
          rows={5}
          defaultValue={question?.stem ?? ""}
          required
          readOnly={locked}
          onBlur={(e) => {
            const v = e.target.value;
            start(async () => setSimilar(await findSimilar(v, question?.id)));
          }}
        />
      </Field>
      {similar.length > 0 && (
        <Alert tone="amber">
          <p className="font-semibold">Kemungkinan duplikat:</p>
          <ul className="mt-1 list-disc pl-5">
            {similar.map((s) => (
              <li key={s.id}>
                <Link href={`/admin/soal/${s.id}`} target="_blank" className="underline">
                  {s.stem.slice(0, 90)}…
                </Link>{" "}
                ({Math.round(s.similarity * 100)}% mirip)
              </li>
            ))}
          </ul>
        </Alert>
      )}
      <Field label="URL gambar (opsional)" htmlFor="image_url">
        <Input id="image_url" name="image_url" type="url" defaultValue={question?.image_url ?? ""} readOnly={locked} />
      </Field>

      <fieldset>
        <legend className="mb-2 text-sm font-medium text-slate-700">
          Opsi jawaban {test === "TKP" ? "— beri nilai 1–5, setiap nilai sekali" : "— pilih satu kunci (5 poin)"}
        </legend>
        <div className="space-y-2">
          {LABELS.map((l) => (
            <div key={l} className="flex items-center gap-2">
              <span className="w-6 text-center font-bold">{l}</span>
              <Input name={`opt_${l}`} defaultValue={opt(l)?.text ?? ""} required readOnly={locked} aria-label={`Opsi ${l}`} />
              {test === "TKP" ? (
                <Select
                  name={`pts_${l}`}
                  value={points[l]}
                  onChange={(e) => setPoints((p) => ({ ...p, [l]: Number(e.target.value) }))}
                  className="w-20"
                  aria-label={`Poin opsi ${l}`}
                  disabled={locked}
                >
                  {[1, 2, 3, 4, 5].map((n) => (
                    <option key={n} value={n}>
                      {n}
                    </option>
                  ))}
                </Select>
              ) : (
                <label className="flex items-center gap-1 whitespace-nowrap text-xs">
                  <input type="radio" name="correct" value={l} defaultChecked={initialCorrect === l} disabled={locked} /> Kunci
                </label>
              )}
              {locked && test === "TKP" && <input type="hidden" name={`pts_${l}`} value={points[l]} />}
            </div>
          ))}
          {locked && test !== "TKP" && <input type="hidden" name="correct" value={initialCorrect} />}
        </div>
        {test === "TKP" && !tkpValid && <p className="mt-2 text-xs text-red-600">Nilai 1–5 harus dipakai masing-masing satu kali.</p>}
      </fieldset>

      <Field label="Pembahasan" htmlFor="explanation">
        <Textarea id="explanation" name="explanation" rows={4} defaultValue={question?.explanation ?? ""} readOnly={locked} />
      </Field>

      <div className="grid gap-4 md:grid-cols-4">
        <Field label="Kesulitan" htmlFor="difficulty">
          <Select id="difficulty" name="difficulty" defaultValue={question?.difficulty ?? "medium"}>
            <option value="easy">Mudah</option>
            <option value="medium">Sedang</option>
            <option value="hard">Sulit</option>
          </Select>
        </Field>
        <Field label="Penggunaan" htmlFor="usage">
          <Select id="usage" name="usage" defaultValue={question?.usage ?? "both"}>
            <option value="both">Latihan & try-out</option>
            <option value="practice">Latihan saja</option>
            <option value="tryout">Try-out saja</option>
          </Select>
        </Field>
        <Field label="Sumber" htmlFor="source">
          <Input id="source" name="source" defaultValue={question?.source ?? ""} />
        </Field>
        <Field label="Tahun" htmlFor="year">
          <Input id="year" name="year" type="number" defaultValue={question?.year ?? new Date().getFullYear()} />
        </Field>
      </div>

      {canPublish && status === "in_review" && (
        <Field label="Catatan untuk editor (jika ditolak)" htmlFor="reviewer_note">
          <Input id="reviewer_note" name="reviewer_note" />
        </Field>
      )}

      <div className={cn("flex flex-wrap gap-2 border-t border-slate-100 pt-4")}>
        <Button name="intent" value="save" variant="secondary" disabled={pending || (test === "TKP" && !tkpValid)}>
          Simpan
        </Button>
        {!question && (
          <Button name="intent" value="new" variant="secondary" disabled={pending}>
            Simpan & buat lagi
          </Button>
        )}
        {status === "draft" && (
          <Button name="intent" value="submit" disabled={pending || (test === "TKP" && !tkpValid)}>
            Ajukan review
          </Button>
        )}
        {canPublish && status !== "published" && (
          <Button name="intent" value="publish" disabled={pending || (test === "TKP" && !tkpValid)}>
            Terbitkan
          </Button>
        )}
        {canPublish && status === "in_review" && (
          <Button name="intent" value="reject" variant="danger" disabled={pending}>
            Tolak
          </Button>
        )}
        {question && status !== "archived" && (
          <Button name="intent" value="archive" variant="ghost" disabled={pending}>
            Arsipkan
          </Button>
        )}
      </div>
    </form>
  );
}
