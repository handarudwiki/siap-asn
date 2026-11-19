import Link from "next/link";
import type { Metadata } from "next";
import { Card, PageHeader } from "@/components/ui";
import { ProfileForm } from "@/components/learn/profile-form";
import { DeleteAccount } from "@/components/learn/delete-account";
import { getEntitlements, requireUser } from "@/lib/auth";
import { dateWIB } from "@/lib/format";

export const metadata: Metadata = { title: "Profil" };

export default async function ProfilePage() {
  const user = await requireUser();
  const ent = await getEntitlements(user.id);
  return (
    <div className="space-y-6">
      <PageHeader title="Profil" description={user.email ?? undefined} />
      <Card>
        <h2 className="mb-4 font-bold">Data diri & target</h2>
        <ProfileForm profile={user.profile} />
      </Card>
      <Card>
        <h2 className="font-bold">Paket aktif</h2>
        {ent.packages.length ? (
          <ul className="mt-3 space-y-1 text-sm">
            {ent.packages.map((p) => (
              <li key={p.name + p.expires_at}>
                <b>{p.name}</b> — berlaku s.d. {dateWIB(p.expires_at, true)}
              </li>
            ))}
          </ul>
        ) : (
          <p className="mt-2 text-sm text-slate-600">Anda menggunakan akun gratis.</p>
        )}
        <div className="mt-4 flex gap-4 text-sm font-semibold">
          <Link href="/paket" className="text-brand-700 hover:underline">Lihat paket</Link>
          <Link href="/paket/riwayat" className="text-brand-700 hover:underline">Riwayat transaksi</Link>
        </div>
      </Card>
      <Card>
        <h2 className="font-bold">Akun & keamanan</h2>
        <div className="mt-3 flex flex-col gap-2 text-sm">
          <Link href="/atur-password" className="font-semibold text-brand-700 hover:underline">Ubah password</Link>
          <a href="/api/akun/ekspor" className="font-semibold text-brand-700 hover:underline">Ekspor data saya (JSON)</a>
          <form action="/auth/keluar" method="post">
            <button className="font-semibold text-slate-700 hover:underline">Keluar dari perangkat ini</button>
          </form>
        </div>
      </Card>
      <Card className="border-red-200">
        <h2 className="font-bold text-red-700">Hapus akun</h2>
        <div className="mt-3">
          <DeleteAccount />
        </div>
      </Card>
    </div>
  );
}
