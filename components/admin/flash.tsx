import { Alert } from "@/components/ui";

/** Shows ?error= / ?ok= messages set by admin server actions via redirect. */
export function Flash({ sp }: { sp: Record<string, string | string[] | undefined> }) {
  const error = typeof sp.error === "string" ? sp.error : null;
  const ok = typeof sp.ok === "string" ? sp.ok : null;
  if (!error && !ok) return null;
  return <div className="mb-4">{error ? <Alert>{error}</Alert> : <Alert tone="green">{ok}</Alert>}</div>;
}
