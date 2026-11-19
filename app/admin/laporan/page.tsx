import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, PageHeader, cn } from "@/components/ui";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { rupiah } from "@/lib/format";

export const metadata: Metadata = { title: "Laporan" };

type Overview = { registered: number; new_users: number; active_users: number; paid_users: number; revenue: number; attempts: number; revenue_daily: { day: string; amount: number }[] };
type Acq = { source: string; medium: string; campaign: string; signups: number; paid: number };
type Content = { subtopic: string | null; test_code: string; answers: number; accuracy: number | null };
type Stat = { question_id: string; times_answered: number; pct_full_points: number | null; avg_time_s: number | null };

export default async function ReportsPage(props: PageProps<"/admin/laporan">) {
  await requireStaff("admin");
  const sp = await props.searchParams;
  const days = [7, 30, 90].includes(Number(sp.hari)) ? Number(sp.hari) : 30;
  const supabase = await createClient();
  const [{ data: ov }, { data: acq }, { data: content }, { data: stats }] = await Promise.all([
    supabase.rpc("admin_overview", { p_days: days }),
    supabase.rpc("admin_acquisition_report", { p_days: days }),
    supabase.rpc("admin_content_report"),
    supabase.from("question_stats").select("question_id, times_answered, pct_full_points, avg_time_s").gte("times_answered", 10),
  ]);
  const o = ov as Overview | null;
  const abnormal = ((stats ?? []) as Stat[]).filter((s) => s.pct_full_points != null && (s.pct_full_points < 20 || s.pct_full_points > 95));
  const { data: stems } = abnormal.length
    ? await supabase.from("questions").select("id, stem, test_code").in("id", abnormal.map((a) => a.question_id))
    : { data: [] as { id: string; stem: string; test_code: string }[] };
  const maxRev = Math.max(1, ...(o?.revenue_daily ?? []).map((d) => d.amount));
  const conversion = o && o.registered ? ((o.paid_users / o.registered) * 100).toFixed(1) : "0";

  return (
    <div className="space-y-6">
      <PageHeader
        title="Laporan"
        description="Akuisisi, konversi, pendapatan, dan kualitas konten."
        actions={
          <div className="flex gap-1">
            {[7, 30, 90].map((d) => (
              <Link key={d} href={`?hari=${d}`} className={cn("rounded-full px-3 py-1 text-sm", d === days ? "bg-brand-600 text-white" : "bg-white ring-1 ring-slate-200")}>
                {d} hari
              </Link>
            ))}
          </div>
        }
      />
      {o && (
        <div className="grid gap-4 sm:grid-cols-3 lg:grid-cols-6">
          {[
            ["Terdaftar", o.registered.toLocaleString("id-ID")],
            [`Baru (${days}h)`, o.new_users.toLocaleString("id-ID")],
            ["Aktif 7 hari", o.active_users.toLocaleString("id-ID")],
            ["Berbayar aktif", o.paid_users.toLocaleString("id-ID")],
            ["Konversi", `${conversion}%`],
            [`Pendapatan (${days}h)`, rupiah(o.revenue)],
          ].map(([k, v]) => (
            <Card key={k}>
              <p className="text-xs text-slate-500">{k}</p>
              <p className="mt-1 text-xl font-extrabold">{v}</p>
            </Card>
          ))}
        </div>
      )}

      <Card>
        <h2 className="font-bold">Pendapatan harian</h2>
        {o?.revenue_daily.length ? (
          <div className="mt-4 flex h-40 items-end gap-1">
            {o.revenue_daily.map((d) => (
              <div key={d.day} className="group flex flex-1 flex-col items-center justify-end">
                <div className="w-full rounded-t bg-brand-500" style={{ height: `${(d.amount / maxRev) * 100}%` }} title={`${d.day}: ${rupiah(d.amount)}`} />
                <span className="mt-1 hidden text-[9px] text-slate-400 sm:block">{d.day.slice(5)}</span>
              </div>
            ))}
          </div>
        ) : (
          <p className="mt-3 text-sm text-slate-500">Belum ada pendapatan pada periode ini.</p>
        )}
      </Card>

      <Card className="overflow-x-auto p-0">
        <h2 className="px-5 pt-5 font-bold">Kanal akuisisi (UTM pertama)</h2>
        <table className="mt-3 w-full min-w-[640px] text-sm">
          <thead className="bg-slate-50 text-left text-xs text-slate-500">
            <tr>
              <th className="px-5 py-2">Source</th>
              <th>Medium</th>
              <th>Campaign</th>
              <th>Pendaftar</th>
              <th>Berbayar</th>
              <th className="pr-5">Konversi</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {((acq ?? []) as Acq[]).map((a) => (
              <tr key={a.source + a.medium + a.campaign}>
                <td className="px-5 py-2 font-medium">{a.source}</td>
                <td>{a.medium}</td>
                <td>{a.campaign}</td>
                <td>{a.signups}</td>
                <td>{a.paid}</td>
                <td className="pr-5">{a.signups ? ((a.paid / a.signups) * 100).toFixed(1) : 0}%</td>
              </tr>
            ))}
            {!acq?.length && (
              <tr>
                <td colSpan={6} className="px-5 py-6 text-center text-slate-500">
                  Belum ada pendaftar pada periode ini.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </Card>

      <div className="grid gap-6 lg:grid-cols-2">
        <Card className="overflow-x-auto p-0">
          <h2 className="px-5 pt-5 font-bold">Sub-topik terlemah (semua peserta)</h2>
          <table className="mt-3 w-full text-sm">
            <thead className="bg-slate-50 text-left text-xs text-slate-500">
              <tr>
                <th className="px-5 py-2">Sub-topik</th>
                <th>Jawaban</th>
                <th className="pr-5">Akurasi</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {((content ?? []) as Content[]).slice(0, 15).map((c) => (
                <tr key={c.test_code + (c.subtopic ?? "-")}>
                  <td className="px-5 py-2">
                    <Badge className="mr-2">{c.test_code}</Badge>
                    {c.subtopic ?? "Tanpa sub-topik"}
                  </td>
                  <td>{c.answers}</td>
                  <td className="pr-5 font-semibold">{c.accuracy ?? "–"}%</td>
                </tr>
              ))}
              {!content?.length && (
                <tr>
                  <td colSpan={3} className="px-5 py-6 text-center text-slate-500">
                    Belum ada data try-out.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </Card>
        <Card className="overflow-x-auto p-0">
          <h2 className="px-5 pt-5 font-bold">Soal dengan statistik tidak wajar</h2>
          <p className="px-5 text-xs text-slate-500">≥ 10 jawaban dan &lt; 20% atau &gt; 95% mendapat poin penuh.</p>
          <ul className="mt-3 divide-y divide-slate-100 text-sm">
            {abnormal.map((a) => {
              const q = (stems ?? []).find((s) => s.id === a.question_id);
              return (
                <li key={a.question_id} className="flex items-center gap-3 px-5 py-2">
                  <Badge tone={(a.pct_full_points ?? 0) < 20 ? "red" : "amber"}>{a.pct_full_points}%</Badge>
                  <Link href={`/admin/soal/${a.question_id}`} className="line-clamp-1 flex-1 hover:underline">
                    {q?.stem ?? a.question_id}
                  </Link>
                  <span className="text-xs text-slate-400">{a.times_answered}×</span>
                </li>
              );
            })}
            {!abnormal.length && <li className="px-5 py-6 text-center text-slate-500">Tidak ada soal yang perlu ditinjau.</li>}
          </ul>
        </Card>
      </div>
    </div>
  );
}
