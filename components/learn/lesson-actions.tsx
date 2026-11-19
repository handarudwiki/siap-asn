"use client";

import { useState, useTransition } from "react";
import { Button, Textarea } from "@/components/ui";
import { saveLessonNote, toggleLessonDone } from "@/app/(app)/actions";

export function LessonActions({ lessonId, slug, done, bookmarked, note }: { lessonId: string; slug: string; done: boolean; bookmarked: boolean; note: string }) {
  const [isDone, setDone] = useState(done);
  const [isBookmarked, setBookmarked] = useState(bookmarked);
  const [text, setText] = useState(note);
  const [saved, setSaved] = useState<string | null>(null);
  const [pending, start] = useTransition();

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap gap-2">
        <Button
          variant={isDone ? "secondary" : "primary"}
          disabled={pending}
          onClick={() =>
            start(async () => {
              setDone(!isDone);
              await toggleLessonDone(lessonId, !isDone, slug);
            })
          }
        >
          {isDone ? "✓ Selesai dipelajari" : "Tandai selesai"}
        </Button>
        <Button
          variant="secondary"
          aria-pressed={isBookmarked}
          onClick={() =>
            start(async () => {
              setBookmarked(!isBookmarked);
              await saveLessonNote(lessonId, { bookmarked: !isBookmarked });
            })
          }
        >
          {isBookmarked ? "★ Ditandai" : "☆ Tandai"}
        </Button>
      </div>
      <div>
        <label htmlFor="note" className="text-sm font-semibold">
          Catatan pribadi
        </label>
        <Textarea id="note" rows={4} value={text} onChange={(e) => setText(e.target.value)} placeholder="Rumus penting, poin yang perlu diingat…" className="mt-1" />
        <div className="mt-2 flex items-center gap-3">
          <Button
            size="sm"
            variant="secondary"
            onClick={() =>
              start(async () => {
                await saveLessonNote(lessonId, { note: text });
                setSaved("Catatan tersimpan");
                setTimeout(() => setSaved(null), 2000);
              })
            }
          >
            Simpan catatan
          </Button>
          {saved && <span className="text-xs text-emerald-600">{saved}</span>}
        </div>
      </div>
    </div>
  );
}
