import Link from "next/link";
import { Suspense } from "react";
import type { Metadata } from "next";
import { SignInForm } from "@/components/auth/auth-forms";

export const metadata: Metadata = { title: "Masuk" };

async function Form({ searchParams }: { searchParams: PageProps<"/masuk">["searchParams"] }) {
  const sp = await searchParams;
  const next = typeof sp.next === "string" && sp.next.startsWith("/") && !sp.next.startsWith("//") ? sp.next : "/dashboard";
  const error = sp.error === "auth" ? "Tautan masuk tidak valid atau kedaluwarsa." : null;
  return (
    <>
      {error && <p className="mb-4 rounded-lg bg-red-50 px-4 py-3 text-sm text-red-800">{error}</p>}
      <SignInForm next={next} />
    </>
  );
}

export default function SignInPage(props: PageProps<"/masuk">) {
  return (
    <>
      <h1 className="text-2xl font-bold">Masuk ke SiapASN</h1>
      <p className="mb-6 mt-1 text-sm text-slate-600">
        Belum punya akun?{" "}
        <Link href="/daftar" className="font-semibold text-brand-700 hover:underline">
          Daftar gratis
        </Link>
      </p>
      <Suspense fallback={<div className="h-80" />}>
        <Form searchParams={props.searchParams} />
      </Suspense>
    </>
  );
}
