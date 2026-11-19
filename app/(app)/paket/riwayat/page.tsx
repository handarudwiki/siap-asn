import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, PageHeader } from "@/components/ui";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB, rupiah } from "@/lib/format";

export const metadata: Metadata = { title: "Riwayat transaksi" };

export default async function TransactionsPage() {
  const user = await requireUser();
  const supabase = await createClient();
  const { data } = await supabase.from("transactions").select("id, order_code, amount, status, created_at, packages(name)").eq("user_id", user.id).order("created_at", { ascending: false });
  const rows = (data ?? []) as unknown as { id: string; order_code: string; amount: number; status: string; created_at: string; packages: { name: string } | null }[];
  return (
    <div>
      <PageHeader title="Riwayat transaksi" />
      {rows.length ? (
        <Card className="divide-y divide-slate-100 p-0">
          {rows.map((r) => (
            <Link key={r.id} href={`/paket/invoice/${r.id}`} className="flex items-center justify-between px-5 py-4 hover:bg-slate-50">
              <div>
                <p className="font-semibold">{r.packages?.name}</p>
                <p className="text-xs text-slate-500">
                  {r.order_code} · {dateWIB(r.created_at, true)}
                </p>
              </div>
              <div className="text-right">
                <p className="font-bold">{rupiah(r.amount)}</p>
                <Badge tone={r.status === "paid" ? "green" : r.status === "pending" ? "amber" : "slate"}>{r.status}</Badge>
              </div>
            </Link>
          ))}
        </Card>
      ) : (
        <EmptyState title="Belum ada transaksi" />
      )}
    </div>
  );
}
