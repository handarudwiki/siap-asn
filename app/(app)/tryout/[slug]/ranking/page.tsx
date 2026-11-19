import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, cn } from "@/components/ui";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { FORMATIONS } from "@/lib/types";

export const metadata: Metadata = { title: "Ranking nasional" };

type Row = { rank: number; user_id: string; full_name: string; formation_type: string; twk: number; tiu: number; tkp: number; total: number; passed: boolean };

export default async function RankingPage(props: PageProps<"/tryout/[slug]/ranking">) {
  const { slug } = await props.params;
  const sp = await props.searchParams;
  const formation = typeof sp.formasi === "string" && FORMATIONS.some((f) => f.value === sp.formasi) ? sp.formasi : null;
  const user = await requireUser();
  const supabase = await createClient();
  const { data: t } = await supabase.from("tryouts").select("id, title, slug").eq("slug", slug).maybeSingle();
  if (!t) notFound();
  const { data } = await supabase.rpc("get_tryout_ranking", { p_tryout: t.id, p_formation: formation, p_limit: 100 });
  const rows = (data ?? []) as Row[];

  return (
    <div className="mx-auto max-w-4xl">
      <Link href={`/tryout/${t.slug}`} className="text-sm text-brand-700 hover:underline">
        ← {t.title}
      </Link>
      <h1 className="mt-2 text-2xl font-extrabold">Ranking nasional</h1>
      <p className="text-sm text-slate-600">Percobaan pertama setiap peserta. Seri diurutkan TKP → TIU → TWK.</p>
      <div className="my-4 flex flex-wrap gap-2">
        {[{ value: null, label: "Semua formasi" }, ...FORMATIONS].map((f) => (
          <Link
            key={f.value ?? "all"}
            href={f.value ? `?formasi=${f.value}` : "?"}
            className={cn("rounded-full px-3 py-1 text-sm", formation === f.value ? "bg-brand-600 text-white" : "bg-white ring-1 ring-slate-200")}
          >
            {f.label}
          </Link>
        ))}
      </div>
      {rows.length ? (
        <Card className="overflow-x-auto p-0">
          <table className="w-full min-w-[560px] text-sm">
            <thead className="bg-slate-50 text-left text-xs text-slate-500">
              <tr>
                <th className="px-4 py-3">#</th>
                <th>Peserta</th>
                <th>TWK</th>
                <th>TIU</th>
                <th>TKP</th>
                <th>Total</th>
                <th className="pr-4">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {rows.map((r) => (
                <tr key={r.user_id} className={r.user_id === user.id ? "bg-brand-50 font-semibold" : ""}>
                  <td className="px-4 py-2.5">{r.rank <= 3 ? ["🥇", "🥈", "🥉"][r.rank - 1] : r.rank}</td>
                  <td>
                    {r.full_name}
                    {r.user_id === user.id && " (Anda)"}
                  </td>
                  <td>{r.twk}</td>
                  <td>{r.tiu}</td>
                  <td>{r.tkp}</td>
                  <td className="font-bold">{r.total}</td>
                  <td className="pr-4">
                    <Badge tone={r.passed ? "green" : "slate"}>{r.passed ? "Lolos" : "–"}</Badge>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </Card>
      ) : (
        <EmptyState title="Belum ada peserta" description="Jadilah yang pertama mengerjakan try-out ini." />
      )}
    </div>
  );
}
