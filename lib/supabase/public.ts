import "server-only";
import { createClient } from "@supabase/supabase-js";

/** Anonymous, cookie-less client for public data that can be cached ("use cache"). */
export function createPublicClient() {
  return createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!, process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
}
