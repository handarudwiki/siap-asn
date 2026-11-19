import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, EmptyState, LinkButton, PageHeader } from "@/components/ui";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { questionCount, tryoutWindowState } from "@/lib/tryout";
import type { Tryout } from "@/lib/types";

export const metadata: Metadata = { title: "Try-out" };

export default async function TryoutListPage() {
  const user = await requireUser();
  const supabase = await createClient();
  await supabase.rpc("finalize_my_expired_attempts");
  const [{ data: tryouts }, { data: attempts }] = await Promise.all([
    supabase.from("tryouts").select("*").eq("status", "published").order("kind", { ascending: false }).order("starts_at", { ascending: true, nullsFirst: false }).order("created_at"),
    supabase.from("attempts").select("tryout_id, total_score, submitted_at, passed, id").eq("user_id", user.id).order("started_at", { ascending: false }),
  ]);
  const list = (tryouts ?? []) as Tryout[];
  const access = Object.fromEntries(
    await Promise.all(list.map(async (t) => [t.id, (await supabase.rpc("can_access_tryout", { p_user: user.id, p_tryout: t.id })).data === true] as const)),
  );

  const scheduled = list.filter((t) => t.kind === "scheduled");
  const onDemand = list.filter((t) => t.kind === "on_demand");

  const Item = ({ t }: { t: Tryout }) => {
    const mine = (attempts ?? []).filter((a) => a.tryout_id === t.id);
    const best = mine.filter((a) => a.submitted_at).sort((a, b) => (b.total_score ?? 0) - (a.total_score ?? 0))[0];
    const state = tryoutWindowState(t);
    const locked = !access[t.id];
    return (
      <Card className="flex flex-col">
        <div className="flex flex-wrap items-center gap-2">
          {t.is_free ? <Badge tone="green">Gratis</Badge> : locked ? <Badge tone="amber">🔒 Premium</Badge> : <Badge tone="brand">Termasuk paket</Badge>}
          {t.kind === "scheduled" && (
            <Badge tone={state === "open" ? "red" : state === "upcoming" ? "purple" : "slate"}>
              {state === "open" ? "● Berlangsung" : state === "upcoming" ? "Akan datang" : "Selesai"}
            </Badge>
          )}
        </div>
        <h3 className="mt-3 font-bold">{t.title}</h3>
        <p className="mt-1 line-clamp-2 text-sm text-slate-600">{t.description}</p>
        <p className="mt-3 text-xs text-slate-500">
          {questionCount(t)} soal · {t.duration_minutes} menit
          {t.kind === "scheduled" && ` · ${dateWIB(t.starts_at, true)} – ${dateWIB(t.ends_at, true)}`}
        </p>
        {best && (
          <p className="mt-2 text-sm">
            Skor terbaik: <b>{best.total_score}</b>{" "}
            <Badge tone={best.passed ? "green" : "red"}>{best.passed ? "Lolos" : "Belum lolos"}</Badge>
          </p>
        )}
        <div className="mt-auto pt-4">
          <LinkButton href={`/tryout/${t.slug}`} variant={locked ? "secondary" : "primary"} className="w-full">
            {locked ? "Lihat detail" : mine.some((a) => !a.submitted_at) ? "Lanjutkan" : mine.length ? "Detail & hasil" : "Kerjakan"}
          </LinkButton>
        </div>
      </Card>
    );
  };

  return (
    <div>
      <PageHeader
        title="Try-out"
        description="Simulasi CAT SKD dengan penilaian dan passing grade sesuai formasi Anda."
        actions={<LinkButton href="/tryout/riwayat" variant="secondary">Riwayat</LinkButton>}
      />
      {scheduled.length > 0 && (
        <section className="mb-8">
          <h2 className="mb-3 font-bold">Try-out nasional terjadwal</h2>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {scheduled.map((t) => <Item key={t.id} t={t} />)}
          </div>
        </section>
      )}
      <section>
        <h2 className="mb-3 font-bold">Try-out kapan saja</h2>
        {onDemand.length ? (
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {onDemand.map((t) => <Item key={t.id} t={t} />)}
          </div>
        ) : (
          <EmptyState title="Belum ada try-out" description="Try-out baru akan segera tersedia." />
        )}
      </section>
      <p className="mt-8 text-xs text-slate-500">
        Ranking hanya menghitung percobaan pertama. <Link href="/paket" className="text-brand-700 underline">Buka semua try-out</Link> dengan paket Try-out Pack atau Premium.
      </p>
    </div>
  );
}
