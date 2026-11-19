import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, LinkButton, PageHeader, cn } from "@/components/ui";
import { StatusBadge } from "@/components/admin/status-badge";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { STATUS_LABEL, type ContentStatus } from "@/lib/types";

export const metadata: Metadata = { title: "Materi" };

export default async function AdminLessonsPage(props: PageProps<"/admin/materi">) {
  await requireStaff();
  const sp = await props.searchParams;
  const status = typeof sp.status === "string" ? (sp.status as ContentStatus) : null;
  const supabase = await createClient();
  let q = supabase.from("lessons").select("id, title, slug, status, is_free, updated_at, subtopics(name, topics(test_code))").order("updated_at", { ascending: false });
  if (status) q = q.eq("status", status);
  const { data } = await q;
  const rows = (data ?? []) as unknown as { id: string; title: string; slug: string; status: ContentStatus; is_free: boolean; updated_at: string; subtopics: { name: string; topics: { test_code: string } } | null }[];

  return (
    <div>
      <PageHeader title="Materi" actions={<LinkButton href="/admin/materi/baru">+ Materi baru</LinkButton>} />
      <div className="mb-4 flex flex-wrap gap-2">
        {[null, "draft", "in_review", "published", "archived"].map((s) => (
          <Link key={s ?? "all"} href={s ? `?status=${s}` : "?"} className={cn("rounded-full px-3 py-1 text-sm", status === s ? "bg-slate-900 text-white" : "bg-white ring-1 ring-slate-200")}>
            {s ? STATUS_LABEL[s as ContentStatus] : "Semua"}
          </Link>
        ))}
      </div>
      {rows.length ? (
        <Card className="overflow-x-auto p-0">
          <table className="w-full min-w-[640px] text-sm">
            <thead className="bg-slate-50 text-left text-xs text-slate-500">
              <tr>
                <th className="px-4 py-3">Judul</th>
                <th>Tes / Sub-topik</th>
                <th>Akses</th>
                <th>Status</th>
                <th>Diperbarui</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {rows.map((r) => (
                <tr key={r.id} className="hover:bg-slate-50">
                  <td className="px-4 py-3">
                    <Link href={`/admin/materi/${r.id}`} className="font-semibold text-brand-700 hover:underline">
                      {r.title}
                    </Link>
                  </td>
                  <td>
                    <Badge className="mr-1">{r.subtopics?.topics.test_code}</Badge>
                    {r.subtopics?.name}
                  </td>
                  <td>{r.is_free ? <Badge tone="green">Gratis</Badge> : <Badge tone="amber">Paket</Badge>}</td>
                  <td>
                    <StatusBadge status={r.status} />
                  </td>
                  <td className="text-xs text-slate-500">{dateWIB(r.updated_at, true)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Card>
      ) : (
        <EmptyState title="Belum ada materi" action={<LinkButton href="/admin/materi/baru">Buat materi</LinkButton>} />
      )}
    </div>
  );
}
