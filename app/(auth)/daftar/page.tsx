import Link from "next/link";
import type { Metadata } from "next";
import { SignUpForm } from "@/components/auth/auth-forms";

export const metadata: Metadata = { title: "Daftar gratis" };

export default function SignUpPage() {
  return (
    <>
      <h1 className="text-2xl font-bold">Buat akun gratis</h1>
      <p className="mb-6 mt-1 text-sm text-slate-600">
        Sudah punya akun?{" "}
        <Link href="/masuk" className="font-semibold text-brand-700 hover:underline">
          Masuk
        </Link>
      </p>
      <SignUpForm />
    </>
  );
}
