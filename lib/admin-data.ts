import "server-only";
import { createClient } from "@/lib/supabase/server";

/** Sub-topic options labelled "TES · Topik › Sub-topik". */
export async function subtopicOptions() {
  const supabase = await createClient();
  const { data } = await supabase.from("subtopics").select("id, name, sort_order, topics(name, test_code, sort_order)");
  const rows = (data ?? []) as unknown as { id: string; name: string; sort_order: number; topics: { name: string; test_code: string; sort_order: number } }[];
  const order = { TWK: 1, TIU: 2, TKP: 3 } as Record<string, number>;
  return rows
    .sort((a, b) => order[a.topics.test_code] - order[b.topics.test_code] || a.topics.sort_order - b.topics.sort_order || a.sort_order - b.sort_order)
    .map((r) => ({ id: r.id, test_code: r.topics.test_code, label: `${r.topics.test_code} · ${r.topics.name} › ${r.name}` }));
}
