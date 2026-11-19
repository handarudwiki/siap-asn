"use client";

import { useState, useTransition } from "react";
import { Alert, Button, cn } from "@/components/ui";
import { simulatePayment } from "@/app/(app)/paket/actions";

const METHODS = [
  ["qris", "QRIS"],
  ["bca_va", "Virtual Account BCA"],
  ["bri_va", "Virtual Account BRI"],
  ["gopay", "GoPay"],
  ["shopeepay", "ShopeePay"],
] as const;

export function SandboxPay({ txId }: { txId: string }) {
  const [method, setMethod] = useState<string>("qris");
  const [error, setError] = useState<string | null>(null);
  const [pending, start] = useTransition();
  return (
    <div className="space-y-4">
      <div className="grid gap-2 sm:grid-cols-2">
        {METHODS.map(([v, l]) => (
          <button
            key={v}
            onClick={() => setMethod(v)}
            aria-pressed={method === v}
            className={cn("rounded-xl border px-4 py-3 text-left text-sm font-medium", method === v ? "border-brand-500 bg-brand-50" : "border-slate-200")}
          >
            {l}
          </button>
        ))}
      </div>
      {error && <Alert>{error}</Alert>}
      <div className="flex flex-col gap-2 sm:flex-row">
        <Button
          disabled={pending}
          onClick={() =>
            start(async () => {
              const r = await simulatePayment(txId, "paid", method);
              if (r?.error) setError(r.error);
            })
          }
        >
          Simulasikan pembayaran berhasil
        </Button>
        <Button
          variant="secondary"
          disabled={pending}
          onClick={() =>
            start(async () => {
              const r = await simulatePayment(txId, "failed", method);
              if (r?.error) setError(r.error);
            })
          }
        >
          Simulasikan gagal
        </Button>
      </div>
    </div>
  );
}
