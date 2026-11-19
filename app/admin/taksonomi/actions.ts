"use server";

import { revalidatePath } from "next/cache";
import { requireStaff } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { str } from "@/lib/admin";
import { slugify } from "@/lib/format";

export async function createTopic(fd: FormData) {
  await requireStaff();
  const name = str(fd, "name");
  const test = str(fd, "test_code");
  if (!name) return;
  const supabase = await createClient();
  await supabase.from("topics").insert({ name, test_code: test, slug: `${test.toLowerCase()}-${slugify(name)}`, description: str(fd, "description") || null, sort_order: 999 });
  revalidatePath("/admin/taksonomi");
}

export async function createSubtopic(fd: FormData) {
  await requireStaff();
  const name = str(fd, "name");
  if (!name) return;
  const supabase = await createClient();
  const topicId = str(fd, "topic_id");
  const { data: topic } = await supabase.from("topics").select("slug").eq("id", topicId).single();
  await supabase.from("subtopics").insert({ topic_id: topicId, name, slug: `${topic?.slug ?? "st"}-${slugify(name)}`, sort_order: 999 });
  revalidatePath("/admin/taksonomi");
}

export async function renameNode(kind: "topics" | "subtopics", id: string, name: string) {
  await requireStaff();
  if (!name.trim()) return;
  const supabase = await createClient();
  await supabase.from(kind).update({ name: name.trim() }).eq("id", id);
  revalidatePath("/admin/taksonomi");
}

export async function reorder(kind: "topics" | "subtopics", ids: string[]) {
  await requireStaff();
  const supabase = await createClient();
  await Promise.all(ids.map((id, i) => supabase.from(kind).update({ sort_order: i + 1 }).eq("id", id)));
  revalidatePath("/admin/taksonomi");
}

export async function deleteNode(kind: "topics" | "subtopics", id: string) {
  await requireStaff("admin");
  const supabase = await createClient();
  const { error } = await supabase.from(kind).delete().eq("id", id);
  revalidatePath("/admin/taksonomi");
  return error ? { error: error.message } : { ok: true };
}
