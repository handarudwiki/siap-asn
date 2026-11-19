"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { str } from "@/lib/admin";
import { back } from "@/app/admin/_ops/util";

export async function markPaid(fd: FormData) {
  await requireStaff("admin");
  const ret = str(fd, "return") || "/admin/transaksi";
  const supabase = await createClient();
  const { error } = await supabase.rpc("fulfill_transaction", { p_tx: str(fd, "id"), p_method: "manual_admin", p_raw: null });
  if (error) back(ret, { error: error.message });
  revalidatePath("/admin/transaksi");
  back(ret, { ok: "Transaksi ditandai lunas dan akses diberikan." });
}

export async function refund(fd: FormData) {
  await requireStaff("admin");
  const ret = str(fd, "return") || "/admin/transaksi";
  const supabase = await createClient();
  const { error } = await supabase.rpc("admin_refund_transaction", { p_tx: str(fd, "id") });
  if (error) back(ret, { error: error.message.includes("TX_NOT_PAID") ? "Hanya transaksi lunas yang bisa direfund." : error.message });
  revalidatePath("/admin/transaksi");
  back(ret, { ok: "Transaksi direfund dan akses dicabut. Proses pengembalian dana di dashboard gateway." });
}
