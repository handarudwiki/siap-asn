"use client";

import { useState, useTransition } from "react";
import { Alert, Badge, Button, Input, cn } from "@/components/ui";
import { checkout, quote } from "@/app/(app)/paket/actions";
import { rupiah } from "@/lib/format";
import type { Package } from "@/lib/types";

export function BuyCard({ pkg, owned }: { pkg: Package; owned: boolean }) {
  const [voucher, setVoucher] = useState("");
  const [q, setQ] = useState<{ base: number; discount: number; amount: number } | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [showVoucher, setShowVoucher] = useState(false);
  const [pending, start] = useTransition();
  const price = q?.amount ?? pkg.price;

  return (
    <div className={cn("relative flex flex-col rounded-2xl border bg-white p-6", pkg.highlight ? "border-brand-500 ring-2 ring-brand-500" : "border-slate-200")}>
      {pkg.highlight && <Badge tone="brand" className="absolute -top-3 left-6">Paling lengkap</Badge>}
      <div className="flex items-center justify-between">
        <h3 className="font-bold">{pkg.name}</h3>
        {owned && <Badge tone="green">Aktif</Badge>}
      </div>
      <p className="mt-1 text-sm text-slate-500">{pkg.description}</p>
      <p className="mt-4 text-3xl font-extrabold">
        {rupiah(price)}
        {q && q.discount > 0 && <span className="ml-2 text-base font-medium text-slate-400 line-through">{rupiah(q.base)}</span>}
      </p>
      <p className="text-xs text-slate-500">{pkg.duration_days ? `${pkg.duration_days} hari akses` : `Hingga ${pkg.until_date}`}</p>
      <ul className="mt-4 flex-1 space-y-1.5 text-sm">
        {pkg.features.map((f) => (
          <li key={f} className="flex gap-2">
            <span className="text-emerald-500">✓</span>
            {f}
          </li>
        ))}
      </ul>
      {error && <div className="mt-4"><Alert>{error}</Alert></div>}
      <div className="mt-5 space-y-2">
        {showVoucher ? (
          <div className="flex gap-2">
            <Input value={voucher} onChange={(e) => setVoucher(e.target.value.toUpperCase())} placeholder="KODE VOUCHER" aria-label="Kode voucher" />
            <Button
              variant="secondary"
              disabled={!voucher || pending}
              onClick={() =>
                start(async () => {
                  setError(null);
                  const r = await quote(pkg.id, voucher);
                  if ("error" in r && r.error) {
                    setError(r.error);
                    setQ(null);
                  } else if ("quote" in r) setQ(r.quote!);
                })
              }
            >
              Pakai
            </Button>
          </div>
        ) : (
          <button className="text-sm font-semibold text-brand-700 hover:underline" onClick={() => setShowVoucher(true)}>
            Punya kode voucher?
          </button>
        )}
        <Button
          className="w-full"
          variant={pkg.highlight ? "primary" : "secondary"}
          disabled={pending}
          onClick={() =>
            start(async () => {
              setError(null);
              const r = await checkout(pkg.id, q ? voucher : "");
              if (r?.error) setError(r.error);
            })
          }
        >
          {pending ? "Memproses…" : owned ? "Perpanjang" : "Beli sekarang"}
        </Button>
      </div>
    </div>
  );
}
