import { NextResponse, type NextRequest } from "next/server";
import { createClient } from "@/lib/supabase/server";

/** OAuth / email-link landing: exchanges the code for a session cookie. */
export async function GET(request: NextRequest) {
  const { searchParams, origin } = request.nextUrl;
  const code = searchParams.get("code");
  const nextParam = searchParams.get("next") ?? "/dashboard";
  const next = nextParam.startsWith("/") && !nextParam.startsWith("//") ? nextParam : "/dashboard";

  if (code) {
    const supabase = await createClient();
    const { error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) {
      // OAuth sign-ups can't carry metadata: attach first-touch UTM afterwards
      const utm = request.cookies.get("sa_utm")?.value;
      if (utm) {
        const { data } = await supabase.auth.getClaims();
        const uid = data?.claims?.sub;
        if (uid) {
          try {
            await supabase.from("profiles").update({ acquisition: JSON.parse(utm) }).eq("id", uid).is("acquisition", null);
          } catch {
            /* ignore malformed cookie */
          }
        }
      }
      return NextResponse.redirect(`${origin}${next}`);
    }
  }
  return NextResponse.redirect(`${origin}/masuk?error=auth`);
}
