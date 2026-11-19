import Link from "next/link";
import { notFound } from "next/navigation";
import { Alert, Badge, Card, LinkButton } from "@/components/ui";
import { StartTryoutButton } from "@/components/tryout/start-button";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { questionCount, tryoutWindowState } from "@/lib/tryout";
import type { Attempt, Tryout } from "@/lib/types";

export default async function TryoutDetailPage(props: PageProps<"/tryout/[slug]">) {
  const { slug } = await props.params;
  const user = await requireUser();
  const supabase = await createClient();
  const { data: t } = await supabase.from("tryouts").select("*").eq("slug", slug).maybeSingle<Tryout>();
  if (!t) notFound();

  const [{ data: attemptsRaw }, { data: canAccess }] = await Promise.all([
    supabase.from("attempts").select("*").eq("tryout_id", t.id).eq("user_id", user.id).order("attempt_no"),
    supabase.rpc("can_access_tryout", { p_user: user.id, p_tryout: t.id }),
  ]);
  const attempts = (attemptsRaw ?? []) as Attempt[];
  const inProgress = attempts.find((a) => !a.submitted_at && new Date(a.deadline) > new Date());
  const state = tryoutWindowState(t);
  const limitReached = t.attempt_limit != null && attempts.length >= t.attempt_limit;
  const extended = user.profile.formation_type === "disabilitas" && t.extended_duration_minutes;
  const minutes = extended ? t.extended_duration_minutes! : t.duration_minutes;

  return (
    <div className="mx-auto max-w-3xl space-y-6">
      <Link href="/tryout" className="text-sm text-brand-700 hover:underline">
        ← Try-out
      </Link>
      <div>
        <div className="flex flex-wrap gap-2">
          {t.is_free && <Badge tone="green">Gratis</Badge>}
          <Badge tone="brand">{t.kind === "scheduled" ? "Terjadwal" : "Kapan saja"}</Badge>
        </div>
        <h1 className="mt-2 text-2xl font-extrabold">{t.title}</h1>
        {t.description && <p className="mt-2 text-slate-600">{t.description}</p>}
      </div>

      <Card>
        <dl className="grid grid-cols-2 gap-4 text-sm sm:grid-cols-4">
          <div>
            <dt className="text-slate-500">Soal</dt>
            <dd className="text-lg font-bold">{questionCount(t)}</dd>
          </div>
          <div>
            <dt className="text-slate-500">Durasi</dt>
            <dd className="text-lg font-bold">{minutes} menit</dd>
          </div>
          <div>
            <dt className="text-slate-500">TWK / TIU / TKP</dt>
            <dd className="text-lg font-bold">
              {t.blueprint.TWK}/{t.blueprint.TIU}/{t.blueprint.TKP}
            </dd>
          </div>
          <div>
            <dt className="text-slate-500">Percobaan</dt>
            <dd className="text-lg font-bold">
              {attempts.length}/{t.attempt_limit ?? "∞"}
            </dd>
          </div>
        </dl>
        {t.kind === "scheduled" && (
          <p className="mt-4 text-sm text-slate-600">
            Jendela: <b>{dateWIB(t.starts_at, true)}</b> – <b>{dateWIB(t.ends_at, true)}</b>. Pembahasan{" "}
            {t.discussion_after === "window_close" ? "dibuka setelah jendela ditutup" : "langsung tersedia setelah submit"}.
          </p>
        )}
        {extended && <p className="mt-2 text-sm text-emerald-700">Mode waktu tambahan formasi disabilitas aktif ({minutes} menit).</p>}
      </Card>

      <Card>
        <h2 className="font-bold">Aturan</h2>
        <ul className="mt-2 list-disc space-y-1 pl-5 text-sm text-slate-600">
          <li>Timer berjalan di server sejak try-out dimulai dan tidak dapat dijeda. Jawaban tersimpan otomatis.</li>
          <li>Jika koneksi terputus, buka kembali try-out untuk melanjutkan sisa waktu.</li>
          <li>Jawaban dikumpulkan otomatis saat waktu habis.</li>
          <li>TWK & TIU: benar 5, salah/kosong 0. TKP: 1–5 per opsi, kosong 0.</li>
          <li>Perpindahan tab tercatat. Menyalin soal dinonaktifkan.</li>
          <li>Ranking nasional hanya menghitung percobaan pertama.</li>
        </ul>
      </Card>

      {inProgress ? (
        <LinkButton href={`/ujian/${inProgress.id}`} size="lg">
          Lanjutkan try-out
        </LinkButton>
      ) : !canAccess ? (
        <Alert tone="amber">
          Try-out ini memerlukan paket. <Link href="/paket" className="font-semibold underline">Lihat paket</Link>
        </Alert>
      ) : state === "upcoming" ? (
        <Alert tone="brand">Try-out dibuka pada {dateWIB(t.starts_at, true)}.</Alert>
      ) : state === "closed" ? (
        <Alert tone="amber">Jendela try-out ini sudah ditutup.</Alert>
      ) : limitReached ? (
        <Alert tone="amber">Batas percobaan sudah tercapai.</Alert>
      ) : (
        <StartTryoutButton tryoutId={t.id} label={attempts.length ? "Kerjakan lagi" : "Mulai try-out"} />
      )}

      {attempts.some((a) => a.submitted_at) && (
        <Card>
          <div className="flex items-center justify-between">
            <h2 className="font-bold">Hasil Anda</h2>
            <Link href={`/tryout/${t.slug}/ranking`} className="text-sm font-semibold text-brand-700 hover:underline">
              Ranking nasional
            </Link>
          </div>
          <ul className="mt-3 divide-y divide-slate-100">
            {attempts
              .filter((a) => a.submitted_at)
              .map((a) => (
                <li key={a.id} className="flex items-center justify-between py-3 text-sm">
                  <span>
                    Percobaan #{a.attempt_no} · {dateWIB(a.submitted_at, true)}
                  </span>
                  <span className="flex items-center gap-3">
                    <b>{a.total_score}</b>
                    <Badge tone={a.passed ? "green" : "red"}>{a.passed ? "Lolos" : "Belum"}</Badge>
                    <Link href={`/tryout/hasil/${a.id}`} className="font-semibold text-brand-700 hover:underline">
                      Lihat
                    </Link>
                  </span>
                </li>
              ))}
          </ul>
        </Card>
      )}
    </div>
  );
}
