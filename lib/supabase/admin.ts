import "server-only";
import { createClient } from "@supabase/supabase-js";

/**
 * Privileged client (bypasses RLS). Only for trusted server code such as
 * payment webhooks. Never import from a Client Component.
 */
export function createAdminClient() {
  const key = process.env.SUPABASE_SECRET_KEY;
  if (!key) throw new Error("SUPABASE_SECRET_KEY is not set");
  return createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!, key, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
}
