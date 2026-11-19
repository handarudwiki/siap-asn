import Link from "next/link";
import { Card, PageHeader } from "@/components/ui";
import { canPublishRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { rupiah } from "@/lib/format";

type Overview = {
  registered: number; new_users: number; active_users: number; paid_users: number; revenue: number; attempts: number;
  questions_published: number; questions_in_review: number; lessons_published: number; open_reports: number;
  revenue_daily: { day: string; amount: number }[];
};

export default async function AdminOverview() {
  const user = await requireStaff();
  const supabase = await createClient();
  const [{ data }, { count: lessonsReview }] = await Promise.all([
    supabase.rpc("admin_overview", { p_days: 30 }),
    supabase.from("lessons").select("id", { count: "exact", head: true }).eq("status", "in_review"),
  ]);
  const o = data as Overview;
  const conversion = o.registered ? ((o.paid_users / o.registered) * 100).toFixed(1) : "0";
  const maxRev = Math.max(1, ...o.revenue_daily.map((d) => d.amount));

  const kpis = [
    ["Peserta terdaftar", o.registered.toLocaleString("id-ID"), `+${o.new_users} dalam 30 hari`],
    ["Aktif 7 hari", o.active_users.toLocaleString("id-ID"), o.registered ? `${((o.active_users / o.registered) * 100).toFixed(1)}% dari terdaftar` : ""],
    ["Pengguna berbayar", o.paid_users.toLocaleString("id-ID"), `Konversi ${conversion}%`],
    ["Pendapatan 30 hari", rupiah(o.revenue), `${o.attempts} try-out dikerjakan`],
  ];

  return (
    <div className="space-y-6">
      <PageHeader title="Overview" description="Ringkasan 30 hari terakhir." />
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {kpis.map(([l, v, s]) => (
          <Card key={l}>
            <p className="text-xs text-slate-500">{l}</p>
            <p className="mt-1 text-2xl font-extrabold">{v}</p>
            <p className="mt-1 text-xs text-slate-500">{s}</p>
          </Card>
        ))}
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <Card className="lg:col-span-2">
          <h2 className="font-bold">Pendapatan harian</h2>
          {o.revenue_daily.length ? (
            <div className="mt-4 flex h-40 items-end gap-1" role="img" aria-label="Grafik pendapatan harian">
              {o.revenue_daily.map((d) => (
                <div key={d.day} className="group relative flex-1">
                  <div className="rounded-t bg-brand-500" style={{ height: `${(d.amount / maxRev) * 150}px` }} />
                  <span className="pointer-events-none absolute -top-6 left-1/2 hidden -translate-x-1/2 whitespace-nowrap rounded bg-slate-900 px-2 py-0.5 text-[10px] text-white group-hover:block">
                    {d.day}: {rupiah(d.amount)}
                  </span>
                </div>
              ))}
            </div>
          ) : (
            <p className="mt-4 text-sm text-slate-500">Belum ada transaksi lunas.</p>
          )}
        </Card>
        <Card>
          <h2 className="font-bold">Antrean konten</h2>
          <ul className="mt-4 space-y-3 text-sm">
            <li className="flex justify-between">
              <Link href="/admin/soal?status=in_review" className="text-brand-700 hover:underline">Soal menunggu review</Link>
              <b>{o.questions_in_review}</b>
            </li>
            <li className="flex justify-between">
              <Link href="/admin/materi?status=in_review" className="text-brand-700 hover:underline">Materi menunggu review</Link>
              <b>{lessonsReview ?? 0}</b>
            </li>
            <li className="flex justify-between">
              <Link href="/admin/laporan-soal" className="text-brand-700 hover:underline">Laporan soal terbuka</Link>
              <b>{o.open_reports}</b>
            </li>
            <li className="flex justify-between border-t border-slate-100 pt-3">
              <span>Soal terbit</span>
              <b>{o.questions_published.toLocaleString("id-ID")}</b>
            </li>
            <li className="flex justify-between">
              <span>Materi terbit</span>
              <b>{o.lessons_published}</b>
            </li>
          </ul>
          <p className="mt-4 text-xs text-slate-500">
            Target peluncuran: ≥ 3.000 soal terreview dan 10 try-out. {canPublishRole(user.profile.role) ? "" : "Anda dapat mengajukan review; publikasi oleh Reviewer/Admin."}
          </p>
        </Card>
      </div>
    </div>
  );
}
