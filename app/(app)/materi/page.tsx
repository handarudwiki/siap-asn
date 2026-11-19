import Link from "next/link";
import type { Metadata } from "next";
import { Badge, Card, PageHeader, Progress, cn } from "@/components/ui";
import { getEntitlements, requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { TESTS, type Subtopic, type TestCode, type Topic } from "@/lib/types";

export const metadata: Metadata = { title: "Materi" };

type CatalogRow = { id: string; subtopic_id: string; title: string; slug: string; summary: string | null; is_free: boolean; sort_order: number; est_minutes: number; topic_id: string; test_code: TestCode };

export default async function MateriPage(props: PageProps<"/materi">) {
  const user = await requireUser();
  const sp = await props.searchParams;
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const active = (typeof sp.tes === "string" && ["TWK", "TIU", "TKP"].includes(sp.tes) ? sp.tes : "TWK") as TestCode;
  const supabase = await createClient();
  const ent = await getEntitlements(user.id);

  let catalogQuery = supabase.from("lesson_catalog").select("*").order("sort_order");
  if (q) catalogQuery = catalogQuery.or(`title.ilike.%${q.replace(/[%,()]/g, "")}%,summary.ilike.%${q.replace(/[%,()]/g, "")}%`);
  else catalogQuery = catalogQuery.eq("test_code", active);

  const [{ data: topics }, { data: subtopics }, { data: lessons }, { data: progress }, { data: allCatalog }] = await Promise.all([
    supabase.from("topics").select("*").order("sort_order"),
    supabase.from("subtopics").select("*").order("sort_order"),
    catalogQuery,
    supabase.from("lesson_progress").select("lesson_id").eq("user_id", user.id),
    supabase.from("lesson_catalog").select("id, test_code"),
  ]);
  const done = new Set((progress ?? []).map((p) => p.lesson_id));
  const rows = (lessons ?? []) as CatalogRow[];

  const pctFor = (code: TestCode) => {
    const ids = (allCatalog ?? []).filter((c) => c.test_code === code).map((c) => c.id);
    return ids.length ? (ids.filter((id) => done.has(id)).length / ids.length) * 100 : 0;
  };

  const shownTopics = ((topics ?? []) as Topic[]).filter((t) => (q ? rows.some((r) => r.topic_id === t.id) : t.test_code === active));

  return (
    <div>
      <PageHeader title="Materi" description="Belajar terstruktur dari Tes → Topik → Sub-topik." />
      <form className="mb-6">
        <input
          name="q"
          defaultValue={q}
          placeholder="Cari materi, mis. deret, silogisme, pancasila…"
          className="h-11 w-full rounded-xl border border-slate-300 bg-white px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
          aria-label="Cari materi"
        />
      </form>

      {!q && (
        <div className="mb-6 grid grid-cols-3 gap-3">
          {TESTS.map((t) => (
            <Link
              key={t.code}
              href={`/materi?tes=${t.code}`}
              className={cn("rounded-xl border bg-white p-4", active === t.code ? "border-brand-500 ring-2 ring-brand-200" : "border-slate-200 hover:border-slate-300")}
            >
              <p className="font-bold">{t.code}</p>
              <p className="hidden text-xs text-slate-500 sm:block">{t.name}</p>
              <Progress value={pctFor(t.code)} className="mt-3" />
              <p className="mt-1 text-xs text-slate-500">{Math.round(pctFor(t.code))}% selesai</p>
            </Link>
          ))}
        </div>
      )}

      {q && <p className="mb-4 text-sm text-slate-600">{rows.length} hasil untuk “{q}”. <Link href="/materi" className="text-brand-700 underline">Hapus pencarian</Link></p>}

      <div className="space-y-6">
        {shownTopics.map((topic) => {
          const subs = ((subtopics ?? []) as Subtopic[]).filter((s) => s.topic_id === topic.id);
          const topicLessons = rows.filter((r) => r.topic_id === topic.id);
          const pct = topicLessons.length ? (topicLessons.filter((l) => done.has(l.id)).length / topicLessons.length) * 100 : 0;
          return (
            <Card key={topic.id}>
              <div className="flex items-start justify-between gap-4">
                <div>
                  <h2 className="font-bold">{topic.name}</h2>
                  {topic.description && <p className="text-sm text-slate-500">{topic.description}</p>}
                </div>
                <span className="shrink-0 text-xs font-semibold text-slate-500">{Math.round(pct)}%</span>
              </div>
              <div className="mt-4 space-y-4">
                {subs.map((s) => {
                  const ls = topicLessons.filter((l) => l.subtopic_id === s.id);
                  if (!ls.length && q) return null;
                  return (
                    <div key={s.id}>
                      <div className="flex items-center justify-between">
                        <p className="text-sm font-semibold text-slate-700">{s.name}</p>
                        <Link href={`/latihan/sesi?sub=${s.id}`} className="text-xs font-semibold text-brand-700 hover:underline">
                          Latihan soal →
                        </Link>
                      </div>
                      {ls.length ? (
                        <ul className="mt-2 divide-y divide-slate-100 rounded-xl border border-slate-100">
                          {ls.map((l) => {
                            const locked = !l.is_free && !ent.material;
                            return (
                              <li key={l.id}>
                                <Link href={`/materi/${l.slug}`} className="flex items-center gap-3 px-4 py-3 hover:bg-slate-50">
                                  <span
                                    className={cn(
                                      "grid h-6 w-6 shrink-0 place-items-center rounded-full text-xs",
                                      done.has(l.id) ? "bg-emerald-500 text-white" : "border border-slate-300 text-slate-400",
                                    )}
                                    aria-label={done.has(l.id) ? "Selesai" : "Belum selesai"}
                                  >
                                    {done.has(l.id) ? "✓" : ""}
                                  </span>
                                  <span className="min-w-0 flex-1">
                                    <span className="block truncate text-sm font-medium">{l.title}</span>
                                    <span className="text-xs text-slate-500">{l.est_minutes} menit</span>
                                  </span>
                                  {l.is_free ? <Badge tone="green">Gratis</Badge> : locked ? <Badge tone="amber">🔒 Premium</Badge> : null}
                                </Link>
                              </li>
                            );
                          })}
                        </ul>
                      ) : (
                        <p className="mt-1 text-xs text-slate-400">Materi segera hadir.</p>
                      )}
                    </div>
                  );
                })}
              </div>
            </Card>
          );
        })}
      </div>
    </div>
  );
}
