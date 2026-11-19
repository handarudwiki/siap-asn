import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

const UTM_KEYS = ["utm_source", "utm_medium", "utm_campaign", "utm_content", "utm_term", "ref"];
const PROTECTED = ["/dashboard", "/materi", "/latihan", "/tryout", "/paket", "/profil", "/onboarding", "/admin"];

/** Refreshes the Supabase session cookie and does an optimistic auth redirect. */
export async function updateSession(request: NextRequest) {
  let response = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet, headers) {
          cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value));
          response = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) => response.cookies.set(name, value, options));
          Object.entries(headers ?? {}).forEach(([k, v]) => response.headers.set(k, v));
        },
      },
    },
  );

  const { data } = await supabase.auth.getClaims();
  const signedIn = Boolean(data?.claims?.sub);
  const path = request.nextUrl.pathname;

  if (!signedIn && PROTECTED.some((p) => path === p || path.startsWith(p + "/"))) {
    const url = request.nextUrl.clone();
    url.pathname = "/masuk";
    url.search = `?next=${encodeURIComponent(path + request.nextUrl.search)}`;
    return NextResponse.redirect(url);
  }
  if (signedIn && (path === "/masuk" || path === "/daftar")) {
    const url = request.nextUrl.clone();
    url.pathname = "/dashboard";
    url.search = "";
    return NextResponse.redirect(url);
  }
  // First-touch marketing attribution (30 days)
  const sp = request.nextUrl.searchParams;
  if (!request.cookies.get("sa_utm") && UTM_KEYS.some((k) => sp.get(k))) {
    const utm = Object.fromEntries(UTM_KEYS.filter((k) => sp.get(k)).map((k) => [k, sp.get(k)!.slice(0, 100)]));
    utm.landing = path;
    response.cookies.set("sa_utm", JSON.stringify(utm), { maxAge: 60 * 60 * 24 * 30, path: "/", sameSite: "lax", httpOnly: true });
  }
  return response;
}
