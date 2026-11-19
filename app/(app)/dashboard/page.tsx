import Link from "next/link";
import type { Metadata } from "next";
import { Alert, Badge, Card, LinkButton, Progress } from "@/components/ui";
import { ScoreTrend } from "@/components/learn/score-trend";
import { getEntitlements, requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB, daysUntil } from "@/lib/format";
import { studyStreak } from "@/lib/streak";
import { TESTS, type Attempt, type TestCode } from "@/lib/types";

export const metadata: Metadata = { title: "Beranda" };

type AttemptRow = Attempt & { tryouts: { title: string } | null };

export default async function DashboardPage(props: PageProps<"/dashboard">) {
  const user = await requireUser();
  const supabase = await createClient();
  const sp = await props.searchParams;
  await supabase.rpc("finalize_my_expired_attempts");

  const [{ data: attemptsRaw }, { data: weakRaw }, { data: catalog }, { data: progress }, { data: announcements }, ent, { data: active }] = await Promise.all([
    supabase.from("attempts").select("*, tryouts(title)").eq("user_id", user.id).not("submitted_at", "is", null).order("submitted_at").limit(20),
    supabase.rpc("get_weak_subtopics", { p_limit: 4 }),
    supabase.from("lesson_catalog").select("id, test_code"),
    supabase.from("lesson_progress").select("lesson_id, completed_at").eq("user_id", user.id),
    supabase.from("announcements").select("id, title, body, segment").eq("published", true).order("created_at", { ascending: false }).limit(3),
    getEntitlements(user.id),
    supabase.from("attempts").select("id, deadline, tryouts(title)").eq("user_id", user.id).is("submitted_at", null).gt("deadline", new Date().toISOString()).limit(1).maybeSingle(),
  ]);

  const attempts = (attemptsRaw ?? []) as AttemptRow[];
  const weak = (weakRaw ?? []) as { subtopic_id: string; subtopic_name: string; test_code: TestCode; answered: number; accuracy: number }[];
  const last = attempts.at(-1);
  const first = attempts[0];
  const done = new Set((progress ?? []).map((p) => p.lesson_id));
  const perTest = TESTS.map((t) => {
    const ids = (catalog ?? []).filter((c) => c.test_code === t.code).map((c) => c.id);
    const completed = ids.filter((id) => done.has(id)).length;
    return { ...t, total: ids.length, completed, pct: ids.length ? (completed / ids.length) * 100 : 0 };
  });

  // study streak: consecutive WIB days with a completed lesson or practice/try-out
  const { data: practiceDays } = await supabase.from("practice_answers").select("created_at").eq("user_id", user.id).order("created_at", { ascending: false }).limit(500);
  const streak = studyStreak([
    ...(progress ?? []).map((p) => p.completed_at),
    ...(practiceDays ?? []).map((p) => p.created_at),
    ...attempts.map((a) => a.submitted_at!),
  ]);

  const countdown = daysUntil(user.profile.exam_date);
  const name = user.profile.full_name?.split(" ")[0] ?? "Pejuang";
  const visibleAnnouncements = (announcements ?? []).filter((a) => a.segment === "all" || (a.segment === "premium") === ent.premium);

  return (
    <div className="space-y-6">
      {sp.welcome && (
        <Alert tone="green">
          Profil tersimpan! Langkah pertama yang kami sarankan: kerjakan <Link href="/tryout" className="font-semibold underline">try-out gratis</Link> untuk mengukur posisi awal Anda.
        </Alert>
      )}
      {active && (
        <Alert tone="amber">
          Anda punya try-out yang sedang berjalan: <b>{(active.tryouts as unknown as { title: string } | null)?.title}</b>.{" "}
          <Link href={`/ujian/${active.id}`} className="font-semibold underline">
            Lanjutkan sekarang
          </Link>{" "}
          — waktu tetap berjalan.
        </Alert>
      )}

      <div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold">Halo, {name} 👋</h1>
          <p className="mt-1 text-sm text-slate-600">
            {countdown !== null && countdown >= 0 ? (
              <>
                <b className="text-brand-700">{countdown} hari</b> menuju ujian ({dateWIB(user.profile.exam_date)}).
              </>
            ) : (
              "Atur tanggal ujian di profil untuk melihat hitung mundur."
            )}
          </p>
        </div>
        <div className="flex gap-2">
          <LinkButton href="/latihan" variant="secondary">
            Latihan
          </LinkButton>
          <LinkButton href="/tryout">Mulai try-out</LinkButton>
        </div>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Card>
          <p className="text-xs font-medium text-slate-500">Skor terakhir</p>
          <p className="mt-1 text-3xl font-extrabold">{last?.total_score ?? "–"}<span className="text-sm font-medium text-slate-400">/550</span></p>
          {last && (
            <Badge tone={last.passed ? "green" : "red"} className="mt-2">
              {last.passed ? "Lolos passing grade" : "Belum lolos"}
            </Badge>
          )}
        </Card>
        <Card>
          <p className="text-xs font-medium text-slate-500">Kenaikan sejak try-out pertama</p>
          <p className="mt-1 text-3xl font-extrabold">
            {first && last && attempts.length > 1 ? `${(last.total_score ?? 0) - (first.total_score ?? 0) >= 0 ? "+" : ""}${(last.total_score ?? 0) - (first.total_score ?? 0)}` : "–"}
          </p>
          <p className="mt-2 text-xs text-slate-500">{attempts.length} try-out selesai</p>
        </Card>
        <Card>
          <p className="text-xs font-medium text-slate-500">Streak belajar</p>
          <p className="mt-1 text-3xl font-extrabold">{streak} <span className="text-sm font-medium text-slate-400">hari</span></p>
          <p className="mt-2 text-xs text-slate-500">Target {user.profile.daily_study_minutes ?? 60} menit/hari</p>
        </Card>
        <Card>
          <p className="text-xs font-medium text-slate-500">Paket</p>
          {ent.premium ? (
            <>
              <p className="mt-1 font-bold">{ent.packages[0].name}</p>
              <p className="mt-1 text-xs text-slate-500">Aktif s.d. {dateWIB(ent.packages[0].expires_at)}</p>
            </>
          ) : (
            <>
              <p className="mt-1 font-bold">Gratis</p>
              <Link href="/paket" className="mt-1 inline-block text-xs font-semibold text-brand-700 hover:underline">
                Upgrade untuk akses penuh →
              </Link>
            </>
          )}
        </Card>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <Card className="lg:col-span-2">
          <div className="flex items-center justify-between">
            <h2 className="font-bold">Tren skor try-out</h2>
            <Link href="/tryout/riwayat" className="text-sm font-semibold text-brand-700 hover:underline">
              Riwayat
            </Link>
          </div>
          {attempts.length ? (
            <div className="mt-4">
              <ScoreTrend points={attempts.map((a) => ({ label: a.tryouts?.title ?? "", total: a.total_score ?? 0, passed: a.passed }))} />
            </div>
          ) : (
            <p className="mt-6 text-sm text-slate-500">Belum ada try-out. Kerjakan try-out pertama untuk melihat tren skor Anda.</p>
          )}
          {last?.thresholds && (
            <div className="mt-6 grid gap-4 sm:grid-cols-3">
              {(["twk", "tiu", "tkp"] as const).map((k) => {
                const score = last[`${k}_score`] ?? 0;
                const thr = last.thresholds?.[k];
                const max = last.thresholds?.[`max_${k}`] ?? 1;
                return (
                  <div key={k}>
                    <div className="flex justify-between text-xs">
                      <span className="font-semibold uppercase">{k}</span>
                      <span>
                        {score}
                        {thr != null && <span className="text-slate-400"> / min {thr}</span>}
                      </span>
                    </div>
                    <Progress value={(score / max) * 100} tone={thr == null || score >= thr ? "green" : "red"} className="mt-1" />
                  </div>
                );
              })}
            </div>
          )}
        </Card>

        <Card>
          <h2 className="font-bold">Titik lemah Anda</h2>
          {weak.length ? (
            <ul className="mt-4 space-y-3">
              {weak.map((w) => (
                <li key={w.subtopic_id}>
                  <div className="flex justify-between text-sm">
                    <span>
                      <Badge tone="slate" className="mr-2">{w.test_code}</Badge>
                      {w.subtopic_name}
                    </span>
                    <span className="font-semibold">{w.accuracy}%</span>
                  </div>
                  <Progress value={w.accuracy} tone={w.accuracy < 50 ? "red" : w.accuracy < 75 ? "amber" : "green"} className="mt-1" />
                </li>
              ))}
            </ul>
          ) : (
            <p className="mt-4 text-sm text-slate-500">Kerjakan latihan atau try-out — kami akan mendeteksi sub-topik dengan akurasi terendah.</p>
          )}
          <LinkButton href="/latihan/sesi?mode=weak" variant="secondary" className="mt-5 w-full">
            Drill titik lemah
          </LinkButton>
        </Card>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <Card className="lg:col-span-2">
          <div className="flex items-center justify-between">
            <h2 className="font-bold">Progres materi</h2>
            <Link href="/materi" className="text-sm font-semibold text-brand-700 hover:underline">
              Buka materi
            </Link>
          </div>
          <div className="mt-4 space-y-4">
            {perTest.map((t) => (
              <div key={t.code}>
                <div className="flex justify-between text-sm">
                  <span className="font-medium">
                    {t.code} · {t.short}
                  </span>
                  <span className="text-slate-500">
                    {t.completed}/{t.total} materi
                  </span>
                </div>
                <Progress value={t.pct} className="mt-1" />
              </div>
            ))}
          </div>
        </Card>
        <Card>
          <h2 className="font-bold">Pengumuman</h2>
          <ul className="mt-4 space-y-4">
            {visibleAnnouncements.length ? (
              visibleAnnouncements.map((a) => (
                <li key={a.id}>
                  <p className="text-sm font-semibold">{a.title}</p>
                  <p className="text-sm text-slate-600">{a.body}</p>
                </li>
              ))
            ) : (
              <li className="text-sm text-slate-500">Belum ada pengumuman.</li>
            )}
          </ul>
        </Card>
      </div>
    </div>
  );
}
