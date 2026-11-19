"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { parseCsv } from "@/lib/csv";
import type { QuestionOption, TestCode } from "@/lib/types";
import { validateOptions } from "../actions";

export type ImportResult = { inserted: number; errors: { row: number; message: string }[]; duplicates: number } | { fatal: string };

export async function importQuestions(_: ImportResult | undefined, fd: FormData): Promise<ImportResult> {
  const user = await requireStaff();
  const file = fd.get("file");
  if (!(file instanceof File) || file.size === 0) return { fatal: "Pilih file CSV." };
  if (file.size > 5 * 1024 * 1024) return { fatal: "Maksimal 5 MB per impor." };
  const rows = parseCsv(await file.text());
  if (rows.length < 2) return { fatal: "File kosong." };
  const header = rows[0].map((h) => h.trim().toLowerCase());
  const col = (r: string[], k: string) => (r[header.indexOf(k)] ?? "").trim();
  if (!header.includes("stem") || !header.includes("test_code")) return { fatal: "Header tidak sesuai template." };
  const submitForReview = fd.get("review") === "on";

  const supabase = await createClient();
  const { data: subs } = await supabase.from("subtopics").select("id, slug");
  const subBySlug = Object.fromEntries((subs ?? []).map((s) => [s.slug, s.id]));
  const { data: existing } = await supabase.from("questions").select("stem");
  const existingStems = new Set((existing ?? []).map((e) => e.stem.trim().toLowerCase()));

  const errors: { row: number; message: string }[] = [];
  const toInsert: Record<string, unknown>[] = [];
  let duplicates = 0;

  for (let i = 1; i < rows.length; i++) {
    const r = rows[i];
    const n = i + 1;
    const test = col(r, "test_code").toUpperCase() as TestCode;
    if (!["TWK", "TIU", "TKP"].includes(test)) {
      errors.push({ row: n, message: "test_code harus TWK, TIU, atau TKP" });
      continue;
    }
    const stem = col(r, "stem");
    if (!stem) {
      errors.push({ row: n, message: "stem kosong" });
      continue;
    }
    if (existingStems.has(stem.toLowerCase())) {
      duplicates++;
      errors.push({ row: n, message: "duplikat: teks soal sudah ada di bank" });
      continue;
    }
    const key = col(r, "key").toUpperCase();
    const options: QuestionOption[] = (["A", "B", "C", "D", "E"] as const).map((l) => ({
      label: l,
      text: col(r, `option_${l.toLowerCase()}`),
      points: test === "TKP" ? Number(col(r, `points_${l.toLowerCase()}`)) || 0 : key === l ? 5 : 0,
    }));
    const invalid = await validateOptions(test, options);
    if (invalid) {
      errors.push({ row: n, message: invalid });
      continue;
    }
    const slug = col(r, "subtopic_slug");
    if (slug && !subBySlug[slug]) {
      errors.push({ row: n, message: `subtopic_slug "${slug}" tidak ditemukan` });
      continue;
    }
    const diff = col(r, "difficulty") || "medium";
    const usage = col(r, "usage") || "both";
    if (!["easy", "medium", "hard"].includes(diff) || !["practice", "tryout", "both"].includes(usage)) {
      errors.push({ row: n, message: "difficulty/usage tidak valid" });
      continue;
    }
    existingStems.add(stem.toLowerCase());
    toInsert.push({
      test_code: test,
      subtopic_id: slug ? subBySlug[slug] : null,
      stem,
      options,
      explanation: col(r, "explanation"),
      image_url: col(r, "image_url") || null,
      difficulty: diff,
      usage,
      source: col(r, "source") || null,
      year: Number(col(r, "year")) || null,
      status: submitForReview ? "in_review" : "draft",
      created_by: user.id,
    });
  }

  let inserted = 0;
  for (let i = 0; i < toInsert.length; i += 200) {
    const chunk = toInsert.slice(i, i + 200);
    const { error } = await supabase.from("questions").insert(chunk);
    if (error) errors.push({ row: 0, message: `Gagal menyimpan batch ${i / 200 + 1}: ${error.message}` });
    else inserted += chunk.length;
  }
  revalidatePath("/admin/soal");
  return { inserted, errors, duplicates };
}
