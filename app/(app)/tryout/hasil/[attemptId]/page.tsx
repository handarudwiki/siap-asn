import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import type { Metadata } from "next";
import { Alert, Badge, Card, LinkButton, Progress } from "@/components/ui";
import { ReviewList, type ReviewItem } from "@/components/tryout/review-list";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB, duration } from "@/lib/format";
import type { Attempt } from "@/lib/types";

export const metadata: Metadata = { title: "Hasil try-out" };

type Rank = { rank: number; participants: number; rank_formation: number; participants_formation: number; percentile: number | null; counts_for_ranking: boolean };
type Analysis = { subtopic: string; test_code: string; questions: number; my_accuracy: number; avg_accuracy: number; avg_time_s: number };

export default async function ResultPage(props: PageProps<"/tryout/hasil/[attemptId]">) {
  const { attemptId } = await props.params;
  const user = await requireUser();
  const supabase = await createClient();
  await supabase.rpc("finalize_my_expired_attempts");
  const { data: a } = await supabase.from("attempts").select("*, tryouts(title, slug)").eq("id", attemptId).eq("user_id", user.id).maybeSingle();
  if (!a) notFound();
  const attempt = a as Attempt & { tryouts: { title: string; slug: string } };
  if (!attempt.submitted_at) redirect(`/ujian/${attemptId}`);

  const [{ data: rank }, { data: analysis }, { data: review }] = await Promise.all([
    supabase.rpc("get_my_rank", { p_attempt: attemptId }),
    supabase.rpc("get_attempt_analysis", { p_attempt: attemptId }),
    supabase.rpc("get_attempt_review", { p_attempt: attemptId }),
  ]);
  const r = rank as Rank | null;
  const rv = review as { discussion_visible: boolean; discussion_opens_at: string | null; items: ReviewItem[] } | null;
  const th = attempt.thresholds;
  const tests = [
    { code: "TWK", score: attempt.twk_score ?? 0, min: th?.twk, max: th?.max_twk ?? 150 },
    { code: "TIU", score: attempt.tiu_score ?? 0, min: th?.tiu, max: th?.max_tiu ?? 175 },
    { code: "TKP", score: attempt.tkp_score ?? 0, min: th?.tkp, max: th?.max_tkp ?? 225 },
  ];
  const maxTotal = tests.reduce((s, t) => s + t.max, 0);
  const elapsed = new Date(attempt.submitted_at).getTime() - new Date(attempt.started_at).getTime();
  const weakest = ((analysis ?? []) as Analysis[]).slice().sort((x, y) => x.my_accuracy - y.my_accuracy).slice(0, 3);

  return (
    <div className="mx-auto max-w-4xl space-y-6">
      <Link href={`/tryout/${attempt.tryouts.slug}`} className="text-sm text-brand-700 hover:underline">
        ← {attempt.tryouts.title}
      </Link>

      <Card className={attempt.passed ? "border-emerald-200 bg-emerald-50/40" : "border-red-200 bg-red-50/40"}>
        <div className="flex flex-col gap-6 sm:flex-row sm:items-center sm:justify-between">
          <div>
            <p className="text-sm text-slate-600">
              Percobaan #{attempt.attempt_no} · {dateWIB(attempt.submitted_at, true)} · durasi {duration(elapsed)}
              {attempt.auto_submitted && " · dikumpulkan otomatis"}
            </p>
            <p className="mt-2 text-5xl font-extrabold">
              {attempt.total_score}
              <span className="text-xl text-slate-400">/{maxTotal}</span>
            </p>
            <Badge tone={attempt.passed ? "green" : "red"} className="mt-3 text-sm">
              {attempt.passed ? "✓ Memenuhi passing grade" : "✗ Belum memenuhi passing grade"}
            </Badge>
            {th && (
              <p className="mt-2 text-xs text-slate-500">
                Profil: {th.profile}
                {th.rule === "cumulative" && ` · aturan kumulatif: total ≥ ${th.total}, TIU ≥ ${th.tiu}`}
                {maxTotal < 550 && " · ambang disesuaikan proporsional dengan jumlah soal"}
              </p>
            )}
          </div>
          {r && (
            <div className="grid grid-cols-2 gap-3 text-center">
              <div className="rounded-xl bg-white p-4 ring-1 ring-slate-200">
                <p className="text-2xl font-extrabold">#{r.rank}</p>
                <p className="text-xs text-slate-500">dari {r.participants} peserta</p>
              </div>
              <div className="rounded-xl bg-white p-4 ring-1 ring-slate-200">
                <p className="text-2xl font-extrabold">{r.percentile ?? "–"}%</p>
                <p className="text-xs text-slate-500">persentil</p>
              </div>
              <div className="col-span-2 text-xs text-slate-500">
                {r.counts_for_ranking ? `#${r.rank_formation} dari ${r.participants_formation} di formasi Anda` : "Percobaan ulang tidak dihitung dalam ranking"}
              </div>
            </div>
          )}
        </div>
        <div className="mt-6 grid gap-4 sm:grid-cols-3">
          {tests.map((t) => {
            const ok = t.min == null || t.score >= t.min;
            return (
              <div key={t.code} className="rounded-xl bg-white p-4 ring-1 ring-slate-200">
                <div className="flex items-center justify-between">
                  <span className="font-bold">{t.code}</span>
                  {t.min != null && <Badge tone={ok ? "green" : "red"}>{ok ? "Lolos" : "Di bawah ambang"}</Badge>}
                </div>
                <p className="mt-2 text-2xl font-extrabold">
                  {t.score}
                  <span className="text-sm text-slate-400">/{t.max}</span>
                </p>
                <Progress value={(t.score / t.max) * 100} tone={ok ? "green" : "red"} className="mt-2" />
                {t.min != null && <p className="mt-1 text-xs text-slate-500">Ambang batas {t.min}</p>}
              </div>
            );
          })}
        </div>
      </Card>

      {attempt.tab_switches > 0 && <Alert tone="amber">Tercatat {attempt.tab_switches} kali perpindahan tab selama try-out.</Alert>}

      {(analysis ?? []).length > 0 && (
        <Card>
          <h2 className="font-bold">Analisis per sub-topik</h2>
          <div className="mt-4 overflow-x-auto">
            <table className="w-full min-w-[520px] text-sm">
              <thead className="text-left text-xs text-slate-500">
                <tr>
                  <th className="py-2">Sub-topik</th>
                  <th>Soal</th>
                  <th>Akurasi Anda</th>
                  <th>Rata-rata peserta</th>
                  <th>Waktu/soal</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {((analysis ?? []) as Analysis[]).map((x) => (
                  <tr key={x.test_code + x.subtopic}>
                    <td className="py-2">
                      <Badge className="mr-2">{x.test_code}</Badge>
                      {x.subtopic}
                    </td>
                    <td>{x.questions}</td>
                    <td className={x.my_accuracy < x.avg_accuracy ? "font-semibold text-red-600" : "font-semibold text-emerald-600"}>{x.my_accuracy}%</td>
                    <td>{x.avg_accuracy}%</td>
                    <td>{x.avg_time_s} dtk</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {weakest.length > 0 && (
            <p className="mt-4 text-sm text-slate-600">
              Prioritas belajar: <b>{weakest.map((w) => w.subtopic).join(", ")}</b>.{" "}
              <Link href="/latihan/sesi?mode=weak" className="font-semibold text-brand-700 underline">
                Drill sekarang
              </Link>
            </p>
          )}
        </Card>
      )}

      <div className="flex flex-wrap gap-2">
        <LinkButton href={`/tryout/${attempt.tryouts.slug}/ranking`} variant="secondary">
          Ranking nasional
        </LinkButton>
        <LinkButton href="/tryout">Try-out lainnya</LinkButton>
      </div>

      <section>
        <h2 className="mb-3 text-lg font-bold">Pembahasan</h2>
        {rv?.discussion_visible ? (
          <ReviewList items={rv.items} />
        ) : (
          <Alert tone="brand">Pembahasan try-out terjadwal dibuka setelah jendela ditutup ({dateWIB(rv?.discussion_opens_at, true)}).</Alert>
        )}
      </section>
    </div>
  );
}
