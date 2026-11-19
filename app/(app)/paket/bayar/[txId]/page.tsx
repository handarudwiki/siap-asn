import { notFound, redirect } from "next/navigation";
import type { Metadata } from "next";
import { Alert, Card } from "@/components/ui";
import { SandboxPay } from "@/components/paket/sandbox-pay";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { rupiah } from "@/lib/format";

export const metadata: Metadata = { title: "Pembayaran" };

export default async function SandboxPaymentPage(props: PageProps<"/paket/bayar/[txId]">) {
  const { txId } = await props.params;
  const user = await requireUser();
  const supabase = await createClient();
  const { data: tx } = await supabase.from("transactions").select("*, packages(name)").eq("id", txId).eq("user_id", user.id).maybeSingle();
  if (!tx) notFound();
  if (tx.status !== "pending") redirect(`/paket/invoice/${txId}`);
  if (tx.gateway !== "sandbox" && tx.payment_url) redirect(tx.payment_url);
  return (
    <div className="mx-auto max-w-lg space-y-4">
      <Alert tone="amber">Mode sandbox: tidak ada uang sungguhan yang ditagih. Gateway produksi (Midtrans) diaktifkan lewat PAYMENT_GATEWAY=midtrans.</Alert>
      <Card>
        <p className="text-sm text-slate-500">Order {tx.order_code}</p>
        <h1 className="mt-1 text-xl font-bold">{(tx.packages as { name: string } | null)?.name}</h1>
        <p className="mt-2 text-3xl font-extrabold">{rupiah(tx.amount)}</p>
        {tx.discount_amount > 0 && <p className="text-sm text-emerald-700">Hemat {rupiah(tx.discount_amount)} dengan voucher</p>}
        <div className="mt-6">
          <SandboxPay txId={txId} />
        </div>
      </Card>
    </div>
  );
}
