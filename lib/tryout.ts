import type { Tryout } from "@/lib/types";

export function tryoutWindowState(t: Pick<Tryout, "kind" | "starts_at" | "ends_at">, now = Date.now()) {
  if (t.kind === "on_demand") return "open" as const;
  const s = new Date(t.starts_at!).getTime();
  const e = new Date(t.ends_at!).getTime();
  if (now < s) return "upcoming" as const;
  if (now > e) return "closed" as const;
  return "open" as const;
}

export function questionCount(t: Pick<Tryout, "blueprint">) {
  return (t.blueprint.TWK ?? 0) + (t.blueprint.TIU ?? 0) + (t.blueprint.TKP ?? 0);
}
