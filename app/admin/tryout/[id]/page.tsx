import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Badge, Card, Field, Input, PageHeader, Select, Textarea, buttonClass } from "@/components/ui";
import { StatusBadge } from "@/components/admin/status-badge";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import type { Package, PassingGradeProfile, TestCode, Tryout } from "@/lib/types";
import { isoToWib } from "@/app/admin/_ops/util";
import { addQuestion, cloneTryout, fillTryout, removeQuestion, setPackages, updateTryout } from "../actions";

export const metadata: Metadata = { title: "Builder try-out" };

type Report = {
  participants: number;
  avg_twk: number | null;
  avg_tiu: number | null;
  avg_tkp: number | null;
  avg_total: number | null;
  pass_rate: number | null;
  tab_switch_flagged: number;
  distribution: { bucket: number; count: number }[];
};
type TQ = { question_id: string; position: number; questions: { id: string; test_code: TestCode; stem: string; difficulty: string; status: string } | null };

const Check = ({ name, label, checked }: { name: string; label: string; checked: boolean }) => (
  <label className="flex items-center gap-2 text-sm">
    <input type="checkbox" name={name} defaultChecked={checked} /> {label}
  </label>
);

export default async function TryoutBuilderPage(props: PageProps<"/admin/tryout/[id]">) {
  await requireStaff("admin");
  const { id } = await props.params;
  const sp = await props.searchParams;
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const qTest = typeof sp.tes === "string" ? sp.tes : "";
  const supabase = await createClient();
  const { data: t } = await supabase.from("tryouts").select("*").eq("id", id).maybeSingle<Tryout>();
  if (!t) notFound();

  const [{ data: tqRaw }, { data: pgs }, { data: pkgs }, { data: assigned }, { count: attemptsCount }, { data: report }] = await Promise.all([
    supabase.from("tryout_questions").select("question_id, position, questions(id, test_code, stem, difficulty, status)").eq("tryout_id", id).order("position"),
    supabase.from("passing_grade_profiles").select("*").order("year", { ascending: false }),
    supabase.from("packages").select("*").order("sort_order"),
    supabase.from("package_tryouts").select("package_id").eq("tryout_id", id),
    supabase.from("attempts").select("id", { count: "exact", head: true }).eq("tryout_id", id),
    supabase.rpc("admin_tryout_report", { p_tryout: id }),
  ]);
  const tq = (tqRaw ?? []) as unknown as TQ[];
  const inTryout = new Set(tq.map((x) => x.question_id));
  const locked = (attemptsCount ?? 0) > 0;

  let results: { id: string; test_code: TestCode; stem: string; difficulty: string }[] = [];
  if (q || qTest) {
    let query = supabase.from("questions").select("id, test_code, stem, difficulty").eq("status", "published").in("usage", ["tryout", "both"]).limit(20);
    if (q) query = query.ilike("stem", `%${q.replace(/[%_]/g, "")}%`);
    if (["TWK", "TIU", "TKP"].includes(qTest)) query = query.eq("test_code", qTest);
    const { data } = await query;
    results = (data ?? []).filter((r) => !inTryout.has(r.id)) as typeof results;
  }

  const rep = report as Report | null;
  const maxBucket = Math.max(1, ...(rep?.distribution ?? []).map((d) => d.count));
  const groups = (["TWK", "TIU", "TKP"] as TestCode[]).map((code) => ({ code, items: tq.filter((x) => x.questions?.test_code === code), target: t.blueprint[code] ?? 0 }));

  return (
    <div className="space-y-6">
      <Link href="/admin/tryout" className="text-sm text-brand-700 hover:underline">
        ← Semua try-out
      </Link>
      <PageHeader
        title={t.title}
        description={
          <span className="flex flex-wrap items-center gap-2">
            <StatusBadge status={t.status} /> {locked && <Badge tone="amber">{attemptsCount} percobaan · susunan soal terkunci</Badge>}
          </span>
        }
        actions={
          <>
            <Link href={`/tryout/${t.slug}`} className={buttonClass("secondary")} target="_blank">
              Pratinjau sebagai peserta
            </Link>
            <form action={cloneTryout}>
              <input type="hidden" name="id" value={t.id} />
              <SubmitButton variant="secondary" pendingText="Mengklon…">
                Klon
              </SubmitButton>
            </form>
          </>
        }
      />
      <Flash sp={sp} />

      <Card>
        <h2 className="mb-4 font-bold">Pengaturan</h2>
        <form action={updateTryout} className="space-y-4">
          <input type="hidden" name="id" value={t.id} />
          <div className="grid gap-4 sm:grid-cols-2">
            <Field label="Judul" htmlFor="title">
              <Input id="title" name="title" defaultValue={t.title} required />
            </Field>
            <Field label="Slug" htmlFor="slug">
              <Input id="slug" name="slug" defaultValue={t.slug} />
            </Field>
          </div>
          <Field label="Deskripsi" htmlFor="description">
            <Textarea id="description" name="description" rows={2} defaultValue={t.description ?? ""} />
          </Field>
          <div className="grid gap-4 sm:grid-cols-4">
            <Field label="Jenis" htmlFor="kind">
              <Select id="kind" name="kind" defaultValue={t.kind}>
                <option value="on_demand">Kapan saja</option>
                <option value="scheduled">Terjadwal</option>
              </Select>
            </Field>
            <Field label="Mulai (WIB)" htmlFor="starts_at">
              <Input id="starts_at" name="starts_at" type="datetime-local" defaultValue={isoToWib(t.starts_at)} />
            </Field>
            <Field label="Selesai (WIB)" htmlFor="ends_at">
              <Input id="ends_at" name="ends_at" type="datetime-local" defaultValue={isoToWib(t.ends_at)} />
            </Field>
            <Field label="Status" htmlFor="status">
              <Select id="status" name="status" defaultValue={t.status === "in_review" ? "draft" : t.status}>
                <option value="draft">Draft</option>
                <option value="published">Terbit</option>
                <option value="archived">Diarsipkan</option>
              </Select>
            </Field>
            <Field label="Durasi (menit)" htmlFor="duration_minutes">
              <Input id="duration_minutes" name="duration_minutes" type="number" min={1} defaultValue={t.duration_minutes} />
            </Field>
            <Field label="Durasi disabilitas (menit)" htmlFor="extended_duration_minutes">
              <Input id="extended_duration_minutes" name="extended_duration_minutes" type="number" min={1} defaultValue={t.extended_duration_minutes ?? ""} />
            </Field>
            <Field label="Batas percobaan" htmlFor="attempt_limit" hint="Kosong = tanpa batas">
              <Input id="attempt_limit" name="attempt_limit" type="number" min={1} defaultValue={t.attempt_limit ?? ""} />
            </Field>
            <Field label="Pembahasan dibuka" htmlFor="discussion_after">
              <Select id="discussion_after" name="discussion_after" defaultValue={t.discussion_after}>
                <option value="submit">Setelah submit</option>
                <option value="window_close">Setelah jendela ditutup</option>
              </Select>
            </Field>
            <Field label="Blueprint TWK" htmlFor="bp_twk">
              <Input id="bp_twk" name="bp_twk" type="number" min={0} defaultValue={t.blueprint.TWK ?? 30} />
            </Field>
            <Field label="Blueprint TIU" htmlFor="bp_tiu">
              <Input id="bp_tiu" name="bp_tiu" type="number" min={0} defaultValue={t.blueprint.TIU ?? 35} />
            </Field>
            <Field label="Blueprint TKP" htmlFor="bp_tkp">
              <Input id="bp_tkp" name="bp_tkp" type="number" min={0} defaultValue={t.blueprint.TKP ?? 45} />
            </Field>
            <Field label="Profil passing grade" htmlFor="passing_grade_profile_id">
              <Select id="passing_grade_profile_id" name="passing_grade_profile_id" defaultValue={t.passing_grade_profile_id ?? ""}>
                <option value="">(Default)</option>
                {((pgs ?? []) as PassingGradeProfile[]).map((p) => (
                  <option key={p.id} value={p.id}>
                    {p.name}
                  </option>
                ))}
              </Select>
            </Field>
          </div>
          <div className="flex flex-wrap gap-x-6 gap-y-2">
            <Check name="is_free" label="Gratis" checked={t.is_free} />
            <Check name="shuffle_questions" label="Acak soal per tes" checked={t.shuffle_questions} />
            <Check name="shuffle_options" label="Acak opsi" checked={t.shuffle_options} />
            <Check name="cap_at_window_end" label="Batasi waktu sampai jendela ditutup" checked={t.cap_at_window_end} />
          </div>
          <SubmitButton>Simpan pengaturan</SubmitButton>
        </form>
      </Card>

      <div className="grid gap-6 lg:grid-cols-2">
        <Card>
          <h2 className="font-bold">Isi otomatis dari bank soal</h2>
          <p className="mt-1 text-sm text-slate-500">Mengambil soal terbit (penggunaan try-out/keduanya) sesuai blueprint dengan campuran tingkat kesulitan.</p>
          <form action={fillTryout} className="mt-4 space-y-3">
            <input type="hidden" name="id" value={t.id} />
            <div className="grid grid-cols-3 gap-3">
              <Field label="Mudah %" htmlFor="easy">
                <Input id="easy" name="easy" type="number" min={0} max={100} defaultValue={30} />
              </Field>
              <Field label="Sedang %" htmlFor="medium">
                <Input id="medium" name="medium" type="number" min={0} max={100} defaultValue={50} />
              </Field>
              <Field label="Sulit %" htmlFor="hard">
                <Input id="hard" name="hard" type="number" min={0} max={100} defaultValue={20} />
              </Field>
            </div>
            <Check name="replace" label="Ganti semua soal yang ada" checked />
            <SubmitButton disabled={locked} pendingText="Mengisi…">
              Isi otomatis
            </SubmitButton>
          </form>
        </Card>

        <Card>
          <h2 className="font-bold">Penugasan paket</h2>
          <form action={setPackages} className="mt-3 space-y-2">
            <input type="hidden" name="id" value={t.id} />
            {((pkgs ?? []) as Package[]).map((p) => (
              <label key={p.id} className="flex items-center gap-2 text-sm">
                <input type="checkbox" name="package_id" value={p.id} defaultChecked={(assigned ?? []).some((a) => a.package_id === p.id)} />
                {p.name}
                {p.includes_all_tryouts && <Badge tone="brand">sudah termasuk semua try-out</Badge>}
              </label>
            ))}
            <SubmitButton variant="secondary" className="mt-2">
              Simpan penugasan
            </SubmitButton>
          </form>
        </Card>
      </div>

      <Card>
        <h2 className="font-bold">Susunan soal</h2>
        <div className="mt-4 grid gap-6 lg:grid-cols-3">
          {groups.map((g) => (
            <div key={g.code}>
              <p className="mb-2 flex items-center justify-between text-sm font-bold">
                {g.code}
                <Badge tone={g.items.length === g.target ? "green" : "amber"}>
                  {g.items.length}/{g.target}
                </Badge>
              </p>
              <ul className="max-h-96 space-y-1 overflow-y-auto pr-1">
                {g.items.map((x, i) => (
                  <li key={x.question_id} className="flex items-start gap-2 rounded-lg bg-slate-50 px-2 py-1.5 text-xs">
                    <span className="w-5 shrink-0 font-semibold text-slate-400">{i + 1}</span>
                    <span className="line-clamp-2 flex-1">{x.questions?.stem}</span>
                    {!locked && (
                      <form action={removeQuestion}>
                        <input type="hidden" name="id" value={t.id} />
                        <input type="hidden" name="question_id" value={x.question_id} />
                        <button className="text-red-600 hover:underline" aria-label="Hapus soal">
                          ✕
                        </button>
                      </form>
                    )}
                  </li>
                ))}
                {!g.items.length && <li className="text-xs text-slate-400">Belum ada soal.</li>}
              </ul>
            </div>
          ))}
        </div>

        <div className="mt-6 border-t border-slate-100 pt-4">
          <p className="text-sm font-semibold">Tambah soal manual</p>
          <form className="mt-2 flex flex-col gap-2 sm:flex-row" method="get">
            <Input name="q" defaultValue={q} placeholder="Cari teks soal…" />
            <Select name="tes" defaultValue={qTest} className="sm:w-32">
              <option value="">Semua tes</option>
              <option value="TWK">TWK</option>
              <option value="TIU">TIU</option>
              <option value="TKP">TKP</option>
            </Select>
            <button className={buttonClass("secondary")}>Cari</button>
          </form>
          {(q || qTest) && (
            <ul className="mt-3 divide-y divide-slate-100 rounded-xl border border-slate-200">
              {results.map((r) => (
                <li key={r.id} className="flex items-center gap-3 px-3 py-2 text-sm">
                  <Badge>{r.test_code}</Badge>
                  <span className="line-clamp-1 flex-1">{r.stem}</span>
                  <span className="text-xs text-slate-400">{r.difficulty}</span>
                  <form action={addQuestion}>
                    <input type="hidden" name="id" value={t.id} />
                    <input type="hidden" name="question_id" value={r.id} />
                    <input type="hidden" name="q" value={q} />
                    <SubmitButton size="sm" variant="secondary" disabled={locked}>
                      Tambah
                    </SubmitButton>
                  </form>
                </li>
              ))}
              {!results.length && <li className="px-3 py-2 text-sm text-slate-500">Tidak ada soal yang cocok.</li>}
            </ul>
          )}
        </div>
      </Card>

      <Card>
        <div className="flex items-center justify-between">
          <h2 className="font-bold">Laporan</h2>
          <a href={`/admin/tryout/${t.id}/export`} className="text-sm font-semibold text-brand-700 hover:underline">
            Ekspor CSV (Excel)
          </a>
        </div>
        {rep && rep.participants > 0 ? (
          <>
            <div className="mt-4 grid gap-3 sm:grid-cols-3 lg:grid-cols-6">
              {[
                ["Peserta", rep.participants],
                ["Rata-rata TWK", rep.avg_twk],
                ["Rata-rata TIU", rep.avg_tiu],
                ["Rata-rata TKP", rep.avg_tkp],
                ["Rata-rata total", rep.avg_total],
                ["Lulus", `${rep.pass_rate ?? 0}%`],
              ].map(([k, v]) => (
                <div key={k as string} className="rounded-xl bg-slate-50 p-3">
                  <p className="text-xs text-slate-500">{k}</p>
                  <p className="text-xl font-extrabold">{v ?? "–"}</p>
                </div>
              ))}
            </div>
            {rep.tab_switch_flagged > 0 && <p className="mt-3 text-sm text-amber-700">{rep.tab_switch_flagged} peserta berpindah tab ≥ 3 kali.</p>}
            <p className="mt-5 text-sm font-semibold">Distribusi skor total</p>
            <div className="mt-2 space-y-1">
              {rep.distribution.map((d) => (
                <div key={d.bucket} className="flex items-center gap-2 text-xs">
                  <span className="w-16 text-right text-slate-500">
                    {d.bucket}–{d.bucket + 49}
                  </span>
                  <span className="h-4 rounded bg-brand-500" style={{ width: `${(d.count / maxBucket) * 70}%` }} />
                  <span>{d.count}</span>
                </div>
              ))}
            </div>
          </>
        ) : (
          <p className="mt-3 text-sm text-slate-500">Belum ada peserta yang menyelesaikan try-out ini.</p>
        )}
      </Card>
    </div>
  );
}
