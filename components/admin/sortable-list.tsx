"use client";

import { useState, useTransition } from "react";
import { cn } from "@/components/ui";
import { deleteNode, renameNode, reorder } from "@/app/admin/taksonomi/actions";

type Node = { id: string; name: string; extra?: string };

/** Drag-and-drop (and keyboard up/down) reorderable list with inline rename (FR-A01). */
export function SortableList({ kind, items, canDelete }: { kind: "topics" | "subtopics"; items: Node[]; canDelete: boolean }) {
  const [list, setList] = useState(items);
  const [dragId, setDragId] = useState<string | null>(null);
  const [editing, setEditing] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [, start] = useTransition();

  const commit = (next: Node[]) => {
    setList(next);
    start(() => reorder(kind, next.map((n) => n.id)));
  };
  const move = (i: number, d: number) => {
    const j = i + d;
    if (j < 0 || j >= list.length) return;
    const next = [...list];
    [next[i], next[j]] = [next[j], next[i]];
    commit(next);
  };

  return (
    <div>
      {error && <p className="mb-2 text-xs text-red-600">{error}</p>}
      <ul className="space-y-1">
        {list.map((n, i) => (
          <li
            key={n.id}
            draggable
            onDragStart={() => setDragId(n.id)}
            onDragOver={(e) => {
              e.preventDefault();
              if (!dragId || dragId === n.id) return;
              const from = list.findIndex((x) => x.id === dragId);
              const next = [...list];
              const [m] = next.splice(from, 1);
              next.splice(i, 0, m);
              setList(next);
            }}
            onDragEnd={() => {
              setDragId(null);
              commit(list);
            }}
            className={cn("flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm", dragId === n.id && "opacity-50")}
          >
            <span className="cursor-grab select-none text-slate-400" aria-hidden>
              ⠿
            </span>
            {editing === n.id ? (
              <form
                className="flex flex-1 gap-2"
                onSubmit={(e) => {
                  e.preventDefault();
                  const name = new FormData(e.currentTarget).get("name") as string;
                  setList((l) => l.map((x) => (x.id === n.id ? { ...x, name } : x)));
                  setEditing(null);
                  start(() => renameNode(kind, n.id, name));
                }}
              >
                <input name="name" defaultValue={n.name} autoFocus className="flex-1 rounded border border-slate-300 px-2 py-0.5" aria-label="Nama" />
                <button className="text-xs font-semibold text-brand-700">Simpan</button>
              </form>
            ) : (
              <span className="flex-1">
                {n.name}
                {n.extra && <span className="ml-2 text-xs text-slate-400">{n.extra}</span>}
              </span>
            )}
            <button className="px-1 text-slate-400 hover:text-slate-700" onClick={() => move(i, -1)} aria-label="Naikkan">
              ↑
            </button>
            <button className="px-1 text-slate-400 hover:text-slate-700" onClick={() => move(i, 1)} aria-label="Turunkan">
              ↓
            </button>
            <button className="text-xs text-brand-700 hover:underline" onClick={() => setEditing(n.id)}>
              Ubah
            </button>
            {canDelete && (
              <button
                className="text-xs text-red-600 hover:underline"
                onClick={() =>
                  start(async () => {
                    const r = await deleteNode(kind, n.id);
                    if (r.error) setError("Tidak bisa dihapus: masih dipakai materi/soal.");
                    else setList((l) => l.filter((x) => x.id !== n.id));
                  })
                }
              >
                Hapus
              </button>
            )}
          </li>
        ))}
      </ul>
    </div>
  );
}
