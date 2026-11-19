import Link from "next/link";
import type { Metadata } from "next";
import { Card, PageHeader } from "@/components/ui";
import { ImportForm } from "@/components/admin/import-form";
import { requireStaff } from "@/lib/auth";
import { subtopicOptions } from "@/lib/admin-data";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Impor soal" };

export default async function ImportPage() {
  await requireStaff();
  const supabase = await createClient();
  const { data: subs } = await supabase.from("subtopics").select("id, slug");
  const opts = await subtopicOptions();
  const slugOf = Object.fromEntries((subs ?? []).map((s) => [s.id, s.slug]));
  return (
    <div className="space-y-6">
      <PageHeader title="Impor soal" description="Unggah CSV (Excel → Simpan sebagai CSV UTF-8). Validasi sama dengan editor; baris yang gagal dilaporkan." />
      <div className="grid gap-6 lg:grid-cols-3">
        <Card className="lg:col-span-2">
          <ImportForm />
        </Card>
        <Card className="text-sm">
          <h2 className="font-bold">Format</h2>
          <Link href="/admin/soal/impor/template" prefetch={false} className="mt-2 inline-block font-semibold text-brand-700 hover:underline">⬇ Unduh template CSV</Link>
          <ul className="mt-3 list-disc space-y-1 pl-5 text-slate-600">
            <li><b>TWK/TIU</b>: isi kolom <code>key</code> (A–E).</li>
            <li><b>TKP</b>: isi <code>points_a</code>…<code>points_e</code> dengan 1–5, masing-masing sekali.</li>
            <li><code>image_url</code>: URL gambar yang sudah diunggah.</li>
            <li>Duplikat teks soal otomatis dilewati.</li>
          </ul>
          <h3 className="mt-4 font-semibold">Kode sub-topik</h3>
          <div className="mt-2 max-h-64 overflow-y-auto rounded-lg bg-slate-50 p-2 font-mono text-xs">
            {opts.map((o) => (
              <p key={o.id}>{slugOf[o.id]} <span className="text-slate-400">— {o.label}</span></p>
            ))}
          </div>
          <p className="mt-3 text-xs text-slate-500"><Link href="/admin/taksonomi" className="underline">Kelola taksonomi</Link></p>
        </Card>
      </div>
    </div>
  );
}
