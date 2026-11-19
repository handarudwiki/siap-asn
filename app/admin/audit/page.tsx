import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, PageHeader, Select, buttonClass } from "@/components/ui";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";

export const metadata: Metadata = { title: "Audit log" };

const ENTITIES = ["topics", "subtopics", "lessons", "questions", "tryouts", "packages", "vouchers", "passing_grade_profiles", "user_packages", "announcements", "profiles", "transactions"];
const PER = 50;
type Log = { id: number; actor_id: string | null; action: string; entity: string; entity_id: string | null; details: Record<string, unknown> | null; created_at: string };

export default async function AuditPage(props: PageProps<"/admin/audit">) {
  await requireStaff("super_admin");
  const sp = await props.searchParams;
  const entity = typeof sp.entity === "string" && ENTITIES.includes(sp.entity) ? sp.entity : "";
  const page = Math.max(1, Number(sp.page) || 1);
  const supabase = await createClient();
  let q = supabase.from("audit_logs").select("*", { count: "exact" }).order("created_at", { ascending: false }).range((page - 1) * PER, page * PER - 1);
  if (entity) q = q.eq("entity", entity);
  const { data, count } = await q;
  const logs = (data ?? []) as Log[];
  const actorIds = [...new Set(logs.map((l) => l.actor_id).filter(Boolean))] as string[];
  const { data: actors } = actorIds.length ? await supabase.from("profiles").select("id, full_name").in("id", actorIds) : { data: [] as { id: string; full_name: string | null }[] };
  const name = (id: string | null) => (id ? (actors ?? []).find((a) => a.id === id)?.full_name ?? id.slice(0, 8) : "Sistem / webhook");
  const base = `/admin/audit?${entity ? `entity=${entity}&` : ""}`;

  return (
    <div>
      <PageHeader title="Audit log" description={`${count ?? 0} entri · setiap perubahan data admin tercatat otomatis.`} />
      <form className="mb-4 flex gap-2" method="get">
        <Select name="entity" defaultValue={entity} className="sm:w-60">
          <option value="">Semua entitas</option>
          {ENTITIES.map((e) => (
            <option key={e} value={e}>
              {e}
            </option>
          ))}
        </Select>
        <button className={buttonClass("secondary")}>Filter</button>
      </form>
      <Card className="overflow-x-auto p-0">
        <table className="w-full min-w-[720px] text-sm">
          <thead className="bg-slate-50 text-left text-xs text-slate-500">
            <tr>
              <th className="px-4 py-3">Waktu</th>
              <th>Aktor</th>
              <th>Aksi</th>
              <th>Entitas</th>
              <th>ID</th>
              <th className="pr-4">Detail</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {logs.map((l) => (
              <tr key={l.id}>
                <td className="px-4 py-2 text-xs">{dateWIB(l.created_at, true)}</td>
                <td>{name(l.actor_id)}</td>
                <td>
                  <Badge tone={l.action === "delete" ? "red" : l.action === "insert" ? "green" : "brand"}>{l.action}</Badge>
                </td>
                <td>{l.entity}</td>
                <td className="font-mono text-xs">{l.entity_id?.slice(0, 8)}</td>
                <td className="pr-4 text-xs text-slate-500">{l.details ? JSON.stringify(l.details) : ""}</td>
              </tr>
            ))}
            {!logs.length && (
              <tr>
                <td colSpan={6} className="px-4 py-8 text-center text-slate-500">
                  Belum ada entri.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </Card>
      <div className="mt-4 flex justify-end gap-3 text-sm">
        {page > 1 && <Link href={`${base}page=${page - 1}`}>← Sebelumnya</Link>}
        {(count ?? 0) > page * PER && <Link href={`${base}page=${page + 1}`}>Berikutnya →</Link>}
      </div>
    </div>
  );
}
