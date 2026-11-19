import Link from "next/link";
import type { Metadata } from "next";
import { ResetRequestForm } from "@/components/auth/auth-forms";

export const metadata: Metadata = { title: "Lupa password" };

export default function ForgotPage() {
  return (
    <>
      <h1 className="text-2xl font-bold">Lupa password</h1>
      <p className="mb-6 mt-1 text-sm text-slate-600">Masukkan email akun Anda untuk menerima tautan reset.</p>
      <ResetRequestForm />
      <p className="mt-6 text-center text-sm">
        <Link href="/masuk" className="text-brand-700 hover:underline">
          Kembali ke halaman masuk
        </Link>
      </p>
    </>
  );
}
