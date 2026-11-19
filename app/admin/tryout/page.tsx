import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, Field, Input, PageHeader, Select } from "@/components/ui";
import { StatusBadge } from "@/components/admin/status-badge";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import type { Tryout } from "@/lib/types";
import { createTryout } from "./actions";

export const metadata: Metadata = { title: "Try-out" };

export default async function AdminTryoutsPage(props: PageProps<"/admin/tryout">) {
  await requireStaff("admin");
  const sp = await props.searchParams;
  const supabase = await createClient();
  const [{ data: tryouts }, { data: tq }, { data: attempts }] = await Promise.all([
    supabase.from("tryouts").select("*").order("created_at", { ascending: false }),
    supabase.from("tryout_questions").select("tryout_id"),
    supabase.from("attempts").select("tryout_id"),
  ]);
  const qCount = (id: string) => (tq ?? []).filter((x) => x.tryout_id === id).length;
  const aCount = (id: string) => (attempts ?? []).filter((x) => x.tryout_id === id).length;

  return (
    <div>
      <PageHeader title="Try-out" description="Builder try-out dari blueprint, penjadwalan, dan laporan." />
      <Flash sp={sp} />
      <Card className="mb-6">
        <h2 className="mb-3 font-bold">Buat try-out</h2>
        <form action={createTryout} className="grid gap-4 sm:grid-cols-4 sm:items-end">
          <div className="sm:col-span-2">
            <Field label="Judul" htmlFor="title">
              <Input id="title" name="title" required placeholder="Try-out Nasional #1" />
            </Field>
          </div>
          <Field label="Jenis" htmlFor="kind">
            <Select id="kind" name="kind" defaultValue="on_demand">
              <option value="on_demand">Kapan saja</option>
              <option value="scheduled">Terjadwal</option>
            </Select>
          </Field>
          <SubmitButton>Buat & buka builder</SubmitButton>
          <Field label="Mulai (WIB, jika terjadwal)" htmlFor="starts_at">
            <Input id="starts_at" name="starts_at" type="datetime-local" />
          </Field>
          <Field label="Selesai (WIB, jika terjadwal)" htmlFor="ends_at">
            <Input id="ends_at" name="ends_at" type="datetime-local" />
          </Field>
        </form>
      </Card>
      <Card className="overflow-x-auto p-0">
        <table className="w-full min-w-[760px] text-sm">
          <thead className="bg-slate-50 text-left text-xs text-slate-500">
            <tr>
              <th className="px-4 py-3">Judul</th>
              <th>Status</th>
              <th>Jenis / jendela</th>
              <th>Soal</th>
              <th>Peserta</th>
              <th />
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {((tryouts ?? []) as Tryout[]).map((t) => {
              const target = (t.blueprint.TWK ?? 0) + (t.blueprint.TIU ?? 0) + (t.blueprint.TKP ?? 0);
              const n = qCount(t.id);
              return (
                <tr key={t.id}>
                  <td className="px-4 py-3">
                    <p className="font-semibold">{t.title}</p>
                    <p className="text-xs text-slate-400">{t.slug}</p>
                  </td>
                  <td>
                    <StatusBadge status={t.status} /> {t.is_free && <Badge tone="green">Gratis</Badge>}
                  </td>
                  <td className="text-xs">
                    {t.kind === "scheduled" ? (
                      <>
                        Terjadwal
                        <br />
                        {dateWIB(t.starts_at, true)} – {dateWIB(t.ends_at, true)}
                      </>
                    ) : (
                      "Kapan saja"
                    )}
                  </td>
                  <td className={n < target ? "font-semibold text-amber-600" : "font-semibold text-emerald-600"}>
                    {n}/{target}
                  </td>
                  <td>{aCount(t.id)}</td>
                  <td className="pr-4 text-right">
                    <Link href={`/admin/tryout/${t.id}`} className="font-semibold text-brand-700 hover:underline">
                      Kelola
                    </Link>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </Card>
    </div>
  );
}
