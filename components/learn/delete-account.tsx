"use client";

import { useActionState } from "react";
import { Alert, Button, Input } from "@/components/ui";
import { deleteAccount } from "@/app/(app)/profil/actions";

export function DeleteAccount() {
  const [state, action, pending] = useActionState(deleteAccount, undefined);
  return (
    <form action={action} className="space-y-3">
      {state?.error && <Alert>{state.error}</Alert>}
      <p className="text-sm text-slate-600">
        Menghapus akun akan menghapus permanen profil, progres belajar, dan riwayat try-out. Tindakan ini tidak dapat dibatalkan.
      </p>
      <div className="flex flex-col gap-2 sm:flex-row">
        <Input name="confirm" placeholder='Ketik "HAPUS"' aria-label="Konfirmasi hapus akun" className="sm:max-w-48" />
        <Button variant="danger" disabled={pending}>
          Hapus akun saya
        </Button>
      </div>
    </form>
  );
}
