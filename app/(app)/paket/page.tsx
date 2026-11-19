import Link from "next/link";
import type { Metadata } from "next";
import { Alert, Card, PageHeader } from "@/components/ui";
import { BuyCard } from "@/components/paket/buy-card";
import { getEntitlements, requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import type { Package } from "@/lib/types";

export const metadata: Metadata = { title: "Paket belajar" };

export default async function PackagesPage() {
  const user = await requireUser();
  const supabase = await createClient();
  const [{ data }, ent] = await Promise.all([supabase.from("packages").select("*").eq("is_active", true).order("sort_order"), getEntitlements(user.id)]);
  const packages = (data ?? []) as Package[];
  return (
    <div>
      <PageHeader
        title="Paket belajar"
        description="Bayar sekali via QRIS, virtual account, atau e-wallet. Akses aktif otomatis setelah pembayaran."
        actions={<Link href="/paket/riwayat" className="text-sm font-semibold text-brand-700 hover:underline">Riwayat transaksi</Link>}
      />
      {ent.premium && (
        <div className="mb-6">
          <Alert tone="green">
            Paket aktif: {ent.packages.map((p) => `${p.name} (s.d. ${dateWIB(p.expires_at)})`).join(", ")}. Membeli paket yang sama akan memperpanjang masa aktif.
          </Alert>
        </div>
      )}
      <div className="grid gap-6 md:grid-cols-3">
        {packages.map((p) => (
          <BuyCard key={p.id} pkg={p} owned={ent.packages.some((x) => x.name === p.name)} />
        ))}
      </div>
      <Card className="mt-8 text-sm text-slate-600">
        <p className="font-semibold text-slate-800">Catatan</p>
        <ul className="mt-2 list-disc space-y-1 pl-5">
          <li>Masa aktif berakhir pukul 23:59 WIB pada tanggal kedaluwarsa. Riwayat & hasil tetap bisa dilihat setelahnya.</li>
          <li>Satu akun untuk satu orang. Berbagi akun dapat menyebabkan penangguhan.</li>
        </ul>
      </Card>
    </div>
  );
}
