"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { createClient } from "@/lib/supabase/server";

export type AuthState = { error?: string; message?: string } | undefined;

const siteUrl = () => process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000";
const safeNext = (n: FormDataEntryValue | null) => {
  const v = typeof n === "string" ? n : "";
  return v.startsWith("/") && !v.startsWith("//") ? v : "/dashboard";
};

export async function signIn(_: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = z
    .object({ email: z.email("Email tidak valid"), password: z.string().min(1, "Password wajib diisi") })
    .safeParse({ email: formData.get("email"), password: formData.get("password") });
  if (!parsed.success) return { error: parsed.error.issues[0].message };

  const supabase = await createClient();
  const { error } = await supabase.auth.signInWithPassword(parsed.data);
  if (error) {
    if (error.message.toLowerCase().includes("email not confirmed"))
      return { error: "Email belum diverifikasi. Cek kotak masuk email Anda." };
    return { error: "Email atau password salah." };
  }
  redirect(safeNext(formData.get("next")));
}

export async function signUp(_: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = z
    .object({
      full_name: z.string().trim().min(2, "Nama minimal 2 karakter"),
      email: z.email("Email tidak valid"),
      password: z.string().min(8, "Password minimal 8 karakter"),
      consent: z.literal("on", { error: "Anda perlu menyetujui kebijakan privasi" }),
    })
    .safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: parsed.error.issues[0].message };

  const supabase = await createClient();
  const { data, error } = await supabase.auth.signUp({
    email: parsed.data.email,
    password: parsed.data.password,
    options: {
      data: { full_name: parsed.data.full_name },
      emailRedirectTo: `${siteUrl()}/auth/callback?next=/onboarding`,
    },
  });
  if (error) return { error: error.message.includes("already") ? "Email sudah terdaftar." : error.message };
  if (data.session) redirect("/onboarding");
  return { message: "Pendaftaran berhasil! Kami mengirim tautan verifikasi ke email Anda." };
}

export async function requestPasswordReset(_: AuthState, formData: FormData): Promise<AuthState> {
  const email = String(formData.get("email") ?? "");
  if (!z.email().safeParse(email).success) return { error: "Email tidak valid" };
  const supabase = await createClient();
  await supabase.auth.resetPasswordForEmail(email, { redirectTo: `${siteUrl()}/auth/callback?next=/atur-password` });
  return { message: "Jika email terdaftar, tautan reset password telah dikirim." };
}

export async function updatePassword(_: AuthState, formData: FormData): Promise<AuthState> {
  const password = String(formData.get("password") ?? "");
  if (password.length < 8) return { error: "Password minimal 8 karakter" };
  if (password !== formData.get("confirm")) return { error: "Konfirmasi password tidak sama" };
  const supabase = await createClient();
  const { error } = await supabase.auth.updateUser({ password });
  if (error) return { error: error.message };
  redirect("/dashboard");
}
