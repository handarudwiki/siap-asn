import { toCsv } from "@/lib/csv";

const IMPORT_COLUMNS = [
  "test_code", "subtopic_slug", "difficulty", "usage", "stem",
  "option_a", "option_b", "option_c", "option_d", "option_e",
  "key", "points_a", "points_b", "points_c", "points_d", "points_e",
  "explanation", "image_url", "source", "year",
];

export function GET() {
  const csv = toCsv([
    IMPORT_COLUMNS,
    ["TIU", "tiu-deret-angka", "easy", "both", "Tentukan bilangan berikutnya: 5, 10, 20, 40, …", "60", "70", "80", "90", "100", "C", "", "", "", "", "", "Rasio 2: 40 × 2 = 80.", "", "Tim konten", 2026],
    ["TKP", "tkp-pelayanan", "medium", "both", "Seorang warga marah karena antrean panjang. Sikap Anda …", "Mengabaikan", "Meminta ia bersabar tanpa penjelasan", "Menjelaskan kondisi dan membantu sesuai prosedur", "Memanggil satpam", "Menyuruhnya kembali besok", "", 1, 3, 5, 2, 4, "Empati + solusi sesuai prosedur bernilai tertinggi.", "", "Tim konten", 2026],
  ]);
  return new Response("﻿" + csv, {
    headers: { "Content-Type": "text/csv; charset=utf-8", "Content-Disposition": 'attachment; filename="template-impor-soal.csv"' },
  });
}
