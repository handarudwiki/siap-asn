import type { Metadata } from "next";
import { Badge, Card, Field, Input, PageHeader, Select, Textarea } from "@/components/ui";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB, rupiah } from "@/lib/format";
import type { Package } from "@/lib/types";
import { savePackage, saveVoucher } from "./actions";

export const metadata: Metadata = { title: "Paket & voucher" };

type Voucher = { id: string; code: string; discount_type: "percent" | "fixed"; discount_value: number; quota: number | null; used_count: number; valid_from: string | null; valid_until: string | null; package_id: string | null; is_active: boolean };

const wibDate = (iso: string | null) => (iso ? new Date(iso).toLocaleDateString("en-CA", { timeZone: "Asia/Jakarta" }) : "");

function PackageForm({ p }: { p?: Package }) {
  return (
    <form action={savePackage} className="space-y-3">
      {p && <input type="hidden" name="id" value={p.id} />}
      <div className="grid gap-3 sm:grid-cols-4">
        <Field label="Nama" htmlFor={`name-${p?.id ?? "new"}`}>
          <Input id={`name-${p?.id ?? "new"}`} name="name" defaultValue={p?.name} required />
        </Field>
        <Field label="Slug" htmlFor={`slug-${p?.id ?? "new"}`}>
          <Input id={`slug-${p?.id ?? "new"}`} name="slug" defaultValue={p?.slug} />
        </Field>
        <Field label="Harga (Rp)" htmlFor={`price-${p?.id ?? "new"}`}>
          <Input id={`price-${p?.id ?? "new"}`} name="price" type="number" min={0} defaultValue={p?.price ?? 0} required />
        </Field>
        <Field label="Urutan" htmlFor={`sort-${p?.id ?? "new"}`}>
          <Input id={`sort-${p?.id ?? "new"}`} name="sort_order" type="number" defaultValue={p?.sort_order ?? 0} />
        </Field>
        <Field label="Durasi (hari)" htmlFor={`dur-${p?.id ?? "new"}`}>
          <Input id={`dur-${p?.id ?? "new"}`} name="duration_days" type="number" min={1} defaultValue={p?.duration_days ?? ""} />
        </Field>
        <Field label="Atau berakhir tanggal" htmlFor={`until-${p?.id ?? "new"}`} hint="Paling awal dari keduanya">
          <Input id={`until-${p?.id ?? "new"}`} name="until_date" type="date" defaultValue={p?.until_date ?? ""} />
        </Field>
        <div className="sm:col-span-2">
          <Field label="Deskripsi" htmlFor={`desc-${p?.id ?? "new"}`}>
            <Input id={`desc-${p?.id ?? "new"}`} name="description" defaultValue={p?.description ?? ""} />
          </Field>
        </div>
      </div>
      <Field label="Fitur (satu per baris)" htmlFor={`feat-${p?.id ?? "new"}`}>
        <Textarea id={`feat-${p?.id ?? "new"}`} name="features" rows={3} defaultValue={p?.features.join("\n")} />
      </Field>
      <div className="flex flex-wrap gap-x-5 gap-y-2 text-sm">
        {(
          [
            ["includes_material", "Semua materi", p?.includes_material],
            ["includes_practice", "Latihan tanpa batas", p?.includes_practice],
            ["includes_all_tryouts", "Semua try-out", p?.includes_all_tryouts],
            ["highlight", "Sorot di halaman harga", p?.highlight],
            ["is_active", "Aktif", p?.is_active ?? true],
          ] as const
        ).map(([n, l, v]) => (
          <label key={n} className="flex items-center gap-2">
            <input type="checkbox" name={n} defaultChecked={!!v} /> {l}
          </label>
        ))}
      </div>
      <SubmitButton size="sm">{p ? "Simpan paket" : "Buat paket"}</SubmitButton>
    </form>
  );
}

function VoucherForm({ v, packages }: { v?: Voucher; packages: Package[] }) {
  const k = v?.id ?? "new";
  return (
    <form action={saveVoucher} className="grid gap-3 sm:grid-cols-4 lg:grid-cols-8 lg:items-end">
      {v && <input type="hidden" name="id" value={v.id} />}
      <Field label="Kode" htmlFor={`code-${k}`}>
        <Input id={`code-${k}`} name="code" defaultValue={v?.code} required className="uppercase" />
      </Field>
      <Field label="Jenis" htmlFor={`type-${k}`}>
        <Select id={`type-${k}`} name="discount_type" defaultValue={v?.discount_type ?? "percent"}>
          <option value="percent">Persen</option>
          <option value="fixed">Nominal</option>
        </Select>
      </Field>
      <Field label="Nilai" htmlFor={`val-${k}`}>
        <Input id={`val-${k}`} name="discount_value" type="number" min={1} defaultValue={v?.discount_value} required />
      </Field>
      <Field label="Kuota" htmlFor={`quota-${k}`}>
        <Input id={`quota-${k}`} name="quota" type="number" min={1} defaultValue={v?.quota ?? ""} placeholder="∞" />
      </Field>
      <Field label="Mulai" htmlFor={`from-${k}`}>
        <Input id={`from-${k}`} name="valid_from" type="date" defaultValue={wibDate(v?.valid_from ?? null)} />
      </Field>
      <Field label="Sampai" htmlFor={`until-${k}`}>
        <Input id={`until-${k}`} name="valid_until" type="date" defaultValue={wibDate(v?.valid_until ?? null)} />
      </Field>
      <Field label="Paket" htmlFor={`pkg-${k}`}>
        <Select id={`pkg-${k}`} name="package_id" defaultValue={v?.package_id ?? ""}>
          <option value="">Semua paket</option>
          {packages.map((p) => (
            <option key={p.id} value={p.id}>
              {p.name}
            </option>
          ))}
        </Select>
      </Field>
      <div className="flex items-center gap-3">
        <label className="flex items-center gap-1 text-sm">
          <input type="checkbox" name="is_active" defaultChecked={v?.is_active ?? true} /> Aktif
        </label>
        <SubmitButton size="sm">{v ? "Simpan" : "Buat"}</SubmitButton>
      </div>
    </form>
  );
}

export default async function AdminPackagesPage(props: PageProps<"/admin/paket">) {
  await requireStaff("admin");
  const sp = await props.searchParams;
  const supabase = await createClient();
  const [{ data: pk }, { data: vc }] = await Promise.all([
    supabase.from("packages").select("*").order("sort_order"),
    supabase.from("vouchers").select("*").order("created_at", { ascending: false }),
  ]);
  const packages = (pk ?? []) as Package[];
  const vouchers = (vc ?? []) as Voucher[];

  return (
    <div className="space-y-6">
      <PageHeader title="Paket & voucher" description="Harga, durasi, cakupan akses, dan kode diskon." />
      <Flash sp={sp} />
      <section className="space-y-4">
        <h2 className="font-bold">Paket</h2>
        {packages.map((p) => (
          <Card key={p.id}>
            <details>
              <summary className="flex cursor-pointer list-none flex-wrap items-center gap-3">
                <span className="font-semibold">{p.name}</span>
                <span className="text-sm text-slate-600">{rupiah(p.price)}</span>
                <span className="text-xs text-slate-500">{p.duration_days ? `${p.duration_days} hari` : `s.d. ${p.until_date}`}</span>
                {!p.is_active && <Badge>Nonaktif</Badge>}
                {p.highlight && <Badge tone="brand">Disorot</Badge>}
                <span className="ml-auto text-sm font-semibold text-brand-700">Ubah</span>
              </summary>
              <div className="mt-4 border-t border-slate-100 pt-4">
                <PackageForm p={p} />
              </div>
            </details>
          </Card>
        ))}
        <Card>
          <h3 className="mb-3 font-semibold">Paket baru</h3>
          <PackageForm />
        </Card>
      </section>

      <section className="space-y-4">
        <h2 className="font-bold">Voucher</h2>
        <Card>
          <h3 className="mb-3 font-semibold">Voucher baru</h3>
          <VoucherForm packages={packages} />
        </Card>
        {vouchers.map((v) => (
          <Card key={v.id}>
            <p className="mb-3 flex flex-wrap items-center gap-2 text-sm">
              <b className="font-mono">{v.code}</b>
              <Badge tone={v.is_active ? "green" : "slate"}>{v.is_active ? "Aktif" : "Nonaktif"}</Badge>
              <span className="text-slate-500">
                Terpakai {v.used_count}
                {v.quota ? `/${v.quota}` : ""} · berlaku {v.valid_from ? dateWIB(v.valid_from) : "—"} s.d. {v.valid_until ? dateWIB(v.valid_until) : "—"}
              </span>
            </p>
            <VoucherForm v={v} packages={packages} />
          </Card>
        ))}
      </section>
    </div>
  );
}
