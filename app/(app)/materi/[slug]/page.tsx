import Link from "next/link";
import { notFound } from "next/navigation";
import { Badge, Card, LinkButton } from "@/components/ui";
import { Markdown } from "@/components/markdown";
import { LessonActions } from "@/components/learn/lesson-actions";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import type { Lesson } from "@/lib/types";

function embedUrl(url: string) {
  const yt = url.match(/(?:youtube\.com\/watch\?v=|youtu\.be\/)([\w-]{11})/);
  if (yt) return `https://www.youtube-nocookie.com/embed/${yt[1]}`;
  const vimeo = url.match(/vimeo\.com\/(\d+)/);
  if (vimeo) return `https://player.vimeo.com/video/${vimeo[1]}`;
  return null;
}

export default async function LessonPage(props: PageProps<"/materi/[slug]">) {
  const { slug } = await props.params;
  const user = await requireUser();
  const supabase = await createClient();

  const { data: meta } = await supabase.from("lesson_catalog").select("*").eq("slug", slug).maybeSingle();
  const { data: lesson } = await supabase.from("lessons").select("*").eq("slug", slug).maybeSingle<Lesson>();

  // Staff may preview drafts (FR-A04); learners only see published catalog entries.
  if (!meta && !lesson) notFound();

  const { data: sub } = await supabase.from("subtopics").select("id, name, topics(name, test_code)").eq("id", (lesson ?? meta)!.subtopic_id).single();
  const topic = sub?.topics as unknown as { name: string; test_code: string } | null;

  if (!lesson) {
    return (
      <div className="mx-auto max-w-2xl">
        <Link href="/materi" className="text-sm text-brand-700 hover:underline">← Materi</Link>
        <Card className="mt-4 text-center">
          <p className="text-4xl">🔒</p>
          <h1 className="mt-3 text-xl font-bold">{meta!.title}</h1>
          <p className="mt-2 text-sm text-slate-600">{meta!.summary}</p>
          <p className="mt-4 text-sm text-slate-600">Materi ini termasuk dalam paket <b>Belajar + Latihan</b> dan <b>Premium Lengkap</b>.</p>
          <LinkButton href="/paket" className="mt-6">Lihat paket</LinkButton>
        </Card>
      </div>
    );
  }

  const [{ data: prog }, { data: note }, { data: siblings }] = await Promise.all([
    supabase.from("lesson_progress").select("lesson_id").eq("user_id", user.id).eq("lesson_id", lesson.id).maybeSingle(),
    supabase.from("lesson_notes").select("*").eq("user_id", user.id).eq("lesson_id", lesson.id).maybeSingle(),
    supabase.from("lesson_catalog").select("slug, title, sort_order").eq("subtopic_id", lesson.subtopic_id).order("sort_order"),
  ]);
  const idx = (siblings ?? []).findIndex((s) => s.slug === slug);
  const next = idx >= 0 ? siblings?.[idx + 1] : undefined;
  const video = lesson.video_url ? embedUrl(lesson.video_url) : null;

  return (
    <div className="mx-auto max-w-3xl">
      <nav className="text-sm text-slate-500" aria-label="Breadcrumb">
        <Link href={`/materi?tes=${topic?.test_code ?? "TWK"}`} className="text-brand-700 hover:underline">
          {topic?.test_code}
        </Link>{" "}
        / {topic?.name} / {sub?.name}
      </nav>
      <h1 className="mt-2 text-3xl font-extrabold tracking-tight">{lesson.title}</h1>
      <div className="mt-2 flex flex-wrap items-center gap-2 text-sm text-slate-500">
        <span>{lesson.est_minutes} menit</span>
        {lesson.is_free && <Badge tone="green">Gratis</Badge>}
        {lesson.status !== "published" && <Badge tone="amber">Pratinjau: {lesson.status}</Badge>}
      </div>

      <Card className="mt-6">
        {video && (
          <div className="mb-6 aspect-video overflow-hidden rounded-xl bg-slate-900">
            <iframe src={video} title={lesson.title} className="h-full w-full" allow="accelerometer; encrypted-media; picture-in-picture" allowFullScreen />
          </div>
        )}
        {lesson.video_url && !video && (
          <video src={lesson.video_url} controls className="mb-6 w-full rounded-xl" controlsList="nodownload" />
        )}
        <Markdown>{lesson.content}</Markdown>
        {lesson.pdf_url && (
          <a href={lesson.pdf_url} target="_blank" rel="noopener noreferrer" className="mt-6 inline-flex items-center gap-2 rounded-lg border border-slate-200 px-4 py-2 text-sm font-semibold hover:bg-slate-50">
            📄 Unduh ringkasan PDF
          </a>
        )}
      </Card>

      <Card className="mt-6">
        <LessonActions lessonId={lesson.id} slug={slug} done={!!prog} bookmarked={!!note?.bookmarked} note={note?.note ?? ""} />
      </Card>

      <div className="mt-6 flex flex-col gap-3 sm:flex-row sm:justify-between">
        <LinkButton href={`/latihan/sesi?sub=${lesson.subtopic_id}`} variant="secondary">
          Latihan soal {sub?.name}
        </LinkButton>
        {next && <LinkButton href={`/materi/${next.slug}`}>Berikutnya: {next.title} →</LinkButton>}
      </div>
    </div>
  );
}
