import { NextResponse, type NextRequest } from "next/server";
import { createClient } from "@/lib/supabase/server";

const esc = (v: unknown) => {
  const s = v == null ? "" : String(v);
  return /[",\n;]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
};

/** FR-A41: first-attempt results as CSV (opens in Excel). Admin only. */
export async function GET(_req: NextRequest, ctx: RouteContext<"/admin/tryout/[id]/export">) {
  const { id } = await ctx.params;
  const supabase = await createClient();
  const { data: isAdmin } = await supabase.rpc("is_admin");
  if (!isAdmin) return NextResponse.json({ error: "Forbidden" }, { status: 403 });

  const [{ data: t }, { data: rows }] = await Promise.all([
    supabase.from("tryouts").select("slug").eq("id", id).maybeSingle(),
    supabase
      .from("attempts")
      .select("user_id, formation_type, started_at, submitted_at, twk_score, tiu_score, tkp_score, total_score, passed, tab_switches, profiles(full_name)")
      .eq("tryout_id", id)
      .eq("attempt_no", 1)
      .not("submitted_at", "is", null)
      .order("total_score", { ascending: false })
      .order("tkp_score", { ascending: false })
      .order("tiu_score", { ascending: false })
      .order("twk_score", { ascending: false }),
  ]);
  if (!t) return NextResponse.json({ error: "Not found" }, { status: 404 });

  type Row = { user_id: string; formation_type: string | null; started_at: string; submitted_at: string; twk_score: number; tiu_score: number; tkp_score: number; total_score: number; passed: boolean | null; tab_switches: number; profiles: { full_name: string | null } | null };
  const header = ["rank", "nama", "user_id", "formasi", "mulai", "selesai", "twk", "tiu", "tkp", "total", "lulus", "pindah_tab"];
  const lines = ((rows ?? []) as unknown as Row[]).map((r, i) =>
    [i + 1, r.profiles?.full_name, r.user_id, r.formation_type, r.started_at, r.submitted_at, r.twk_score, r.tiu_score, r.tkp_score, r.total_score, r.passed ? "ya" : "tidak", r.tab_switches]
      .map(esc)
      .join(","),
  );
  const csv = "﻿" + [header.join(","), ...lines].join("\n");
  return new NextResponse(csv, {
    headers: { "Content-Type": "text/csv; charset=utf-8", "Content-Disposition": `attachment; filename="hasil-${t.slug}.csv"` },
  });
}
