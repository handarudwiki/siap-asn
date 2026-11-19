import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, Input, LinkButton, PageHeader, Select } from "@/components/ui";
import { StatusBadge } from "@/components/admin/status-badge";
import { SubmitButton } from "@/components/admin/submit-button";
import { canPublishRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { subtopicOptions } from "@/lib/admin-data";
import { dateWIB } from "@/lib/format";
import { STATUS_LABEL, type ContentStatus, type Question } from "@/lib/types";
import { bulkStatus } from "./actions";

export const metadata: Metadata = { title: "Bank soal" };
const PAGE = 50;

export default async function QuestionBankPage(props: PageProps<"/admin/soal">) {
  const user = await requireStaff();
  const sp = await props.searchParams;
  const s = (k: string) => (typeof sp[k] === "string" ? (sp[k] as string) : "");
  const page = Math.max(1, Number(s("page")) || 1);
  const supabase = await createClient();
  const subs = await subtopicOptions();

  let q = supabase
    .from("questions")
    .select("id, test_code, stem, difficulty, usage, status, version, updated_at, subtopic_id", { count: "exact" })
    .order("updated_at", { ascending: false })
    .range((page - 1) * PAGE, page * PAGE - 1);
  if (s("test")) q = q.eq("test_code", s("test"));
  if (s("status")) q = q.eq("status", s("status"));
  if (s("difficulty")) q = q.eq("difficulty", s("difficulty"));
  if (s("sub")) q = q.eq("subtopic_id", s("sub"));
  if (s("q")) q = q.ilike("stem", `%${s("q").replace(/[%_]/g, "")}%`);
  const { data, count } = await q;
  const rows = (data ?? []) as Pick<Question, "id" | "test_code" | "stem" | "difficulty" | "usage" | "status" | "version" | "updated_at" | "subtopic_id">[];
  const subName = Object.fromEntries(subs.map((x) => [x.id, x.label.split("› ")[1]]));
  const total = count ?? 0;
  const qs = (p: number) => new URLSearchParams({ ...Object.fromEntries(Object.entries(sp).filter(([, v]) => typeof v === "string")) as Record<string, string>, page: String(p) }).toString();

  return (
    <div>
      <PageHeader
        title="Bank soal"
        description={`${total.toLocaleString("id-ID")} soal`}
        actions={
          <>
            <LinkButton href="/admin/soal/impor" variant="secondary">Impor CSV</LinkButton>
            <LinkButton href="/admin/soal/baru">+ Soal baru</LinkButton>
          </>
        }
      />
      <Card className="mb-4">
        <form className="grid gap-3 md:grid-cols-6">
          <Input name="q" defaultValue={s("q")} placeholder="Cari teks soal…" className="md:col-span-2" aria-label="Cari" />
          <Select name="test" defaultValue={s("test")} aria-label="Tes">
            <option value="">Semua tes</option>
            <option>TWK</option>
            <option>TIU</option>
            <option>TKP</option>
          </Select>
          <Select name="status" defaultValue={s("status")} aria-label="Status">
            <option value="">Semua status</option>
            {Object.entries(STATUS_LABEL).map(([k, v]) => (
              <option key={k} value={k}>{v}</option>
            ))}
          </Select>
          <Select name="difficulty" defaultValue={s("difficulty")} aria-label="Kesulitan">
            <option value="">Semua kesulitan</option>
            <option value="easy">Mudah</option>
            <option value="medium">Sedang</option>
            <option value="hard">Sulit</option>
          </Select>
          <Select name="sub" defaultValue={s("sub")} aria-label="Sub-topik">
            <option value="">Semua sub-topik</option>
            {subs.map((x) => (
              <option key={x.id} value={x.id}>{x.label}</option>
            ))}
          </Select>
          <div className="md:col-span-6">
            <SubmitButton size="sm" variant="secondary" pendingText="Memfilter…">Terapkan filter</SubmitButton>
          </div>
        </form>
      </Card>

      {rows.length ? (
        <form action={bulkStatus}>
          <Card className="overflow-x-auto p-0">
            <table className="w-full min-w-[760px] text-sm">
              <thead className="bg-slate-50 text-left text-xs text-slate-500">
                <tr>
                  <th className="w-8 px-4 py-3" />
                  <th>Soal</th>
                  <th>Tes</th>
                  <th>Sub-topik</th>
                  <th>Kesulitan</th>
                  <th>Status</th>
                  <th className="pr-4">Diperbarui</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {rows.map((r) => (
                  <tr key={r.id} className="hover:bg-slate-50">
                    <td className="px-4 py-2.5">
                      <input type="checkbox" name="ids" value={r.id} aria-label="Pilih soal" />
                    </td>
                    <td className="max-w-md py-2.5">
                      <Link href={`/admin/soal/${r.id}`} className="line-clamp-2 text-brand-800 hover:underline">
                        {r.stem}
                      </Link>
                      {r.version > 1 && <span className="text-xs text-slate-400">v{r.version}</span>}
                    </td>
                    <td><Badge tone="brand">{r.test_code}</Badge></td>
                    <td className="text-xs">{r.subtopic_id ? subName[r.subtopic_id] : "—"}</td>
                    <td className="text-xs">{{ easy: "Mudah", medium: "Sedang", hard: "Sulit" }[r.difficulty]}</td>
                    <td><StatusBadge status={r.status as ContentStatus} /></td>
                    <td className="pr-4 text-xs text-slate-500">{dateWIB(r.updated_at)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </Card>
          <div className="mt-3 flex flex-wrap items-center justify-between gap-3">
            <div className="flex items-center gap-2">
              <Select name="status" className="w-48" aria-label="Ubah status terpilih">
                <option value="in_review">Ajukan review</option>
                {canPublishRole(user.profile.role) && <option value="published">Terbitkan</option>}
                <option value="draft">Kembalikan ke draft</option>
                <option value="archived">Arsipkan</option>
              </Select>
              <SubmitButton size="sm" variant="secondary">Terapkan ke terpilih</SubmitButton>
            </div>
            <div className="flex items-center gap-3 text-sm">
              {page > 1 && <Link href={`?${qs(page - 1)}`} className="text-brand-700 hover:underline">← Sebelumnya</Link>}
              <span className="text-slate-500">Hal. {page} / {Math.max(1, Math.ceil(total / PAGE))}</span>
              {page * PAGE < total && <Link href={`?${qs(page + 1)}`} className="text-brand-700 hover:underline">Berikutnya →</Link>}
            </div>
          </div>
        </form>
      ) : (
        <EmptyState title="Tidak ada soal" description="Ubah filter atau tambahkan soal baru." />
      )}
    </div>
  );
}
