"use server";

import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";
import { errorMessage } from "@/lib/format";
import { applyPaymentStatus, createPayment, gateway } from "@/lib/payments";
import type { Transaction } from "@/lib/types";

export async function quote(packageId: string, voucher: string) {
  await requireUser();
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("quote_price", { p_package: packageId, p_voucher: voucher || null });
  if (error) return { error: errorMessage(error) };
  return { quote: data as { base: number; discount: number; amount: number } };
}

export async function checkout(packageId: string, voucher: string) {
  const user = await requireUser();
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("create_order", { p_package: packageId, p_voucher: voucher || null });
  if (error) return { error: errorMessage(error) };
  const tx = data as Transaction;
  const { data: pkg } = await supabase.from("packages").select("name").eq("id", packageId).single();
  let url: string;
  try {
    url = await createPayment(tx, { name: user.profile.full_name ?? "Peserta", email: user.email }, pkg?.name ?? "Paket SiapASN");
  } catch (e) {
    return { error: e instanceof Error && e.message.includes("SECRET_KEY") ? "Pembayaran belum dikonfigurasi (SUPABASE_SECRET_KEY)." : "Gagal membuat pembayaran. Coba lagi." };
  }
  redirect(url);
}

/** Sandbox gateway only: simulates the provider's webhook. */
export async function simulatePayment(txId: string, outcome: "paid" | "failed", method: string) {
  const user = await requireUser();
  if (gateway() !== "sandbox") return { error: "Simulator hanya tersedia di mode sandbox." };
  const supabase = await createClient();
  const { data: tx } = await supabase.from("transactions").select("order_code, user_id").eq("id", txId).single();
  if (!tx || tx.user_id !== user.id) return { error: "Transaksi tidak ditemukan." };
  await applyPaymentStatus(tx.order_code, outcome, method, { simulated: true, method });
  redirect(`/paket/invoice/${txId}`);
}
