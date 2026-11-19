import "server-only";

// Form helpers for admin server actions. Audit logging happens in DB triggers.
export function str(fd: FormData, key: string) {
  const v = fd.get(key);
  return typeof v === "string" ? v.trim() : "";
}
export function num(fd: FormData, key: string, fallback: number | null = null) {
  const v = str(fd, key);
  if (v === "") return fallback;
  const n = Number(v);
  return Number.isFinite(n) ? n : fallback;
}
export function bool(fd: FormData, key: string) {
  return fd.get(key) === "on" || fd.get(key) === "true";
}
