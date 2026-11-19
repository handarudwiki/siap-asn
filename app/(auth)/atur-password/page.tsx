import type { Metadata } from "next";
import { NewPasswordForm } from "@/components/auth/auth-forms";

export const metadata: Metadata = { title: "Atur password baru" };

export default function NewPasswordPage() {
  return (
    <>
      <h1 className="text-2xl font-bold">Atur password baru</h1>
      <p className="mb-6 mt-1 text-sm text-slate-600">Gunakan minimal 8 karakter.</p>
      <NewPasswordForm />
    </>
  );
}
