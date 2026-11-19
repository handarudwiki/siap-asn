import "server-only";
import { cache } from "react";
import { redirect } from "next/navigation";
import { connection } from "next/server";
import { createClient } from "@/lib/supabase/server";
import type { Profile, Role } from "@/lib/types";

export type SessionUser = { id: string; email: string | null; profile: Profile };

/** Data Access Layer: verified user + profile for the current request (memoised per request). */
export const getUser = cache(async (): Promise<SessionUser | null> => {
  await connection(); // auth is always request-time
  const supabase = await createClient();
  const { data } = await supabase.auth.getClaims();
  const uid = data?.claims?.sub;
  if (!uid) return null;
  const { data: profile } = await supabase.from("profiles").select("*").eq("id", uid).single<Profile>();
  if (!profile) return null;
  return { id: uid, email: (data.claims.email as string | undefined) ?? null, profile };
});

export async function requireUser(opts: { allowUnonboarded?: boolean } = {}) {
  const user = await getUser();
  if (!user) redirect("/masuk");
  if (user.profile.suspended) redirect("/ditangguhkan");
  if (!opts.allowUnonboarded && !user.profile.onboarded && !isStaffRole(user.profile.role)) redirect("/onboarding");
  return user;
}

const STAFF: Role[] = ["editor", "reviewer", "admin", "super_admin"];
export const isStaffRole = (r: Role) => STAFF.includes(r);
export const canPublishRole = (r: Role) => ["reviewer", "admin", "super_admin"].includes(r);
export const isAdminRole = (r: Role) => ["admin", "super_admin"].includes(r);

export async function requireStaff(min: "editor" | "reviewer" | "admin" | "super_admin" = "editor") {
  const user = await requireUser({ allowUnonboarded: true });
  const r = user.profile.role;
  const ok =
    min === "editor" ? isStaffRole(r) : min === "reviewer" ? canPublishRole(r) : min === "admin" ? isAdminRole(r) : r === "super_admin";
  if (!ok) redirect(isStaffRole(r) ? "/admin" : "/dashboard");
  return user;
}

/** Active entitlements of the current user. */
export const getEntitlements = cache(async (userId: string) => {
  const supabase = await createClient();
  const { data } = await supabase
    .from("user_packages")
    .select("expires_at, packages(name, includes_material, includes_practice, includes_all_tryouts)")
    .eq("user_id", userId)
    .gt("expires_at", new Date().toISOString())
    .order("expires_at", { ascending: false });
  type Row = { expires_at: string; packages: { name: string; includes_material: boolean; includes_practice: boolean; includes_all_tryouts: boolean } | null };
  const rows = (data ?? []) as unknown as Row[];
  return {
    premium: rows.length > 0,
    material: rows.some((r) => r.packages?.includes_material),
    practice: rows.some((r) => r.packages?.includes_practice),
    tryouts: rows.some((r) => r.packages?.includes_all_tryouts),
    packages: rows.map((r) => ({ name: r.packages?.name ?? "Paket", expires_at: r.expires_at })),
  };
});
