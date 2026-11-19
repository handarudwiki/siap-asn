import type { Metadata } from "next";
import { Badge, Card, Field, Input, PageHeader, Select, Textarea } from "@/components/ui";
import { SubmitButton } from "@/components/admin/submit-button";
import { Flash } from "@/components/admin/flash";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { dateWIB } from "@/lib/format";
import { deleteAnnouncement, saveAnnouncement } from "./actions";

export const metadata: Metadata = { title: "Pengumuman" };

type A = { id: string; title: string; body: string; segment: "all" | "free" | "premium"; published: boolean; created_at: string };
const SEG = { all: "Semua", free: "Pengguna gratis", premium: "Pengguna premium" };

function Form({ a }: { a?: A }) {
  const k = a?.id ?? "new";
  return (
    <form action={saveAnnouncement} className="space-y-3">
      {a && <input type="hidden" name="id" value={a.id} />}
      <div className="grid gap-3 sm:grid-cols-3">
        <div className="sm:col-span-2">
          <Field label="Judul" htmlFor={`t-${k}`}>
            <Input id={`t-${k}`} name="title" defaultValue={a?.title} required />
          </Field>
        </div>
        <Field label="Segmen" htmlFor={`s-${k}`}>
          <Select id={`s-${k}`} name="segment" defaultValue={a?.segment ?? "all"}>
            {Object.entries(SEG).map(([v, l]) => (
              <option key={v} value={v}>
                {l}
              </option>
            ))}
          </Select>
        </Field>
      </div>
      <Field label="Isi" htmlFor={`b-${k}`}>
        <Textarea id={`b-${k}`} name="body" rows={3} defaultValue={a?.body} required />
      </Field>
      <div className="flex items-center gap-4">
        <label className="flex items-center gap-2 text-sm">
          <input type="checkbox" name="published" defaultChecked={a?.published ?? true} /> Tampilkan
        </label>
        <SubmitButton size="sm">{a ? "Simpan" : "Terbitkan"}</SubmitButton>
      </div>
    </form>
  );
}

export default async function AnnouncementsPage(props: PageProps<"/admin/pengumuman">) {
  await requireStaff("admin");
  const sp = await props.searchParams;
  const supabase = await createClient();
  const { data } = await supabase.from("announcements").select("*").order("created_at", { ascending: false });
  return (
    <div className="space-y-6">
      <PageHeader title="Pengumuman" description="Tampil di dashboard peserta sesuai segmen." />
      <Flash sp={sp} />
      <Card>
        <h2 className="mb-3 font-bold">Pengumuman baru</h2>
        <Form />
      </Card>
      {((data ?? []) as A[]).map((a) => (
        <Card key={a.id}>
          <div className="mb-3 flex flex-wrap items-center gap-2 text-sm">
            <Badge tone={a.published ? "green" : "slate"}>{a.published ? "Tampil" : "Disembunyikan"}</Badge>
            <Badge>{SEG[a.segment]}</Badge>
            <span className="text-xs text-slate-500">{dateWIB(a.created_at, true)}</span>
            <form action={deleteAnnouncement} className="ml-auto">
              <input type="hidden" name="id" value={a.id} />
              <SubmitButton size="sm" variant="ghost" className="text-red-600" pendingText="Menghapus…">
                Hapus
              </SubmitButton>
            </form>
          </div>
          <Form a={a} />
        </Card>
      ))}
    </div>
  );
}
