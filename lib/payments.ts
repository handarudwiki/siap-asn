import "server-only";
import { createHash } from "node:crypto";
import { createAdminClient } from "@/lib/supabase/admin";
import type { Transaction } from "@/lib/types";

export type Gateway = "sandbox" | "midtrans";
export const gateway = (): Gateway => (process.env.PAYMENT_GATEWAY === "midtrans" ? "midtrans" : "sandbox");

const siteUrl = () => process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000";
const midtransBase = () =>
  process.env.MIDTRANS_IS_PRODUCTION === "true" ? "https://app.midtrans.com" : "https://app.sandbox.midtrans.com";

/** Creates a payment session at the gateway and returns the URL the learner should open. */
export async function createPayment(tx: Transaction, customer: { name: string; email: string | null }, itemName: string) {
  const admin = createAdminClient();
  if (tx.amount === 0) {
    await admin.rpc("fulfill_transaction", { p_tx: tx.id, p_method: "voucher", p_raw: null });
    return `/paket/invoice/${tx.id}`;
  }

  if (gateway() === "sandbox") {
    const url = `/paket/bayar/${tx.id}`;
    await admin.from("transactions").update({ gateway: "sandbox", payment_url: url }).eq("id", tx.id);
    return url;
  }

  const serverKey = process.env.MIDTRANS_SERVER_KEY;
  if (!serverKey) throw new Error("MIDTRANS_SERVER_KEY is not set");
  const res = await fetch(`${midtransBase()}/snap/v1/transactions`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: `Basic ${Buffer.from(serverKey + ":").toString("base64")}`,
    },
    body: JSON.stringify({
      transaction_details: { order_id: tx.order_code, gross_amount: tx.amount },
      item_details: [{ id: tx.package_id, price: tx.amount, quantity: 1, name: itemName.slice(0, 50) }],
      customer_details: { first_name: customer.name.slice(0, 50), email: customer.email ?? undefined },
      enabled_payments: ["other_qris", "gopay", "shopeepay", "bca_va", "bni_va", "bri_va", "permata_va", "echannel"],
      callbacks: { finish: `${siteUrl()}/paket/invoice/${tx.id}` },
      expiry: { unit: "hours", duration: 24 },
    }),
  });
  if (!res.ok) throw new Error(`Midtrans error ${res.status}`);
  const json = (await res.json()) as { token: string; redirect_url: string };
  await admin.from("transactions").update({ gateway: "midtrans", gateway_ref: json.token, payment_url: json.redirect_url }).eq("id", tx.id);
  return json.redirect_url;
}

export type MidtransNotification = {
  order_id: string;
  status_code: string;
  gross_amount: string;
  signature_key: string;
  transaction_status: string;
  fraud_status?: string;
  payment_type?: string;
};

export function verifyMidtransSignature(n: MidtransNotification) {
  const serverKey = process.env.MIDTRANS_SERVER_KEY ?? "";
  if (!serverKey) return false;
  const expected = createHash("sha512").update(n.order_id + n.status_code + n.gross_amount + serverKey).digest("hex");
  return expected === n.signature_key;
}

/** Applies a gateway status to our transaction (idempotent). */
export async function applyPaymentStatus(orderCode: string, status: "paid" | "pending" | "failed" | "expired", method?: string, raw?: unknown) {
  const admin = createAdminClient();
  const { data: tx } = await admin.from("transactions").select("id, status").eq("order_code", orderCode).maybeSingle();
  if (!tx) return { ok: false, reason: "not_found" };
  if (status === "paid") {
    const { error } = await admin.rpc("fulfill_transaction", { p_tx: tx.id, p_method: method ?? null, p_raw: raw ?? null });
    if (error) return { ok: false, reason: error.message };
  } else if (tx.status === "pending" && status !== "pending") {
    await admin.from("transactions").update({ status, raw_notification: raw ?? null, updated_at: new Date().toISOString() }).eq("id", tx.id);
  }
  return { ok: true };
}
