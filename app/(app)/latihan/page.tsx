import Link from "next/link";
import type { Metadata } from "next";
import { Alert, Badge, Card, LinkButton, PageHeader } from "@/components/ui";
import { getEntitlements, requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { TESTS, type Subtopic, type Topic } from "@/lib/types";

export const metadata: Metadata = { title: "Latihan soal" };

export default async function LatihanPage() {
  const user = await requireUser();
  const supabase = await createClient();
  const [{ data: topics }, { data: subtopics }, { data: answers }, { data: remaining }, { count: savedCount }, ent] = await Promise.all([
    supabase.from("topics").select("*").order("sort_order"),
    supabase.from("subtopics").select("*").order("sort_order"),
    supabase.from("practice_answers").select("question_id, is_correct, points, created_at").eq("user_id", user.id).order("created_at", { ascending: false }).limit(1000),
    supabase.rpc("free_practice_remaining", { p_user: user.id }),
    supabase.from("saved_questions").select("question_id", { count: "exact", head: true }).eq("user_id", user.id),
    getEntitlements(user.id),
  ]);

  const total = answers?.length ?? 0;
  const correct = (answers ?? []).filter((a) => a.is_correct).length;

  return (
    <div>
      <PageHeader title="Latihan soal" description="Latihan per sub-topik dengan pembahasan instan." />
      {!ent.practice && (
        <div className="mb-6">
          <Alert tone="brand">
            Akun gratis: sisa <b>{remaining ?? 0}</b> dari 50 soal latihan.{" "}
            <Link href="/paket" className="font-semibold underline">
              Upgrade untuk latihan tanpa batas
            </Link>
            .
          </Alert>
        </div>
      )}
      <div className="mb-6 grid gap-4 sm:grid-cols-3">
        <Card>
          <p className="text-xs text-slate-500">Soal dikerjakan</p>
          <p className="text-2xl font-extrabold">{total}</p>
          <p className="text-xs text-slate-500">Akurasi {total ? Math.round((correct / total) * 100) : 0}%</p>
        </Card>
        <Card className="flex flex-col justify-between">
          <div>
            <p className="font-semibold">Drill titik lemah</p>
            <p className="text-xs text-slate-500">Set otomatis dari sub-topik dengan akurasi terendah.</p>
          </div>
          <LinkButton href="/latihan/sesi?mode=weak" size="sm" className="mt-3 self-start">
            Mulai drill
          </LinkButton>
        </Card>
        <Card className="flex flex-col justify-between">
          <div>
            <p className="font-semibold">Soal tersimpan</p>
            <p className="text-xs text-slate-500">{savedCount ?? 0} soal yang Anda simpan untuk diulang.</p>
          </div>
          <LinkButton href="/latihan/sesi?mode=saved" size="sm" variant="secondary" className="mt-3 self-start" aria-disabled={!savedCount}>
            Ulangi soal tersimpan
          </LinkButton>
        </Card>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        {TESTS.map((t) => (
          <Card key={t.code}>
            <div className="flex items-center justify-between">
              <h2 className="font-bold">{t.code}</h2>
              <LinkButton href={`/latihan/sesi?tes=${t.code}`} size="sm" variant="ghost">
                Acak {t.code} →
              </LinkButton>
            </div>
            <p className="text-xs text-slate-500">{t.name}</p>
            <div className="mt-4 space-y-4">
              {((topics ?? []) as Topic[])
                .filter((tp) => tp.test_code === t.code)
                .map((tp) => (
                  <div key={tp.id}>
                    <p className="text-xs font-bold uppercase tracking-wide text-slate-400">{tp.name}</p>
                    <ul className="mt-1">
                      {((subtopics ?? []) as Subtopic[])
                        .filter((s) => s.topic_id === tp.id)
                        .map((s) => (
                          <li key={s.id}>
                            <Link href={`/latihan/sesi?sub=${s.id}`} className="flex items-center justify-between rounded-lg px-2 py-1.5 text-sm hover:bg-slate-50">
                              {s.name}
                              <Badge tone="slate">10 soal</Badge>
                            </Link>
                          </li>
                        ))}
                    </ul>
                  </div>
                ))}
            </div>
          </Card>
        ))}
      </div>
    </div>
  );
}
