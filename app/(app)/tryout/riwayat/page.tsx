import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, LinkButton, PageHeader } from "@/components/ui";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";

export const metadata: Metadata = { title: "Riwayat try-out" };

export default async function HistoryPage() {
  const user = await requireUser();
  const supabase = await createClient();
  const { data } = await supabase
    .from("attempts")
    .select("id, attempt_no, started_at, submitted_at, twk_score, tiu_score, tkp_score, total_score, passed, tryouts(title)")
    .eq("user_id", user.id)
    .order("started_at", { ascending: false });
  const rows = (data ?? []) as unknown as {
    id: string; attempt_no: number; started_at: string; submitted_at: string | null; twk_score: number; tiu_score: number; tkp_score: number; total_score: number; passed: boolean; tryouts: { title: string } | null;
  }[];
  return (
    <div>
      <PageHeader title="Riwayat try-out" />
      {rows.length ? (
        <Card className="overflow-x-auto p-0">
          <table className="w-full min-w-[640px] text-sm">
            <thead className="bg-slate-50 text-left text-xs text-slate-500">
              <tr>
                <th className="px-4 py-3">Try-out</th>
                <th>Tanggal</th>
                <th>TWK</th>
                <th>TIU</th>
                <th>TKP</th>
                <th>Total</th>
                <th />
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {rows.map((r) => (
                <tr key={r.id}>
                  <td className="px-4 py-3">
                    {r.tryouts?.title} <span className="text-xs text-slate-400">#{r.attempt_no}</span>
                  </td>
                  <td>{dateWIB(r.submitted_at ?? r.started_at, true)}</td>
                  <td>{r.twk_score ?? "–"}</td>
                  <td>{r.tiu_score ?? "–"}</td>
                  <td>{r.tkp_score ?? "–"}</td>
                  <td>
                    {r.submitted_at ? (
                      <span className="flex items-center gap-2 font-bold">
                        {r.total_score} <Badge tone={r.passed ? "green" : "red"}>{r.passed ? "Lolos" : "Belum"}</Badge>
                      </span>
                    ) : (
                      <Badge tone="amber">Berjalan</Badge>
                    )}
                  </td>
                  <td className="pr-4 text-right">
                    <Link href={r.submitted_at ? `/tryout/hasil/${r.id}` : `/ujian/${r.id}`} className="font-semibold text-brand-700 hover:underline">
                      {r.submitted_at ? "Hasil" : "Lanjutkan"}
                    </Link>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </Card>
      ) : (
        <EmptyState title="Belum ada riwayat" action={<LinkButton href="/tryout">Kerjakan try-out</LinkButton>} />
      )}
    </div>
  );
}
