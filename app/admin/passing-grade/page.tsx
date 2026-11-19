import type { Metadata } from "next";
import { Alert, Badge, Card, Field, Input, PageHeader, Select } from "@/components/ui";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { FORMATIONS, type PassingGradeProfile } from "@/lib/types";
import { saveProfile } from "./actions";

export const metadata: Metadata = { title: "Passing grade" };

function ProfileForm({ p }: { p?: PassingGradeProfile }) {
  const k = p?.id ?? "new";
  return (
    <form action={saveProfile} className="space-y-3">
      {p && <input type="hidden" name="id" value={p.id} />}
      <div className="grid gap-3 sm:grid-cols-4">
        <Field label="Nama" htmlFor={`n-${k}`}>
          <Input id={`n-${k}`} name="name" defaultValue={p?.name} required />
        </Field>
        <Field label="Tahun" htmlFor={`y-${k}`}>
          <Input id={`y-${k}`} name="year" type="number" defaultValue={p?.year ?? new Date().getFullYear()} required />
        </Field>
        <Field label="Formasi" htmlFor={`f-${k}`}>
          <Select id={`f-${k}`} name="formation_type" defaultValue={p?.formation_type ?? "umum"}>
            {FORMATIONS.map((f) => (
              <option key={f.value} value={f.value}>
                {f.label}
              </option>
            ))}
          </Select>
        </Field>
        <Field label="Aturan" htmlFor={`r-${k}`}>
          <Select id={`r-${k}`} name="rule_type" defaultValue={p?.rule_type ?? "per_test"}>
            <option value="per_test">Per tes (TWK, TIU, TKP)</option>
            <option value="cumulative">Kumulatif + TIU minimum</option>
          </Select>
        </Field>
        <Field label="TWK min" htmlFor={`twk-${k}`}>
          <Input id={`twk-${k}`} name="twk_min" type="number" defaultValue={p?.twk_min ?? ""} />
        </Field>
        <Field label="TIU min" htmlFor={`tiu-${k}`}>
          <Input id={`tiu-${k}`} name="tiu_min" type="number" defaultValue={p?.tiu_min ?? ""} />
        </Field>
        <Field label="TKP min" htmlFor={`tkp-${k}`}>
          <Input id={`tkp-${k}`} name="tkp_min" type="number" defaultValue={p?.tkp_min ?? ""} />
        </Field>
        <Field label="Total min (kumulatif)" htmlFor={`tot-${k}`}>
          <Input id={`tot-${k}`} name="total_min" type="number" defaultValue={p?.total_min ?? ""} />
        </Field>
      </div>
      <Field label="Catatan / dasar regulasi" htmlFor={`notes-${k}`}>
        <Input id={`notes-${k}`} name="notes" defaultValue={p?.notes ?? ""} />
      </Field>
      <div className="flex items-center gap-4">
        <label className="flex items-center gap-2 text-sm">
          <input type="checkbox" name="is_default" defaultChecked={p?.is_default ?? false} /> Default (dipakai bila peserta/try-out tidak punya profil)
        </label>
        <SubmitButton size="sm">{p ? "Simpan" : "Tambah profil"}</SubmitButton>
      </div>
    </form>
  );
}

export default async function PassingGradePage(props: PageProps<"/admin/passing-grade">) {
  await requireStaff("super_admin");
  const sp = await props.searchParams;
  const supabase = await createClient();
  const { data } = await supabase.from("passing_grade_profiles").select("*").order("year", { ascending: false }).order("formation_type");
  return (
    <div className="space-y-6">
      <PageHeader title="Profil passing grade" description="Ambang batas per tahun KepmenPANRB dan jenis formasi. Perubahan berlaku untuk try-out berikutnya." />
      <Flash sp={sp} />
      <Alert tone="amber">Nilai awal mengikuti regulasi 2024 sesuai BRD. Konfirmasi dengan KepmenPANRB terbaru sebelum peluncuran.</Alert>
      {((data ?? []) as PassingGradeProfile[]).map((p) => (
        <Card key={p.id}>
          <p className="mb-3 flex flex-wrap items-center gap-2 text-sm">
            <b>{p.name}</b>
            {p.is_default && <Badge tone="brand">Default</Badge>}
            <Badge>{p.rule_type === "per_test" ? `TWK ${p.twk_min} · TIU ${p.tiu_min} · TKP ${p.tkp_min}` : `Total ${p.total_min} · TIU ${p.tiu_min}`}</Badge>
          </p>
          <ProfileForm p={p} />
        </Card>
      ))}
      <Card>
        <h2 className="mb-3 font-bold">Profil baru</h2>
        <ProfileForm />
      </Card>
    </div>
  );
}
