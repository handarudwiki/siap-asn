import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Alert, Card } from "@/components/ui";
import { QuestionEditor } from "@/components/admin/question-editor";
import { StatusBadge } from "@/components/admin/status-badge";
import { SubmitButton } from "@/components/admin/submit-button";
import { canPublishRole, isAdminRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { subtopicOptions } from "@/lib/admin-data";
import type { Question } from "@/lib/types";
import { createVersion, deleteQuestion } from "../actions";

export const metadata: Metadata = { title: "Editor soal" };

type Stats = { times_answered: number; pct_full_points: number | null; avg_time_s: number | null; distribution: Record<string, number> | null };

export default async function QuestionEditPage(props: PageProps<"/admin/soal/[id]">) {
  const { id } = await props.params;
  const sp = await props.searchParams;
  const user = await requireStaff();
  const supabase = await createClient();
  const isNew = id === "baru";
  const { data: question } = isNew ? { data: null } : await supabase.from("questions").select("*").eq("id", id).maybeSingle<Question>();
  if (!isNew && !question) notFound();

  let locked = false;
  let stats: Stats | null = null;
  let usedIn: { id: string; title: string }[] = [];
  let reports: { id: string; message: string; status: string }[] = [];
  if (question) {
    const { data: tq } = await supabase.from("tryout_questions").select("tryout_id, tryouts(id, title)").eq("question_id", id);
    usedIn = ((tq ?? []) as unknown as { tryouts: { id: string; title: string } }[]).map((x) => x.tryouts);
    if (usedIn.length) {
      const { count } = await supabase.from("attempts").select("id", { count: "exact", head: true }).in("tryout_id", usedIn.map((u) => u.id));
      locked = (count ?? 0) > 0;
    }
    const [{ data: st }, { data: rp }] = await Promise.all([
      supabase.from("question_stats").select("*").eq("question_id", id).maybeSingle(),
      supabase.from("question_reports").select("id, message, status").eq("question_id", id).order("created_at", { ascending: false }),
    ]);
    stats = st as Stats | null;
    reports = rp ?? [];
  }
  const subs = await subtopicOptions();

  return (
    <div className="space-y-6">
      <div>
        <Link href="/admin/soal" className="text-sm text-brand-700 hover:underline">← Bank soal</Link>
        <h1 className="mt-1 flex items-center gap-3 text-2xl font-bold">
          {isNew ? "Soal baru" : `Soal ${question!.test_code} · v${question!.version}`} {question && <StatusBadge status={question.status} />}
        </h1>
      </div>
      {sp.saved && <Alert tone="green">Soal tersimpan. Silakan tulis soal berikutnya.</Alert>}
      {sp.error === "delete" && <Alert>Soal tidak dapat dihapus karena sudah dipakai. Arsipkan saja.</Alert>}
      <div className="grid gap-6 xl:grid-cols-3">
        <Card className="xl:col-span-2">
          <QuestionEditor key={question?.id ?? "new"} question={question} subtopics={subs} canPublish={canPublishRole(user.profile.role)} locked={locked} />
        </Card>
        {question && (
          <div className="space-y-6">
            <Card>
              <h2 className="font-bold">Statistik</h2>
              <dl className="mt-3 space-y-1 text-sm">
                <div className="flex justify-between"><dt className="text-slate-500">Dijawab (try-out)</dt><dd>{stats?.times_answered ?? 0}</dd></div>
                <div className="flex justify-between"><dt className="text-slate-500">% poin penuh</dt><dd>{stats?.pct_full_points ?? "–"}%</dd></div>
                <div className="flex justify-between"><dt className="text-slate-500">Rata-rata waktu</dt><dd>{stats?.avg_time_s ?? "–"} dtk</dd></div>
              </dl>
              {stats?.distribution && (
                <div className="mt-3 space-y-1">
                  {["A", "B", "C", "D", "E"].map((l) => {
                    const n = stats!.distribution?.[l] ?? 0;
                    const pct = stats!.times_answered ? (n / stats!.times_answered) * 100 : 0;
                    return (
                      <div key={l} className="flex items-center gap-2 text-xs">
                        <b className="w-4">{l}</b>
                        <div className="h-2 flex-1 rounded bg-slate-100"><div className="h-2 rounded bg-brand-500" style={{ width: `${pct}%` }} /></div>
                        <span className="w-10 text-right">{Math.round(pct)}%</span>
                      </div>
                    );
                  })}
                </div>
              )}
            </Card>
            <Card>
              <h2 className="font-bold">Dipakai di try-out</h2>
              {usedIn.length ? (
                <ul className="mt-2 list-disc pl-5 text-sm">
                  {usedIn.map((u) => <li key={u.id}><Link href={`/admin/tryout/${u.id}`} className="text-brand-700 hover:underline">{u.title}</Link></li>)}
                </ul>
              ) : (
                <p className="mt-2 text-sm text-slate-500">Belum dipakai.</p>
              )}
              <form action={createVersion} className="mt-4">
                <input type="hidden" name="id" value={question.id} />
                <SubmitButton size="sm" variant="secondary" pendingText="Membuat…">Buat versi baru</SubmitButton>
              </form>
              {question.parent_id && (
                <Link href={`/admin/soal/${question.parent_id}`} className="mt-2 block text-xs text-brand-700 hover:underline">Lihat versi sebelumnya</Link>
              )}
            </Card>
            <Card>
              <h2 className="font-bold">Laporan peserta</h2>
              {reports.length ? (
                <ul className="mt-2 space-y-2 text-sm">
                  {reports.map((r) => <li key={r.id} className="rounded-lg bg-slate-50 p-2">{r.message} <span className="text-xs text-slate-400">({r.status})</span></li>)}
                </ul>
              ) : (
                <p className="mt-2 text-sm text-slate-500">Tidak ada laporan.</p>
              )}
            </Card>
            {isAdminRole(user.profile.role) && (
              <form action={deleteQuestion}>
                <input type="hidden" name="id" value={question.id} />
                <SubmitButton size="sm" variant="danger" pendingText="Menghapus…">Hapus soal</SubmitButton>
              </form>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
