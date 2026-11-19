"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { str } from "@/lib/admin";
import { back } from "@/app/admin/_ops/util";

const ROLES = ["learner", "editor", "reviewer", "admin", "super_admin"];

export async function setSuspended(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/pengguna/${id}`;
  const supabase = await createClient();
  const suspend = str(fd, "suspend") === "1";
  const { error } = await supabase.from("profiles").update({ suspended: suspend }).eq("id", id);
  if (error) back(path, { error: error.message });
  revalidatePath(path);
  back(path, { ok: suspend ? "Akun ditangguhkan." : "Penangguhan dicabut." });
}

export async function setRole(fd: FormData) {
  const me = await requireStaff("super_admin");
  const id = str(fd, "id");
  const path = `/admin/pengguna/${id}`;
  const role = str(fd, "role");
  if (!ROLES.includes(role)) back(path, { error: "Peran tidak valid." });
  if (id === me.id && role !== "super_admin") back(path, { error: "Anda tidak dapat menurunkan peran akun sendiri." });
  const supabase = await createClient();
  const { error } = await supabase.from("profiles").update({ role }).eq("id", id);
  if (error) back(path, { error: error.message });
  revalidatePath(path);
  back(path, { ok: "Peran diperbarui." });
}

export async function grantPackage(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/pengguna/${id}`;
  const supabase = await createClient();
  const { error } = await supabase.rpc("admin_grant_package", { p_user: id, p_package: str(fd, "package_id") });
  if (error) back(path, { error: error.message });
  revalidatePath(path);
  back(path, { ok: "Paket diberikan." });
}
