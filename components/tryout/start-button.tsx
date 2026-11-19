"use client";

import { useState, useTransition } from "react";
import { Alert, Button } from "@/components/ui";
import { startTryout } from "@/app/(app)/tryout/actions";

export function StartTryoutButton({ tryoutId, label = "Mulai try-out", disabled }: { tryoutId: string; label?: string; disabled?: boolean }) {
  const [error, setError] = useState<string | null>(null);
  const [confirming, setConfirming] = useState(false);
  const [pending, start] = useTransition();
  return (
    <div className="space-y-3">
      {error && <Alert>{error}</Alert>}
      {confirming ? (
        <div className="rounded-xl border border-amber-200 bg-amber-50 p-4">
          <p className="text-sm text-amber-900">
            Timer dimulai di server saat Anda menekan <b>Mulai sekarang</b> dan <b>tidak bisa dijeda</b>. Pastikan koneksi stabil.
          </p>
          <div className="mt-3 flex gap-2">
            <Button
              disabled={pending}
              onClick={() =>
                start(async () => {
                  const res = await startTryout(tryoutId);
                  if (res?.error) {
                    setError(res.error);
                    setConfirming(false);
                  }
                })
              }
            >
              {pending ? "Menyiapkan soal…" : "Mulai sekarang"}
            </Button>
            <Button variant="ghost" onClick={() => setConfirming(false)}>
              Batal
            </Button>
          </div>
        </div>
      ) : (
        <Button size="lg" disabled={disabled} onClick={() => setConfirming(true)}>
          {label}
        </Button>
      )}
    </div>
  );
}
