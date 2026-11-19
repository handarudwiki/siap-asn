import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Badge, Card, LinkButton } from "@/components/ui";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB, rupiah } from "@/lib/format";

export const metadata: Metadata = { title: "Invoice" };

const STATUS = { paid: ["green", "Lunas"], pending: ["amber", "Menunggu pembayaran"], failed: ["red", "Gagal"], expired: ["slate", "Kedaluwarsa"], refunded: ["purple", "Dikembalikan"] } as const;

export default async function InvoicePage(props: PageProps<"/paket/invoice/[txId]">) {
  const { txId } = await props.params;
  const user = await requireUser();
  const supabase = await createClient();
  const { data: tx } = await supabase.from("transactions").select("*, packages(name, duration_days)").eq("id", txId).eq("user_id", user.id).maybeSingle();
  if (!tx) notFound();
  const { data: up } = await supabase.from("user_packages").select("expires_at").eq("transaction_id", txId).maybeSingle();
  const [tone, label] = STATUS[tx.status as keyof typeof STATUS];
  return (
    <div className="mx-auto max-w-lg space-y-4">
      <Card>
        <div className="flex items-center justify-between">
          <p className="font-bold">Invoice</p>
          <Badge tone={tone}>{label}</Badge>
        </div>
        <dl className="mt-4 space-y-2 text-sm">
          {[
            ["No. order", tx.order_code],
            ["Tanggal", dateWIB(tx.created_at, true)],
            ["Paket", (tx.packages as { name: string } | null)?.name],
            ["Harga", rupiah(tx.base_amount)],
            ["Diskon", tx.discount_amount ? `− ${rupiah(tx.discount_amount)}` : "-"],
            ["Total", rupiah(tx.amount)],
            ["Metode", tx.payment_method ?? "-"],
            ["Dibayar", tx.paid_at ? dateWIB(tx.paid_at, true) : "-"],
            ["Akses berlaku s.d.", up ? dateWIB(up.expires_at, true) : "-"],
          ].map(([k, v]) => (
            <div key={k} className="flex justify-between gap-4">
              <dt className="text-slate-500">{k}</dt>
              <dd className="text-right font-medium">{v}</dd>
            </div>
          ))}
        </dl>
      </Card>
      <div className="flex gap-2">
        {tx.status === "pending" && tx.payment_url && <LinkButton href={tx.payment_url}>Lanjutkan pembayaran</LinkButton>}
        {tx.status === "paid" && <LinkButton href="/dashboard">Mulai belajar</LinkButton>}
        <Link href="/paket/riwayat" className="self-center text-sm font-semibold text-brand-700 hover:underline">
          Semua transaksi
        </Link>
      </div>
    </div>
  );
}
