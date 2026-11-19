"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { bool, num, str } from "@/lib/admin";
import { slugify } from "@/lib/format";
import { back, dateToIso } from "@/app/admin/_ops/util";

const PATH = "/admin/paket";

export async function savePackage(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const name = str(fd, "name");
  if (!name) back(PATH, { error: "Nama paket wajib diisi." });
  const duration = num(fd, "duration_days");
  const until = str(fd, "until_date") || null;
  if (!duration && !until) back(PATH, { error: "Isi durasi (hari) atau tanggal berakhir." });
  const row = {
    name,
    slug: slugify(str(fd, "slug") || name),
    description: str(fd, "description") || null,
    price: num(fd, "price", 0),
    duration_days: duration,
    until_date: until,
    includes_material: bool(fd, "includes_material"),
    includes_practice: bool(fd, "includes_practice"),
    includes_all_tryouts: bool(fd, "includes_all_tryouts"),
    features: str(fd, "features").split("\n").map((s) => s.trim()).filter(Boolean),
    highlight: bool(fd, "highlight"),
    is_active: bool(fd, "is_active"),
    sort_order: num(fd, "sort_order", 0),
  };
  const supabase = await createClient();
  const { error } = id ? await supabase.from("packages").update(row).eq("id", id) : await supabase.from("packages").insert(row);
  if (error) back(PATH, { error: error.message.includes("slug") ? "Slug sudah dipakai." : error.message });
  revalidatePath(PATH);
  revalidatePath("/paket");
  back(PATH, { ok: id ? "Paket diperbarui." : "Paket dibuat." });
}

export async function saveVoucher(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const code = str(fd, "code").toUpperCase().replace(/\s+/g, "");
  if (!code) back(PATH, { error: "Kode voucher wajib diisi." });
  const type = str(fd, "discount_type") === "fixed" ? "fixed" : "percent";
  const value = num(fd, "discount_value", 0) ?? 0;
  if (value <= 0 || (type === "percent" && value > 100)) back(PATH, { error: "Nilai diskon tidak valid." });
  const row = {
    code,
    discount_type: type,
    discount_value: value,
    quota: num(fd, "quota"),
    valid_from: dateToIso(str(fd, "valid_from")),
    valid_until: dateToIso(str(fd, "valid_until"), true),
    package_id: str(fd, "package_id") || null,
    is_active: bool(fd, "is_active"),
  };
  const supabase = await createClient();
  const { error } = id ? await supabase.from("vouchers").update(row).eq("id", id) : await supabase.from("vouchers").insert(row);
  if (error) back(PATH, { error: error.message.includes("duplicate") ? "Kode voucher sudah ada." : error.message });
  revalidatePath(PATH);
  back(PATH, { ok: id ? "Voucher diperbarui." : "Voucher dibuat." });
}
