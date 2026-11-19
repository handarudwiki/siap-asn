"use client";

import { useActionState, useState } from "react";
import { Alert, Button, Field, Input, Select, Textarea, cn } from "@/components/ui";
import { Markdown } from "@/components/markdown";
import { saveLesson } from "@/app/admin/materi/actions";
import type { ContentStatus, Lesson } from "@/lib/types";

type SubOpt = { id: string; label: string };

export function LessonEditor({ lesson, subtopics, canPublish }: { lesson: Partial<Lesson> | null; subtopics: SubOpt[]; canPublish: boolean }) {
  const [state, action, pending] = useActionState(saveLesson, undefined);
  const [content, setContent] = useState(lesson?.content ?? "## Judul bagian\n\nTulis materi di sini. Gunakan **tebal**, tabel, dan rumus $a^2 + b^2 = c^2$.");
  const [tab, setTab] = useState<"edit" | "preview">("edit");
  const status = (lesson?.status ?? "draft") as ContentStatus;

  return (
    <form action={action} className="space-y-5">
      {lesson?.id && <input type="hidden" name="id" value={lesson.id} />}
      {state?.error && <Alert>{state.error}</Alert>}
      {state?.ok && <Alert tone="green">{state.ok}</Alert>}
      {lesson?.reviewer_note && status === "draft" && <Alert tone="amber">Catatan reviewer: {lesson.reviewer_note}</Alert>}

      <div className="grid gap-4 md:grid-cols-2">
        <Field label="Judul" htmlFor="title">
          <Input id="title" name="title" defaultValue={lesson?.title ?? ""} required />
        </Field>
        <Field label="Slug (URL)" htmlFor="slug" hint="Kosongkan untuk dibuat otomatis">
          <Input id="slug" name="slug" defaultValue={lesson?.slug ?? ""} />
        </Field>
        <Field label="Sub-topik" htmlFor="subtopic_id">
          <Select id="subtopic_id" name="subtopic_id" defaultValue={lesson?.subtopic_id ?? ""} required>
            <option value="">Pilih…</option>
            {subtopics.map((s) => (
              <option key={s.id} value={s.id}>
                {s.label}
              </option>
            ))}
          </Select>
        </Field>
        <div className="grid grid-cols-2 gap-4">
          <Field label="Urutan" htmlFor="sort_order">
            <Input id="sort_order" name="sort_order" type="number" defaultValue={lesson?.sort_order ?? 0} />
          </Field>
          <Field label="Estimasi (menit)" htmlFor="est_minutes">
            <Input id="est_minutes" name="est_minutes" type="number" defaultValue={lesson?.est_minutes ?? 10} />
          </Field>
        </div>
        <Field label="Ringkasan" htmlFor="summary">
          <Input id="summary" name="summary" defaultValue={lesson?.summary ?? ""} />
        </Field>
        <label className="flex items-center gap-2 self-end pb-2 text-sm">
          <input type="checkbox" name="is_free" defaultChecked={lesson?.is_free ?? false} /> Gratis (tanpa paket)
        </label>
        <Field label="Video (YouTube/Vimeo/URL file)" htmlFor="video_url">
          <Input id="video_url" name="video_url" type="url" defaultValue={lesson?.video_url ?? ""} />
        </Field>
        <Field label="Lampiran PDF (URL)" htmlFor="pdf_url">
          <Input id="pdf_url" name="pdf_url" type="url" defaultValue={lesson?.pdf_url ?? ""} />
        </Field>
      </div>

      <div>
        <div className="mb-2 flex items-center gap-1">
          {(["edit", "preview"] as const).map((t) => (
            <button
              type="button"
              key={t}
              onClick={() => setTab(t)}
              className={cn("rounded-lg px-3 py-1 text-sm font-medium", tab === t ? "bg-slate-900 text-white" : "text-slate-600 hover:bg-slate-100")}
            >
              {t === "edit" ? "Tulis" : "Pratinjau"}
            </button>
          ))}
          <span className="ml-auto text-xs text-slate-500">Markdown · tabel GFM · LaTeX ($…$, $$…$$) · ![gambar](url)</span>
        </div>
        <div className="grid gap-4 lg:grid-cols-2">
          <Textarea name="content" value={content} onChange={(e) => setContent(e.target.value)} rows={22} className={cn("font-mono text-xs", tab === "preview" && "hidden lg:block")} aria-label="Konten materi" />
          <div className={cn("max-h-[560px] overflow-y-auto rounded-lg border border-slate-200 bg-white p-4", tab === "edit" && "hidden lg:block")}>
            <Markdown>{content}</Markdown>
          </div>
        </div>
      </div>

      {canPublish && status === "in_review" && (
        <Field label="Catatan untuk editor (jika ditolak)" htmlFor="reviewer_note">
          <Input id="reviewer_note" name="reviewer_note" />
        </Field>
      )}

      <div className="flex flex-wrap gap-2 border-t border-slate-100 pt-4">
        <Button name="intent" value="save" variant="secondary" disabled={pending}>
          Simpan
        </Button>
        {status === "draft" && (
          <Button name="intent" value="submit" disabled={pending}>
            Ajukan review
          </Button>
        )}
        {canPublish && status !== "published" && (
          <Button name="intent" value="publish" disabled={pending}>
            Terbitkan
          </Button>
        )}
        {canPublish && status === "in_review" && (
          <Button name="intent" value="reject" variant="danger" disabled={pending}>
            Tolak & kembalikan
          </Button>
        )}
        {status === "published" && (
          <Button name="intent" value="draft" variant="secondary" disabled={pending}>
            Tarik ke draft
          </Button>
        )}
        {status !== "archived" && lesson?.id && (
          <Button name="intent" value="archive" variant="ghost" disabled={pending}>
            Arsipkan
          </Button>
        )}
      </div>
    </form>
  );
}
