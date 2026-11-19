"use client";

import { useActionState, useState } from "react";
import { Alert, Button, Field, Input, Select, cn } from "@/components/ui";
import { FORMATIONS } from "@/lib/types";
import { saveOnboarding } from "@/app/onboarding/actions";

export function OnboardingForm({ defaultName }: { defaultName: string }) {
  const [state, action, pending] = useActionState(saveOnboarding, undefined);
  const [target, setTarget] = useState<"cpns" | "kedinasan">("cpns");
  return (
    <form action={action} className="space-y-6">
      {state?.error && <Alert>{state.error}</Alert>}
      <Field label="Nama lengkap" htmlFor="full_name">
        <Input id="full_name" name="full_name" defaultValue={defaultName} required />
      </Field>
      <fieldset>
        <legend className="mb-2 text-sm font-medium text-slate-700">Target ujian</legend>
        <input type="hidden" name="target" value={target} />
        <div className="grid grid-cols-2 gap-3">
          {(
            [
              ["cpns", "CPNS", "Seleksi Calon PNS"],
              ["kedinasan", "Sekolah Kedinasan", "STAN, IPDN, STIS, dll."],
            ] as const
          ).map(([v, t, d]) => (
            <button
              type="button"
              key={v}
              onClick={() => setTarget(v)}
              aria-pressed={target === v}
              className={cn(
                "rounded-xl border p-4 text-left transition",
                target === v ? "border-brand-500 bg-brand-50 ring-2 ring-brand-200" : "border-slate-200 hover:border-slate-300",
              )}
            >
              <p className="font-semibold">{t}</p>
              <p className="text-xs text-slate-500">{d}</p>
            </button>
          ))}
        </div>
      </fieldset>
      <Field label="Jenis formasi" htmlFor="formation_type" hint="Menentukan passing grade yang dipakai untuk menilai hasil try-out Anda.">
        <Select id="formation_type" name="formation_type" defaultValue="umum">
          {FORMATIONS.map((f) => (
            <option key={f.value} value={f.value}>
              {f.label}
            </option>
          ))}
        </Select>
      </Field>
      <div className="grid gap-4 sm:grid-cols-2">
        <Field label="Perkiraan tanggal ujian" htmlFor="exam_date">
          <Input id="exam_date" name="exam_date" type="date" />
        </Field>
        <Field label="Waktu belajar per hari" htmlFor="daily_study_minutes">
          <Select id="daily_study_minutes" name="daily_study_minutes" defaultValue="60">
            <option value="30">30 menit</option>
            <option value="60">1 jam</option>
            <option value="120">2 jam</option>
            <option value="180">3 jam</option>
            <option value="240">4 jam atau lebih</option>
          </Select>
        </Field>
      </div>
      <Button size="lg" className="w-full" disabled={pending}>
        {pending ? "Menyimpan…" : "Mulai belajar"}
      </Button>
    </form>
  );
}
