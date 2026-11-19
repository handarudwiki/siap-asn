import type { Metadata } from "next";
import { Card, Input, PageHeader } from "@/components/ui";
import { SortableList } from "@/components/admin/sortable-list";
import { SubmitButton } from "@/components/admin/submit-button";
import { isAdminRole, requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { TESTS, type Subtopic, type Topic } from "@/lib/types";
import { createSubtopic, createTopic } from "./actions";

export const metadata: Metadata = { title: "Taksonomi" };

export default async function TaxonomyPage() {
  const user = await requireStaff();
  const supabase = await createClient();
  const [{ data: topics }, { data: subtopics }] = await Promise.all([
    supabase.from("topics").select("*").order("sort_order"),
    supabase.from("subtopics").select("*").order("sort_order"),
  ]);
  const canDelete = isAdminRole(user.profile.role);
  return (
    <div>
      <PageHeader title="Taksonomi" description="Tes → Topik → Sub-topik. Seret untuk mengurutkan." />
      <div className="grid gap-6 xl:grid-cols-3">
        {TESTS.map((t) => {
          const tps = ((topics ?? []) as Topic[]).filter((x) => x.test_code === t.code);
          return (
            <Card key={t.code} className="space-y-4">
              <div>
                <h2 className="font-bold">{t.code}</h2>
                <p className="text-xs text-slate-500">{t.name}</p>
              </div>
              <div>
                <p className="mb-2 text-xs font-bold uppercase text-slate-400">Urutan topik</p>
                <SortableList key={tps.map((x) => x.id + x.name).join()} kind="topics" items={tps.map((x) => ({ id: x.id, name: x.name }))} canDelete={canDelete} />
              </div>
              {tps.map((tp) => {
                const subs = ((subtopics ?? []) as Subtopic[]).filter((s) => s.topic_id === tp.id);
                return (
                  <div key={tp.id} className="rounded-xl bg-slate-50 p-3">
                    <p className="mb-2 text-sm font-semibold">{tp.name}</p>
                    <SortableList key={subs.map((x) => x.id + x.name).join()} kind="subtopics" items={subs.map((s) => ({ id: s.id, name: s.name }))} canDelete={canDelete} />
                    <form action={createSubtopic} className="mt-2 flex gap-2">
                      <input type="hidden" name="topic_id" value={tp.id} />
                      <Input name="name" placeholder="Sub-topik baru" className="h-8" aria-label="Nama sub-topik baru" />
                      <SubmitButton size="sm" variant="secondary">Tambah</SubmitButton>
                    </form>
                  </div>
                );
              })}
              <form action={createTopic} className="flex gap-2 border-t border-slate-100 pt-4">
                <input type="hidden" name="test_code" value={t.code} />
                <Input name="name" placeholder={`Topik ${t.code} baru`} aria-label="Nama topik baru" />
                <SubmitButton size="md">Tambah topik</SubmitButton>
              </form>
            </Card>
          );
        })}
      </div>
    </div>
  );
}
