"use client";

import Link from "next/link";
import { useActionState, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { Alert, Button, Field, Input } from "@/components/ui";
import { requestPasswordReset, signIn, signUp, updatePassword, type AuthState } from "@/app/(auth)/actions";

function GoogleButton({ next }: { next: string }) {
  const [loading, setLoading] = useState(false);
  return (
    <Button
      type="button"
      variant="secondary"
      className="w-full"
      disabled={loading}
      onClick={async () => {
        setLoading(true);
        const supabase = createClient();
        await supabase.auth.signInWithOAuth({
          provider: "google",
          options: { redirectTo: `${window.location.origin}/auth/callback?next=${encodeURIComponent(next)}` },
        });
      }}
    >
      <svg viewBox="0 0 24 24" className="h-4 w-4" aria-hidden>
        <path fill="#4285F4" d="M23.5 12.3c0-.8-.1-1.6-.2-2.3H12v4.4h6.5a5.6 5.6 0 0 1-2.4 3.6v3h3.9c2.3-2.1 3.5-5.2 3.5-8.7z" />
        <path fill="#34A853" d="M12 24c3.2 0 6-1.1 8-2.9l-3.9-3c-1.1.7-2.5 1.2-4.1 1.2-3.1 0-5.8-2.1-6.7-5H1.3v3.1A12 12 0 0 0 12 24z" />
        <path fill="#FBBC05" d="M5.3 14.3a7.2 7.2 0 0 1 0-4.6V6.6H1.3a12 12 0 0 0 0 10.8l4-3.1z" />
        <path fill="#EA4335" d="M12 4.8c1.8 0 3.3.6 4.6 1.8l3.4-3.4A12 12 0 0 0 1.3 6.6l4 3.1c.9-2.9 3.6-4.9 6.7-4.9z" />
      </svg>
      Lanjutkan dengan Google
    </Button>
  );
}

function Divider() {
  return (
    <div className="my-5 flex items-center gap-3 text-xs text-slate-400">
      <span className="h-px flex-1 bg-slate-200" /> atau <span className="h-px flex-1 bg-slate-200" />
    </div>
  );
}

function StateAlert({ state }: { state: AuthState }) {
  if (state?.error) return <Alert>{state.error}</Alert>;
  if (state?.message) return <Alert tone="green">{state.message}</Alert>;
  return null;
}

export function SignInForm({ next }: { next: string }) {
  const [state, action, pending] = useActionState(signIn, undefined);
  return (
    <>
      <GoogleButton next={next} />
      <Divider />
      <form action={action} className="space-y-4">
        <input type="hidden" name="next" value={next} />
        <StateAlert state={state} />
        <Field label="Email" htmlFor="email">
          <Input id="email" name="email" type="email" autoComplete="email" required />
        </Field>
        <Field label="Password" htmlFor="password">
          <Input id="password" name="password" type="password" autoComplete="current-password" required />
        </Field>
        <div className="flex justify-end text-sm">
          <Link href="/lupa-password" className="font-medium text-brand-700 hover:underline">
            Lupa password?
          </Link>
        </div>
        <Button className="w-full" disabled={pending}>
          {pending ? "Memproses…" : "Masuk"}
        </Button>
      </form>
    </>
  );
}

export function SignUpForm() {
  const [state, action, pending] = useActionState(signUp, undefined);
  if (state?.message) return <StateAlert state={state} />;
  return (
    <>
      <GoogleButton next="/onboarding" />
      <Divider />
      <form action={action} className="space-y-4">
        <StateAlert state={state} />
        <Field label="Nama lengkap" htmlFor="full_name">
          <Input id="full_name" name="full_name" autoComplete="name" required />
        </Field>
        <Field label="Email" htmlFor="email">
          <Input id="email" name="email" type="email" autoComplete="email" required />
        </Field>
        <Field label="Password" htmlFor="password" hint="Minimal 8 karakter">
          <Input id="password" name="password" type="password" autoComplete="new-password" minLength={8} required />
        </Field>
        <label className="flex items-start gap-2 text-sm text-slate-600">
          <input type="checkbox" name="consent" className="mt-1" required />
          <span>
            Saya menyetujui pemrosesan data pribadi sesuai{" "}
            <Link href="/privasi" className="text-brand-700 underline">
              Kebijakan Privasi
            </Link>{" "}
            (UU No. 27/2022 tentang PDP).
          </span>
        </label>
        <Button className="w-full" disabled={pending}>
          {pending ? "Memproses…" : "Daftar gratis"}
        </Button>
      </form>
    </>
  );
}

export function ResetRequestForm() {
  const [state, action, pending] = useActionState(requestPasswordReset, undefined);
  return (
    <form action={action} className="space-y-4">
      <StateAlert state={state} />
      <Field label="Email" htmlFor="email">
        <Input id="email" name="email" type="email" required />
      </Field>
      <Button className="w-full" disabled={pending}>
        Kirim tautan reset
      </Button>
    </form>
  );
}

export function NewPasswordForm() {
  const [state, action, pending] = useActionState(updatePassword, undefined);
  return (
    <form action={action} className="space-y-4">
      <StateAlert state={state} />
      <Field label="Password baru" htmlFor="password">
        <Input id="password" name="password" type="password" minLength={8} required />
      </Field>
      <Field label="Ulangi password" htmlFor="confirm">
        <Input id="confirm" name="confirm" type="password" minLength={8} required />
      </Field>
      <Button className="w-full" disabled={pending}>
        Simpan password
      </Button>
    </form>
  );
}
