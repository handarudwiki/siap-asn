import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, Input, PageHeader, Select, buttonClass } from "@/components/ui";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { ROLE_LABEL, type Role } from "@/lib/types";

export const metadata: Metadata = { title: "Pengguna" };

type Row = { id: string; email: string; full_name: string | null; role: Role; formation_type: string; suspended: boolean; created_at: string; last_sign_in_at: string | null; premium: boolean; attempts: number; total_count: number };
const PER = 50;

export default async function AdminUsersPage(props: PageProps<"/admin/pengguna">) {
  await requireStaff("admin");
  const sp = await props.searchParams;
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const role = typeof sp.role === "string" && sp.role in ROLE_LABEL ? (sp.role as Role) : null;
  const page = Math.max(1, Number(sp.page) || 1);
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("admin_list_users", { p_search: q || null, p_role: role, p_limit: PER, p_offset: (page - 1) * PER });
  const rows = (data ?? []) as Row[];
  const total = rows[0]?.total_count ?? 0;
  const base = `/admin/pengguna?${new URLSearchParams({ ...(q ? { q } : {}), ...(role ? { role } : {}) })}`;

  return (
    <div>
      <PageHeader title="Pengguna" description={`${total} akun`} />
      <form className="mb-4 flex flex-col gap-2 sm:flex-row" method="get">
        <Input name="q" defaultValue={q} placeholder="Cari nama atau email…" />
        <Select name="role" defaultValue={role ?? ""} className="sm:w-48">
          <option value="">Semua peran</option>
          {Object.entries(ROLE_LABEL).map(([k, v]) => (
            <option key={k} value={k}>
              {v}
            </option>
          ))}
        </Select>
        <button className={buttonClass("secondary")}>Cari</button>
      </form>
      {error && <p className="mb-4 text-sm text-red-600">{error.message}</p>}
      <Card className="overflow-x-auto p-0">
        <table className="w-full min-w-[820px] text-sm">
          <thead className="bg-slate-50 text-left text-xs text-slate-500">
            <tr>
              <th className="px-4 py-3">Pengguna</th>
              <th>Peran</th>
              <th>Formasi</th>
              <th>Paket</th>
              <th>Try-out</th>
              <th>Daftar</th>
              <th>Login terakhir</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {rows.map((r) => (
              <tr key={r.id}>
                <td className="px-4 py-3">
                  <Link href={`/admin/pengguna/${r.id}`} className="font-semibold text-brand-700 hover:underline">
                    {r.full_name ?? "(tanpa nama)"}
                  </Link>
                  <p className="text-xs text-slate-500">{r.email}</p>
                </td>
                <td>
                  <Badge tone={r.role === "learner" ? "slate" : "purple"}>{ROLE_LABEL[r.role]}</Badge> {r.suspended && <Badge tone="red">Ditangguhkan</Badge>}
                </td>
                <td>{r.formation_type}</td>
                <td>{r.premium ? <Badge tone="green">Premium</Badge> : <span className="text-xs text-slate-400">Gratis</span>}</td>
                <td>{r.attempts}</td>
                <td className="text-xs">{dateWIB(r.created_at)}</td>
                <td className="text-xs">{dateWIB(r.last_sign_in_at, true)}</td>
              </tr>
            ))}
            {!rows.length && (
              <tr>
                <td colSpan={7} className="px-4 py-8 text-center text-slate-500">
                  Tidak ada pengguna.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </Card>
      <div className="mt-4 flex justify-end gap-3 text-sm">
        {page > 1 && <Link href={`${base}&page=${page - 1}`}>← Sebelumnya</Link>}
        {total > page * PER && <Link href={`${base}&page=${page + 1}`}>Berikutnya →</Link>}
      </div>
    </div>
  );
}
