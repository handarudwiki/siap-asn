import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Badge, Card, PageHeader, Select } from "@/components/ui";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { FORMATIONS, ROLE_LABEL, type Package, type Profile } from "@/lib/types";
import { grantPackage, setRole, setSuspended } from "../actions";

export const metadata: Metadata = { title: "Detail pengguna" };

const isActive = (expires: string) => new Date(expires).getTime() > Date.now();

export default async function AdminUserDetailPage(props: PageProps<"/admin/pengguna/[id]">) {
  const me = await requireStaff("admin");
  const { id } = await props.params;
  const sp = await props.searchParams;
  const supabase = await createClient();
  const { data: p } = await supabase.from("profiles").select("*").eq("id", id).maybeSingle<Profile & { acquisition: Record<string, string> | null }>();
  if (!p) notFound();
  const [{ data: list }, { data: ups }, { data: attempts }, { data: pkgs }, { data: txs }] = await Promise.all([
    supabase.rpc("admin_get_user", { p_user: id }).maybeSingle<{ email: string; last_sign_in_at: string | null }>(),
    supabase.from("user_packages").select("id, starts_at, expires_at, granted_by, packages(name)").eq("user_id", id).order("expires_at", { ascending: false }),
    supabase.from("attempts").select("id, attempt_no, started_at, submitted_at, total_score, passed, tab_switches, tryouts(title)").eq("user_id", id).order("started_at", { ascending: false }),
    supabase.from("packages").select("*").eq("is_active", true).order("sort_order"),
    supabase.from("transactions").select("id, order_code, amount, status, created_at").eq("user_id", id).order("created_at", { ascending: false }).limit(10),
  ]);
  const email = list?.email;
  type UP = { id: string; starts_at: string; expires_at: string; granted_by: string | null; packages: { name: string } | null };
  type AT = { id: string; attempt_no: number; started_at: string; submitted_at: string | null; total_score: number | null; passed: boolean | null; tab_switches: number; tryouts: { title: string } | null };

  return (
    <div className="space-y-6">
      <Link href="/admin/pengguna" className="text-sm text-brand-700 hover:underline">
        ← Pengguna
      </Link>
      <PageHeader
        title={p.full_name ?? "(tanpa nama)"}
        description={
          <span className="flex flex-wrap items-center gap-2">
            {email} <Badge tone="purple">{ROLE_LABEL[p.role]}</Badge> {p.suspended && <Badge tone="red">Ditangguhkan</Badge>}
          </span>
        }
      />
      <Flash sp={sp} />

      <div className="grid gap-6 lg:grid-cols-3">
        <Card className="lg:col-span-2">
          <h2 className="font-bold">Profil</h2>
          <dl className="mt-3 grid gap-3 text-sm sm:grid-cols-2">
            {[
              ["Target", p.target ?? "-"],
              ["Formasi", FORMATIONS.find((f) => f.value === p.formation_type)?.label ?? p.formation_type],
              ["Tanggal ujian", dateWIB(p.exam_date)],
              ["Belajar/hari", p.daily_study_minutes ? `${p.daily_study_minutes} menit` : "-"],
              ["WhatsApp", p.phone ?? "-"],
              ["Terdaftar", dateWIB(p.created_at, true)],
              ["Onboarding", p.onboarded ? "Selesai" : "Belum"],
            ].map(([k, v]) => (
              <div key={k}>
                <dt className="text-xs text-slate-500">{k}</dt>
                <dd className="font-medium">{v}</dd>
              </div>
            ))}
          </dl>
          <p className="mt-4 text-xs text-slate-500">Atribusi (UTM pertama)</p>
          <pre className="mt-1 overflow-x-auto rounded-lg bg-slate-50 p-3 text-xs">{p.acquisition ? JSON.stringify(p.acquisition, null, 2) : "(direct / tidak tercatat)"}</pre>
        </Card>

        <Card className="space-y-5">
          <div>
            <h2 className="font-bold">Tindakan</h2>
            <form action={setSuspended} className="mt-3">
              <input type="hidden" name="id" value={p.id} />
              <input type="hidden" name="suspend" value={p.suspended ? "0" : "1"} />
              <SubmitButton variant={p.suspended ? "secondary" : "danger"} size="sm" disabled={p.id === me.id}>
                {p.suspended ? "Cabut penangguhan" : "Tangguhkan akun"}
              </SubmitButton>
            </form>
          </div>
          <form action={grantPackage} className="space-y-2">
            <input type="hidden" name="id" value={p.id} />
            <p className="text-sm font-semibold">Beri paket manual</p>
            <Select name="package_id" aria-label="Paket">
              {((pkgs ?? []) as Package[]).map((x) => (
                <option key={x.id} value={x.id}>
                  {x.name}
                </option>
              ))}
            </Select>
            <SubmitButton size="sm" variant="secondary">
              Beri paket
            </SubmitButton>
          </form>
          {me.profile.role === "super_admin" && (
            <form action={setRole} className="space-y-2">
              <input type="hidden" name="id" value={p.id} />
              <p className="text-sm font-semibold">Ubah peran</p>
              <Select name="role" defaultValue={p.role} aria-label="Peran">
                {Object.entries(ROLE_LABEL).map(([k, v]) => (
                  <option key={k} value={k}>
                    {v}
                  </option>
                ))}
              </Select>
              <SubmitButton size="sm" variant="secondary">
                Simpan peran
              </SubmitButton>
            </form>
          )}
        </Card>
      </div>

      <Card>
        <h2 className="font-bold">Paket</h2>
        <ul className="mt-3 divide-y divide-slate-100 text-sm">
          {((ups ?? []) as unknown as UP[]).map((u) => (
            <li key={u.id} className="flex justify-between py-2">
              <span>
                {u.packages?.name} {u.granted_by && <Badge>manual</Badge>}
              </span>
              <span className={isActive(u.expires_at) ? "text-emerald-700" : "text-slate-400"}>
                {dateWIB(u.starts_at)} – {dateWIB(u.expires_at, true)}
              </span>
            </li>
          ))}
          {!ups?.length && <li className="py-2 text-slate-500">Belum ada paket.</li>}
        </ul>
        {!!txs?.length && (
          <>
            <p className="mt-4 text-sm font-semibold">Transaksi terakhir</p>
            <ul className="mt-1 text-sm">
              {txs.map((t) => (
                <li key={t.id} className="flex justify-between py-1">
                  <span className="font-mono text-xs">{t.order_code}</span>
                  <span>
                    {t.status} · {dateWIB(t.created_at)}
                  </span>
                </li>
              ))}
            </ul>
          </>
        )}
      </Card>

      <Card className="overflow-x-auto p-0">
        <h2 className="px-5 pt-5 font-bold">Riwayat try-out</h2>
        <table className="mt-3 w-full min-w-[600px] text-sm">
          <thead className="bg-slate-50 text-left text-xs text-slate-500">
            <tr>
              <th className="px-5 py-2">Try-out</th>
              <th>Mulai</th>
              <th>Skor</th>
              <th>Status</th>
              <th>Pindah tab</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {((attempts ?? []) as unknown as AT[]).map((a) => (
              <tr key={a.id}>
                <td className="px-5 py-2">
                  {a.tryouts?.title} <span className="text-xs text-slate-400">#{a.attempt_no}</span>
                </td>
                <td className="text-xs">{dateWIB(a.started_at, true)}</td>
                <td className="font-semibold">{a.total_score ?? "–"}</td>
                <td>{a.submitted_at ? <Badge tone={a.passed ? "green" : "red"}>{a.passed ? "Lolos" : "Belum"}</Badge> : <Badge tone="amber">Berjalan</Badge>}</td>
                <td className={a.tab_switches >= 3 ? "font-semibold text-red-600" : ""}>{a.tab_switches}</td>
              </tr>
            ))}
            {!attempts?.length && (
              <tr>
                <td colSpan={5} className="px-5 py-6 text-center text-slate-500">
                  Belum ada try-out.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </Card>
    </div>
  );
}
