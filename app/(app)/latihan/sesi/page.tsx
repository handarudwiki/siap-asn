import Link from "next/link";
import type { Metadata } from "next";
import { Alert, EmptyState, LinkButton } from "@/components/ui";
import { PracticeSession } from "@/components/learn/practice-session";
import { loadPractice } from "@/app/(app)/actions";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";

export const metadata: Metadata = { title: "Sesi latihan" };

export default async function PracticeSessionPage(props: PageProps<"/latihan/sesi">) {
  await requireUser();
  const sp = await props.searchParams;
  const sub = typeof sp.sub === "string" ? sp.sub : null;
  const tes = typeof sp.tes === "string" ? sp.tes : null;
  const mode = sp.mode === "weak" || sp.mode === "saved" ? sp.mode : "random";
  const timer = typeof sp.timer === "string" ? Number(sp.timer) || null : null;
  const supabase = await createClient();

  let title = "Latihan acak";
  if (sub) {
    const { data } = await supabase.from("subtopics").select("name").eq("id", sub).maybeSingle();
    title = `Latihan: ${data?.name ?? "Sub-topik"}`;
  } else if (mode === "weak") title = "Drill titik lemah";
  else if (mode === "saved") title = "Ulangi soal tersimpan";
  else if (tes) title = `Latihan acak ${tes}`;

  const res = await loadPractice({ subtopicId: sub, mode, limit: 10 });
  let questions = res.questions;
  if (tes && !sub) questions = questions.filter((q) => q.test_code === tes);
  if (tes && !sub && questions.length < 5) {
    const more = await loadPractice({ mode: "random", limit: 50 });
    questions = more.questions.filter((q) => q.test_code === tes).slice(0, 10);
  }

  if (res.error) {
    return (
      <div className="mx-auto max-w-xl space-y-4">
        <Alert>{res.error}</Alert>
        <LinkButton href="/paket">Lihat paket</LinkButton>
      </div>
    );
  }
  if (!questions.length) {
    return (
      <EmptyState
        title="Belum ada soal di sini"
        description="Soal untuk pilihan ini sedang disiapkan tim konten."
        action={<LinkButton href="/latihan" variant="secondary">Kembali</LinkButton>}
      />
    );
  }

  return (
    <div>
      {res.note && <div className="mx-auto mb-4 max-w-3xl"><Alert tone="brand">{res.note}</Alert></div>}
      {!timer && (
        <p className="mx-auto mb-2 max-w-3xl text-right text-xs text-slate-500">
          Ingin pakai timer?{" "}
          <Link className="text-brand-700 underline" href={`/latihan/sesi?${new URLSearchParams({ ...(sub ? { sub } : {}), ...(tes ? { tes } : {}), mode, timer: "10" })}`}>
            10 menit
          </Link>
        </p>
      )}
      <PracticeSession key={questions.map((q) => q.id).join()} questions={questions} title={title} timerMinutes={timer} />
    </div>
  );
}
