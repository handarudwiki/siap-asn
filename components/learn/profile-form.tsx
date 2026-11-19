"use client";

import { useActionState } from "react";
import { Alert, Button, Field, Input, Select } from "@/components/ui";
import { FORMATIONS, type Profile } from "@/lib/types";
import { updateProfile } from "@/app/(app)/actions";

export function ProfileForm({ profile }: { profile: Profile }) {
  const [state, action, pending] = useActionState(updateProfile, undefined);
  return (
    <form action={action} className="space-y-4">
      {state?.error && <Alert>{state.error}</Alert>}
      {state?.ok && <Alert tone="green">Profil tersimpan.</Alert>}
      <div className="grid gap-4 sm:grid-cols-2">
        <Field label="Nama lengkap" htmlFor="full_name">
          <Input id="full_name" name="full_name" defaultValue={profile.full_name ?? ""} required />
        </Field>
        <Field label="No. WhatsApp" htmlFor="phone" hint="Untuk pengingat try-out (opsional)">
          <Input id="phone" name="phone" type="tel" defaultValue={profile.phone ?? ""} />
        </Field>
        <Field label="Target" htmlFor="target">
          <Select id="target" name="target" defaultValue={profile.target ?? "cpns"}>
            <option value="cpns">CPNS</option>
            <option value="kedinasan">Sekolah Kedinasan</option>
          </Select>
        </Field>
        <Field label="Jenis formasi" htmlFor="formation_type" hint="Menentukan passing grade & waktu tambahan (disabilitas)">
          <Select id="formation_type" name="formation_type" defaultValue={profile.formation_type}>
            {FORMATIONS.map((f) => (
              <option key={f.value} value={f.value}>
                {f.label}
              </option>
            ))}
          </Select>
        </Field>
        <Field label="Tanggal ujian" htmlFor="exam_date">
          <Input id="exam_date" name="exam_date" type="date" defaultValue={profile.exam_date ?? ""} />
        </Field>
        <Field label="Waktu belajar per hari (menit)" htmlFor="daily_study_minutes">
          <Input id="daily_study_minutes" name="daily_study_minutes" type="number" min={15} max={600} defaultValue={profile.daily_study_minutes ?? 60} />
        </Field>
        <Field label="Ukuran huruf" htmlFor="font_scale" hint="Aksesibilitas">
          <Select id="font_scale" name="font_scale" defaultValue={String(profile.font_scale)}>
            <option value="0.875">Kecil</option>
            <option value="1">Normal</option>
            <option value="1.125">Besar</option>
            <option value="1.25">Sangat besar</option>
          </Select>
        </Field>
      </div>
      <Button disabled={pending}>{pending ? "Menyimpan…" : "Simpan profil"}</Button>
    </form>
  );
}
