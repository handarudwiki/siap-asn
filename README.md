# SiapASN – SKD CPNS Preparation Platform

Web platform (responsive + installable PWA) for CPNS and Sekolah Kedinasan candidates to prepare for the SKD exam: structured material, practice with instant explanations, and CAT-style try-outs scored exactly like the real test. Built from `BRD – SKD CPNS Preparation Platform.md`.

**Stack:** Next.js 16 (App Router, Cache Components) · React 19 · Tailwind CSS 4 · Supabase (Postgres, Auth, RLS, RPC) · TypeScript.

## Getting started

```bash
cp .env.example .env.local   # fill in the values below
npm install
npm run dev                  # http://localhost:3000
```

| Variable | Purpose |
| --- | --- |
| `NEXT_PUBLIC_SUPABASE_URL` / `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | Supabase project (Settings → API Keys) |
| `SUPABASE_SECRET_KEY` | Server-only secret key. Required for payment fulfilment (webhook / sandbox simulator) and account deletion |
| `NEXT_PUBLIC_SITE_URL` | Public URL, used for auth redirects, sitemap and Midtrans callbacks |
| `PAYMENT_GATEWAY` | `sandbox` (built-in simulator, default) or `midtrans` |
| `MIDTRANS_SERVER_KEY`, `MIDTRANS_IS_PRODUCTION` | Midtrans Snap credentials |

### Database

Run the SQL files in order in the Supabase SQL editor (or `supabase db push`):

1. `supabase/migrations/20261119000001_init.sql` – schema, RLS, scoring/try-out/payment RPCs
2. `supabase/migrations/20261119000002_acquisition.sql` – UTM attribution
3. `supabase/migrations/20261119000003_admin_helpers.sql` – admin RPCs, duplicate detection
4. `supabase/migrations/20261119000004_admin_get_user.sql`
5. `supabase/seed.sql` – passing-grade profiles, syllabus, starter lessons, sample questions, packages, a free mini try-out
6. `supabase/migrations/20261119000005_content_twk.sql`, `…06_content_tiu.sql`, `…07_content_tkp.sql` – original learning content: 60 lessons and 346 questions with explanations (idempotent)
7. `supabase/migrations/20261119000008_full_tryouts.sql` – two full 110-question / 100-minute try-outs (30/50/20 difficulty mix)
8. `supabase/migrations/20261119000009_content_twk_2.sql`, `…10_content_tiu_2.sql`, `…11_content_tkp_2.sql` – content round 2: 13 new sub-topics (incl. the five missing TKP aspects), 51 more lessons, 513 more questions
9. `supabase/migrations/20261119000012_full_tryouts_2.sql` – try-outs #3–#5

Totals after all migrations: 36 sub-topics, 111 lessons, 859 questions (TWK 247, TIU 366, TKP 246), 6 try-outs.

Make the first super admin (after that account signs up):

```sql
update public.profiles set role = 'super_admin'
where id = (select id from auth.users where email = 'you@example.com');
```

### Supabase Auth settings

- **URL configuration:** set Site URL to `NEXT_PUBLIC_SITE_URL` and add `<site>/auth/callback` to redirect URLs.
- **Google sign-in:** enable the Google provider with an OAuth client ID/secret.
- **Confirm email:** currently **off** in the dev project for testing — turn it back on before launch.

### Payments

- `sandbox`: checkout opens `/paket/bayar/[id]`, where you can simulate a successful or failed QRIS/VA/e-wallet payment.
- `midtrans`: checkout creates a Snap transaction and redirects to Midtrans. Set the HTTP notification URL in Midtrans to `<site>/api/payments/webhook` (signature verified with SHA-512).

## Architecture notes

- **Answer keys never reach the browser before submit.** Learners have no `SELECT` on `questions`; they get questions through `SECURITY DEFINER` RPCs (`get_practice_questions`, `get_attempt`) that strip points. Keys/explanations come from `answer_practice` / `get_attempt_review` only when allowed (BR-07).
- **Server-side timer.** `start_tryout` fixes `deadline` in the DB; `save_answer` rejects writes after it and auto-scores; the client syncs its clock to `server_now`, autosaves every change, caches locally and resyncs after disconnects (FR-L32/L33, BR-04).
- **Scoring** (`score_attempt`): TWK/TIU 5/0, TKP 1–5 (BR-01/02); pass check against the learner's passing-grade profile with `per_test` or `cumulative` rules (BR-03). Thresholds scale proportionally for mini try-outs.
- **Ranking:** first attempt only, ties broken TKP → TIU → TWK (BR-06).
- **Content workflow:** Draft → In review → Published → Archived; DB trigger enforces that only reviewer/admin can publish (BR-11). Questions used in attempted try-outs are locked; editors create a new version (BR-08).
- **Audit log:** DB triggers record every admin write.
- **Entitlements:** package access ends 23:59 WIB on the expiry date (BR-09).

## BRD coverage (MVP "M" items)

Implemented: FR-L01 (email/password, Google; email verification via Supabase), L02, L04 (profile, password reset), L10–L12, L14–L15, L20–L24, L30–L38, L39, L40–L42, FR-A01–A05, A10–A18, A20–A26 (practice sets are rule-based per sub-topic/weak spots), A30–A35, A40–A43, plus the landing page with UTM channel attribution.

Not yet implemented / follow-ups:
- WhatsApp OTP and the 2-concurrent-device limit (FR-L01/L04, BR-10) – needs a session registry or Supabase Auth hooks.
- Notifications (email/WhatsApp/push, FR-L43) and placement test (FR-L03), study-path generator (FR-L13).
- Media uploads to Supabase Storage with signed URLs (lessons/questions currently take URLs).
- PWA offline service worker, load testing for 10k concurrent takers.
- Confirm current KepmenPANRB passing grades and tie-break rule (seeded values follow the 2024 figures cited in the BRD).
