import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Card } from "@/components/ui";
import { LessonEditor } from "@/components/admin/lesson-editor";
import { StatusBadge } from "@/components/admin/status-badge";
import { SubmitButton } from "@/components/admin/submit-button";
import { canPublishRole, isAdminRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { subtopicOptions } from "@/lib/admin-data";
import { dateWIB } from "@/lib/format";
import type { Lesson } from "@/lib/types";
import { deleteLesson, restoreVersion } from "../actions";

export const metadata: Metadata = { title: "Editor materi" };

export default async function LessonEditPage(props: PageProps<"/admin/materi/[id]">) {
  const { id } = await props.params;
  const user = await requireStaff();
  const supabase = await createClient();
  const isNew = id === "baru";
  const { data: lesson } = isNew ? { data: null } : await supabase.from("lessons").select("*").eq("id", id).maybeSingle<Lesson>();
  if (!isNew && !lesson) notFound();
  const [subs, { data: versions }] = await Promise.all([
    subtopicOptions(),
    isNew ? Promise.resolve({ data: [] }) : supabase.from("lesson_versions").select("id, title, created_at, profiles(full_name)").eq("lesson_id", id).order("created_at", { ascending: false }).limit(20),
  ]);

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <Link href="/admin/materi" className="text-sm text-brand-700 hover:underline">← Materi</Link>
          <h1 className="mt-1 flex items-center gap-3 text-2xl font-bold">
            {isNew ? "Materi baru" : lesson!.title} {lesson && <StatusBadge status={lesson.status} />}
          </h1>
        </div>
        {lesson && (
          <Link href={`/materi/${lesson.slug}`} target="_blank" className="text-sm font-semibold text-brand-700 hover:underline">
            Pratinjau sebagai peserta ↗
          </Link>
        )}
      </div>
      <Card>
        <LessonEditor lesson={lesson} subtopics={subs} canPublish={canPublishRole(user.profile.role)} />
      </Card>
      {!isNew && (
        <Card>
          <h2 className="font-bold">Riwayat versi</h2>
          {(versions ?? []).length ? (
            <ul className="mt-3 divide-y divide-slate-100 text-sm">
              {((versions ?? []) as unknown as { id: string; title: string; created_at: string; profiles: { full_name: string } | null }[]).map((v) => (
                <li key={v.id} className="flex items-center justify-between py-2">
                  <span>
                    {dateWIB(v.created_at, true)} · {v.title} <span className="text-slate-400">oleh {v.profiles?.full_name ?? "sistem"}</span>
                  </span>
                  <form action={restoreVersion}>
                    <input type="hidden" name="version_id" value={v.id} />
                    <SubmitButton size="sm" variant="ghost" pendingText="Memulihkan…">Pulihkan</SubmitButton>
                  </form>
                </li>
              ))}
            </ul>
          ) : (
            <p className="mt-2 text-sm text-slate-500">Versi lama tersimpan otomatis setiap kali judul/konten berubah.</p>
          )}
          {isAdminRole(user.profile.role) && (
            <form action={deleteLesson} className="mt-4 border-t border-slate-100 pt-4">
              <input type="hidden" name="id" value={id} />
              <SubmitButton size="sm" variant="danger" pendingText="Menghapus…">Hapus materi permanen</SubmitButton>
            </form>
          )}
        </Card>
      )}
    </div>
  );
}
