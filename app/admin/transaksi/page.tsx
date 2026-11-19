import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, Input, PageHeader, Select, buttonClass } from "@/components/ui";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB, rupiah } from "@/lib/format";
import { markPaid, refund } from "./actions";

export const metadata: Metadata = { title: "Transaksi" };

const STATUSES = ["pending", "paid", "failed", "expired", "refunded"] as const;
const TONE = { pending: "amber", paid: "green", failed: "red", expired: "slate", refunded: "purple" } as const;

type Row = {
  id: string; order_code: string; user_id: string; amount: number; discount_amount: number; status: (typeof STATUSES)[number]; gateway: string; payment_method: string | null; created_at: string; paid_at: string | null;
  profiles: { full_name: string | null } | null; packages: { name: string } | null;
};

export default async function AdminTransactionsPage(props: PageProps<"/admin/transaksi">) {
  await requireStaff("admin");
  const sp = await props.searchParams;
  const status = typeof sp.status === "string" && (STATUSES as readonly string[]).includes(sp.status) ? sp.status : "";
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const page = Math.max(1, Number(sp.page) || 1);
  const supabase = await createClient();
  let query = supabase
    .from("transactions")
    .select("id, order_code, user_id, amount, discount_amount, status, gateway, payment_method, created_at, paid_at, profiles(full_name), packages(name)", { count: "exact" })
    .order("created_at", { ascending: false })
    .range((page - 1) * 50, page * 50 - 1);
  if (status) query = query.eq("status", status);
  if (q) query = query.ilike("order_code", `%${q.replace(/[%_]/g, "")}%`);
  const { data, count } = await query;
  const rows = (data ?? []) as unknown as Row[];
  const ret = `/admin/transaksi?${new URLSearchParams({ ...(status ? { status } : {}), ...(q ? { q } : {}) })}`;

  return (
    <div>
      <PageHeader title="Transaksi" description="Disinkronkan dari webhook payment gateway. Tandai lunas manual atau refund." />
      <Flash sp={sp} />
      <form className="mb-4 flex flex-col gap-2 sm:flex-row" method="get">
        <Input name="q" defaultValue={q} placeholder="Cari no. order…" />
        <Select name="status" defaultValue={status} className="sm:w-44">
          <option value="">Semua status</option>
          {STATUSES.map((s) => (
            <option key={s} value={s}>
              {s}
            </option>
          ))}
        </Select>
        <button className={buttonClass("secondary")}>Filter</button>
      </form>
      <Card className="overflow-x-auto p-0">
        <table className="w-full min-w-[860px] text-sm">
          <thead className="bg-slate-50 text-left text-xs text-slate-500">
            <tr>
              <th className="px-4 py-3">Order</th>
              <th>Peserta</th>
              <th>Paket</th>
              <th>Jumlah</th>
              <th>Status</th>
              <th>Metode</th>
              <th className="pr-4 text-right">Aksi</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {rows.map((r) => (
              <tr key={r.id}>
                <td className="px-4 py-3">
                  <p className="font-mono text-xs font-semibold">{r.order_code}</p>
                  <p className="text-xs text-slate-400">{dateWIB(r.created_at, true)}</p>
                </td>
                <td>
                  <Link href={`/admin/pengguna/${r.user_id}`} className="text-brand-700 hover:underline">
                    {r.profiles?.full_name ?? r.user_id.slice(0, 8)}
                  </Link>
                </td>
                <td>{r.packages?.name}</td>
                <td>
                  {rupiah(r.amount)}
                  {r.discount_amount > 0 && <p className="text-xs text-emerald-600">−{rupiah(r.discount_amount)}</p>}
                </td>
                <td>
                  <Badge tone={TONE[r.status]}>{r.status}</Badge>
                </td>
                <td className="text-xs">
                  {r.gateway}
                  {r.payment_method && ` · ${r.payment_method}`}
                </td>
                <td className="pr-4 text-right">
                  {r.status === "pending" && (
                    <form action={markPaid} className="inline">
                      <input type="hidden" name="id" value={r.id} />
                      <input type="hidden" name="return" value={ret} />
                      <SubmitButton size="sm" variant="secondary">
                        Tandai lunas
                      </SubmitButton>
                    </form>
                  )}
                  {r.status === "paid" && (
                    <form action={refund} className="inline">
                      <input type="hidden" name="id" value={r.id} />
                      <input type="hidden" name="return" value={ret} />
                      <SubmitButton size="sm" variant="ghost" className="text-red-600">
                        Refund
                      </SubmitButton>
                    </form>
                  )}
                </td>
              </tr>
            ))}
            {!rows.length && (
              <tr>
                <td colSpan={7} className="px-4 py-8 text-center text-slate-500">
                  Tidak ada transaksi.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </Card>
      <div className="mt-4 flex justify-between text-sm">
        <span className="text-slate-500">{count ?? 0} transaksi</span>
        <span className="flex gap-3">
          {page > 1 && <Link href={`${ret}&page=${page - 1}`}>← Sebelumnya</Link>}
          {(count ?? 0) > page * 50 && <Link href={`${ret}&page=${page + 1}`}>Berikutnya →</Link>}
        </span>
      </div>
    </div>
  );
}
