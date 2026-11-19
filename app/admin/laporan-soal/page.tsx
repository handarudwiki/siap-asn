import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, Input, PageHeader, cn } from "@/components/ui";
import { SubmitButton } from "@/components/admin/submit-button";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { resolveReport } from "./actions";

export const metadata: Metadata = { title: "Laporan soal" };

export default async function ReportsInbox(props: PageProps<"/admin/laporan-soal">) {
  await requireStaff();
  const sp = await props.searchParams;
  const status = sp.status === "resolved" || sp.status === "rejected" ? sp.status : "open";
  const supabase = await createClient();
  const { data } = await supabase
    .from("question_reports")
    .select("id, message, status, resolution, created_at, question_id, questions(stem, test_code), profiles(full_name)")
    .eq("status", status)
    .order("created_at", { ascending: false })
    .limit(100);
  const rows = (data ?? []) as unknown as { id: string; message: string; status: string; resolution: string | null; created_at: string; question_id: string; questions: { stem: string; test_code: string } | null; profiles: { full_name: string } | null }[];
  return (
    <div>
      <PageHeader title="Laporan soal" description="Tiket “laporkan soal” dari peserta." />
      <div className="mb-4 flex gap-2">
        {(["open", "resolved", "rejected"] as const).map((s) => (
          <Link key={s} href={`?status=${s}`} className={cn("rounded-full px-3 py-1 text-sm", status === s ? "bg-slate-900 text-white" : "bg-white ring-1 ring-slate-200")}>
            {{ open: "Terbuka", resolved: "Selesai", rejected: "Ditolak" }[s]}
          </Link>
        ))}
      </div>
      {rows.length ? (
        <div className="space-y-3">
          {rows.map((r) => (
            <Card key={r.id}>
              <div className="flex flex-wrap items-center gap-2 text-xs text-slate-500">
                <Badge tone="brand">{r.questions?.test_code}</Badge>
                {r.profiles?.full_name ?? "Peserta"} · {dateWIB(r.created_at, true)}
              </div>
              <Link href={`/admin/soal/${r.question_id}`} className="mt-2 line-clamp-2 block text-sm text-brand-800 hover:underline">
                {r.questions?.stem}
              </Link>
              <p className="mt-2 rounded-lg bg-amber-50 p-3 text-sm">“{r.message}”</p>
              {r.status === "open" ? (
                <form action={resolveReport} className="mt-3 flex flex-col gap-2 sm:flex-row">
                  <input type="hidden" name="id" value={r.id} />
                  <Input name="resolution" placeholder="Catatan tindak lanjut" aria-label="Catatan" />
                  <SubmitButton size="md" name="status" value="resolved">Selesai</SubmitButton>
                  <SubmitButton size="md" variant="secondary" name="status" value="rejected">Tolak</SubmitButton>
                </form>
              ) : (
                r.resolution && <p className="mt-2 text-xs text-slate-500">Tindak lanjut: {r.resolution}</p>
              )}
            </Card>
          ))}
        </div>
      ) : (
        <EmptyState title="Tidak ada laporan" />
      )}
    </div>
  );
}
