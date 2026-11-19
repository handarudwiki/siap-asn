import "server-only";
import { redirect } from "next/navigation";

/** Redirect back to an admin page with a flash message. */
export function back(path: string, msg: { error?: string; ok?: string }): never {
  const qs = new URLSearchParams(msg.error ? { error: msg.error } : { ok: msg.ok ?? "Tersimpan" });
  redirect(`${path}${path.includes("?") ? "&" : "?"}${qs}`);
}

/** datetime-local value (interpreted as WIB) → ISO string. */
export function wibToIso(v: string) {
  if (!v) return null;
  const d = new Date(`${v.length === 16 ? v + ":00" : v}+07:00`);
  return Number.isNaN(d.getTime()) ? null : d.toISOString();
}

/** ISO → datetime-local value in WIB. */
export function isoToWib(iso: string | null | undefined) {
  if (!iso) return "";
  return new Date(iso).toLocaleString("sv-SE", { timeZone: "Asia/Jakarta" }).replace(" ", "T").slice(0, 16);
}

/** date input (YYYY-MM-DD) as start of day WIB → ISO */
export function dateToIso(v: string, endOfDay = false) {
  if (!v) return null;
  return new Date(`${v}T${endOfDay ? "23:59:59" : "00:00:00"}+07:00`).toISOString();
}
