"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { bool, num, str } from "@/lib/admin";
import { slugify } from "@/lib/format";
import { back, wibToIso } from "@/app/admin/_ops/util";

const errText = (m: string) =>
  m.includes("TRYOUT_HAS_ATTEMPTS")
    ? "Try-out sudah memiliki peserta; susunan soal tidak dapat diubah."
    : m.includes("duplicate key") && m.includes("slug")
      ? "Slug sudah dipakai."
      : m;

export async function createTryout(fd: FormData) {
  const user = await requireStaff("admin");
  const title = str(fd, "title");
  if (!title) back("/admin/tryout", { error: "Judul wajib diisi." });
  const supabase = await createClient();
  const { data: pg } = await supabase.from("passing_grade_profiles").select("id").eq("is_default", true).limit(1).maybeSingle();
  const { data, error } = await supabase
    .from("tryouts")
    .insert({
      title,
      slug: `${slugify(title)}-${Math.random().toString(36).slice(2, 6)}`,
      kind: str(fd, "kind") === "scheduled" ? "scheduled" : "on_demand",
      starts_at: str(fd, "kind") === "scheduled" ? wibToIso(str(fd, "starts_at")) : null,
      ends_at: str(fd, "kind") === "scheduled" ? wibToIso(str(fd, "ends_at")) : null,
      passing_grade_profile_id: pg?.id ?? null,
      created_by: user.id,
    })
    .select("id")
    .single();
  if (error) back("/admin/tryout", { error: errText(error.message) });
  redirect(`/admin/tryout/${data!.id}`);
}

export async function updateTryout(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/tryout/${id}`;
  const kind = str(fd, "kind") === "scheduled" ? "scheduled" : "on_demand";
  const supabase = await createClient();
  const { error } = await supabase
    .from("tryouts")
    .update({
      title: str(fd, "title"),
      slug: slugify(str(fd, "slug") || str(fd, "title")),
      description: str(fd, "description") || null,
      kind,
      starts_at: kind === "scheduled" ? wibToIso(str(fd, "starts_at")) : null,
      ends_at: kind === "scheduled" ? wibToIso(str(fd, "ends_at")) : null,
      cap_at_window_end: bool(fd, "cap_at_window_end"),
      duration_minutes: num(fd, "duration_minutes", 100),
      extended_duration_minutes: num(fd, "extended_duration_minutes"),
      attempt_limit: num(fd, "attempt_limit"),
      blueprint: { TWK: num(fd, "bp_twk", 30), TIU: num(fd, "bp_tiu", 35), TKP: num(fd, "bp_tkp", 45) },
      shuffle_questions: bool(fd, "shuffle_questions"),
      shuffle_options: bool(fd, "shuffle_options"),
      discussion_after: str(fd, "discussion_after") === "window_close" ? "window_close" : "submit",
      is_free: bool(fd, "is_free"),
      passing_grade_profile_id: str(fd, "passing_grade_profile_id") || null,
      status: (["draft", "published", "archived"].includes(str(fd, "status")) ? str(fd, "status") : "draft") as string,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id);
  if (error) back(path, { error: errText(error.message) });
  revalidatePath(path);
  revalidatePath("/admin/tryout");
  back(path, { ok: "Pengaturan try-out tersimpan." });
}

export async function fillTryout(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/tryout/${id}`;
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("admin_fill_tryout", {
    p_tryout: id,
    p_easy: num(fd, "easy", 30),
    p_medium: num(fd, "medium", 50),
    p_hard: num(fd, "hard", 20),
    p_replace: bool(fd, "replace"),
  });
  if (error) back(path, { error: errText(error.message) });
  revalidatePath(path);
  const r = data as Record<string, number>;
  back(path, { ok: `Soal terisi: TWK ${r.TWK ?? 0}, TIU ${r.TIU ?? 0}, TKP ${r.TKP ?? 0}.` });
}

async function hasAttempts(id: string) {
  const supabase = await createClient();
  const { count } = await supabase.from("attempts").select("id", { count: "exact", head: true }).eq("tryout_id", id);
  return (count ?? 0) > 0;
}

export async function addQuestion(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/tryout/${id}`;
  if (await hasAttempts(id)) back(path, { error: errText("TRYOUT_HAS_ATTEMPTS") });
  const supabase = await createClient();
  const { count } = await supabase.from("tryout_questions").select("question_id", { count: "exact", head: true }).eq("tryout_id", id);
  const { error } = await supabase.from("tryout_questions").insert({ tryout_id: id, question_id: str(fd, "question_id"), position: (count ?? 0) + 1 });
  if (error) back(path, { error: error.message.includes("duplicate") ? "Soal sudah ada di try-out." : error.message });
  revalidatePath(path);
  back(`${path}?q=${encodeURIComponent(str(fd, "q"))}`, { ok: "Soal ditambahkan." });
}

export async function removeQuestion(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/tryout/${id}`;
  if (await hasAttempts(id)) back(path, { error: errText("TRYOUT_HAS_ATTEMPTS") });
  const supabase = await createClient();
  const { error } = await supabase.from("tryout_questions").delete().eq("tryout_id", id).eq("question_id", str(fd, "question_id"));
  if (error) back(path, { error: error.message });
  revalidatePath(path);
  back(path, { ok: "Soal dihapus dari try-out." });
}

export async function setPackages(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const path = `/admin/tryout/${id}`;
  const chosen = fd.getAll("package_id").map(String);
  const supabase = await createClient();
  const { error: delErr } = await supabase.from("package_tryouts").delete().eq("tryout_id", id);
  if (delErr) back(path, { error: delErr.message });
  if (chosen.length) {
    const { error } = await supabase.from("package_tryouts").insert(chosen.map((p) => ({ package_id: p, tryout_id: id })));
    if (error) back(path, { error: error.message });
  }
  revalidatePath(path);
  back(path, { ok: "Penugasan paket tersimpan." });
}

export async function cloneTryout(fd: FormData) {
  await requireStaff("admin");
  const id = str(fd, "id");
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("admin_clone_tryout", { p_tryout: id });
  if (error) back(`/admin/tryout/${id}`, { error: error.message });
  revalidatePath("/admin/tryout");
  redirect(`/admin/tryout/${data}?ok=${encodeURIComponent("Try-out diklon sebagai draft.")}`);
}
