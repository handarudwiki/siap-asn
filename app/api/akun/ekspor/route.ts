import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

/** PDP data portability: export everything we hold about the caller. */
export async function GET() {
  const supabase = await createClient();
  const { data } = await supabase.auth.getClaims();
  const uid = data?.claims?.sub;
  if (!uid) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const [profile, progress, notes, practice, attempts, transactions, packages] = await Promise.all([
    supabase.from("profiles").select("*").eq("id", uid).single(),
    supabase.from("lesson_progress").select("*").eq("user_id", uid),
    supabase.from("lesson_notes").select("*").eq("user_id", uid),
    supabase.from("practice_answers").select("question_id, option_label, points, is_correct, created_at").eq("user_id", uid),
    supabase.from("attempts").select("id, tryout_id, attempt_no, started_at, submitted_at, twk_score, tiu_score, tkp_score, total_score, passed").eq("user_id", uid),
    supabase.from("transactions").select("order_code, amount, status, created_at, paid_at").eq("user_id", uid),
    supabase.from("user_packages").select("package_id, starts_at, expires_at").eq("user_id", uid),
  ]);

  const body = {
    exported_at: new Date().toISOString(),
    email: data.claims.email,
    profile: profile.data,
    lesson_progress: progress.data,
    lesson_notes: notes.data,
    practice_answers: practice.data,
    tryout_attempts: attempts.data,
    transactions: transactions.data,
    packages: packages.data,
  };
  return new NextResponse(JSON.stringify(body, null, 2), {
    headers: {
      "Content-Type": "application/json",
      "Content-Disposition": `attachment; filename="siapasn-data-${uid.slice(0, 8)}.json"`,
    },
  });
}
