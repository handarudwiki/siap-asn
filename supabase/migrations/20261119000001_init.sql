-- SiapASN – SKD CPNS preparation platform
-- Initial schema: taxonomy, material CMS, question bank, try-out engine,
-- packages/payments, RBAC and audit log.

create extension if not exists pgcrypto;

-- ---------------------------------------------------------------------------
-- Enums
-- ---------------------------------------------------------------------------
create type public.user_role as enum ('learner', 'editor', 'reviewer', 'admin', 'super_admin');
create type public.test_code as enum ('TWK', 'TIU', 'TKP');
create type public.content_status as enum ('draft', 'in_review', 'published', 'archived');
create type public.difficulty as enum ('easy', 'medium', 'hard');
create type public.question_usage as enum ('practice', 'tryout', 'both');
create type public.tryout_kind as enum ('scheduled', 'on_demand');
create type public.tx_status as enum ('pending', 'paid', 'failed', 'expired', 'refunded');
create type public.pg_rule as enum ('per_test', 'cumulative');

-- ---------------------------------------------------------------------------
-- Passing-grade profiles (FR-A34, BR-03) – never hard-coded
-- ---------------------------------------------------------------------------
create table public.passing_grade_profiles (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  year int not null,
  formation_type text not null,           -- umum, cumlaude, diaspora, disabilitas, papua, kalimantan, ...
  rule_type public.pg_rule not null default 'per_test',
  twk_min int,
  tiu_min int,
  tkp_min int,
  total_min int,
  is_default boolean not null default false,
  notes text,
  created_at timestamptz not null default now(),
  unique (year, formation_type)
);

-- ---------------------------------------------------------------------------
-- Profiles
-- ---------------------------------------------------------------------------
create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  full_name text,
  phone text,
  role public.user_role not null default 'learner',
  target text check (target in ('cpns', 'kedinasan')),
  formation_type text not null default 'umum',
  passing_grade_profile_id uuid references public.passing_grade_profiles (id) on delete set null,
  exam_date date,
  daily_study_minutes int,
  onboarded boolean not null default false,
  suspended boolean not null default false,
  font_scale numeric not null default 1,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Role helpers
-- ---------------------------------------------------------------------------
create or replace function public.app_role()
returns public.user_role language sql stable security definer set search_path = public as $$
  select role from public.profiles where id = auth.uid()
$$;

create or replace function public.is_staff()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce(public.app_role() in ('editor', 'reviewer', 'admin', 'super_admin'), false)
$$;

create or replace function public.can_publish()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce(public.app_role() in ('reviewer', 'admin', 'super_admin'), false)
$$;

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce(public.app_role() in ('admin', 'super_admin'), false)
$$;

create or replace function public.is_super_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce(public.app_role() = 'super_admin', false)
$$;

-- New auth user -> profile row
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name'));
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Learners may edit their own profile but never their role / suspension.
create or replace function public.guard_profile_update()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if (new.role is distinct from old.role) and not public.is_super_admin() then
    raise exception 'Only super admin can change roles';
  end if;
  if (new.suspended is distinct from old.suspended) and not public.is_admin() then
    raise exception 'Only admin can suspend accounts';
  end if;
  new.updated_at := now();
  return new;
end;
$$;

create trigger profiles_guard
  before update on public.profiles
  for each row execute function public.guard_profile_update();

-- ---------------------------------------------------------------------------
-- Taxonomy: Test -> Topic -> Sub-topic (FR-A01)
-- ---------------------------------------------------------------------------
create table public.topics (
  id uuid primary key default gen_random_uuid(),
  test_code public.test_code not null,
  name text not null,
  slug text not null unique,
  description text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create table public.subtopics (
  id uuid primary key default gen_random_uuid(),
  topic_id uuid not null references public.topics (id) on delete cascade,
  name text not null,
  slug text not null unique,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Lessons (FR-A02..A05)
-- ---------------------------------------------------------------------------
create table public.lessons (
  id uuid primary key default gen_random_uuid(),
  subtopic_id uuid not null references public.subtopics (id) on delete cascade,
  title text not null,
  slug text not null unique,
  summary text,
  content text not null default '',       -- Markdown + GFM tables + LaTeX ($...$)
  video_url text,
  pdf_url text,
  is_free boolean not null default false,
  sort_order int not null default 0,
  est_minutes int not null default 10,
  status public.content_status not null default 'draft',
  reviewer_note text,
  created_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.lesson_versions (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  title text not null,
  content text not null,
  saved_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now()
);

create table public.lesson_progress (
  user_id uuid not null references public.profiles (id) on delete cascade,
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  completed_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

create table public.lesson_notes (
  user_id uuid not null references public.profiles (id) on delete cascade,
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  bookmarked boolean not null default false,
  note text,
  updated_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

-- ---------------------------------------------------------------------------
-- Question bank (FR-A10..A18)
-- options: [{"label":"A","text":"...","points":5}, ... 5 items]
--   TWK/TIU: exactly one option has 5 points, the rest 0.
--   TKP: points 1..5, each value used once.
-- ---------------------------------------------------------------------------
create table public.questions (
  id uuid primary key default gen_random_uuid(),
  test_code public.test_code not null,
  subtopic_id uuid references public.subtopics (id) on delete set null,
  stem text not null,
  image_url text,
  options jsonb not null,
  explanation text not null default '',
  difficulty public.difficulty not null default 'medium',
  usage public.question_usage not null default 'both',
  source text,
  year int,
  status public.content_status not null default 'draft',
  reviewer_note text,
  version int not null default 1,
  parent_id uuid references public.questions (id) on delete set null,
  created_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index questions_subtopic_idx on public.questions (subtopic_id);
create index questions_test_status_idx on public.questions (test_code, status);
create index questions_stem_md5_idx on public.questions (md5(lower(stem)));

-- FR-A12 validation
create or replace function public.validate_question()
returns trigger language plpgsql as $$
declare
  n int;
  labels text[];
  pts int[];
begin
  if jsonb_typeof(new.options) <> 'array' then
    raise exception 'options must be an array';
  end if;
  n := jsonb_array_length(new.options);
  if n <> 5 then
    raise exception 'A question must have exactly 5 options (A–E)';
  end if;
  select array_agg(o ->> 'label' order by o ->> 'label'),
         array_agg(coalesce((o ->> 'points')::int, 0) order by (o ->> 'points')::int)
    into labels, pts
    from jsonb_array_elements(new.options) o;
  if labels <> array['A','B','C','D','E'] then
    raise exception 'Option labels must be A, B, C, D, E';
  end if;
  if exists (select 1 from jsonb_array_elements(new.options) o where coalesce(trim(o ->> 'text'), '') = '') then
    raise exception 'Options cannot be empty';
  end if;
  if new.test_code = 'TKP' then
    if pts <> array[1,2,3,4,5] then
      raise exception 'TKP options must use points 1–5, each exactly once';
    end if;
  else
    if pts <> array[0,0,0,0,5] then
      raise exception 'TWK/TIU questions need exactly one correct option (5 points)';
    end if;
  end if;
  return new;
end;
$$;

create trigger questions_validate
  before insert or update of options, test_code on public.questions
  for each row execute function public.validate_question();

-- ---------------------------------------------------------------------------
-- Try-outs (FR-A21..A26)
-- ---------------------------------------------------------------------------
create table public.tryouts (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text not null unique,
  description text,
  kind public.tryout_kind not null default 'on_demand',
  starts_at timestamptz,
  ends_at timestamptz,
  cap_at_window_end boolean not null default false,
  duration_minutes int not null default 100,
  extended_duration_minutes int default 130,
  attempt_limit int default 1,
  blueprint jsonb not null default '{"TWK":30,"TIU":35,"TKP":45}',
  shuffle_questions boolean not null default true,
  shuffle_options boolean not null default false,
  discussion_after text not null default 'submit' check (discussion_after in ('submit', 'window_close')),
  is_free boolean not null default false,
  passing_grade_profile_id uuid references public.passing_grade_profiles (id) on delete set null,
  status public.content_status not null default 'draft',
  created_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (kind = 'on_demand' or (starts_at is not null and ends_at is not null and ends_at > starts_at))
);

create table public.tryout_questions (
  tryout_id uuid not null references public.tryouts (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete restrict,
  position int not null default 0,
  primary key (tryout_id, question_id)
);

create table public.attempts (
  id uuid primary key default gen_random_uuid(),
  tryout_id uuid not null references public.tryouts (id) on delete cascade,
  user_id uuid not null references public.profiles (id) on delete cascade,
  attempt_no int not null,
  started_at timestamptz not null default now(),
  deadline timestamptz not null,
  submitted_at timestamptz,
  auto_submitted boolean not null default false,
  question_order uuid[] not null,
  twk_score int,
  tiu_score int,
  tkp_score int,
  total_score int,
  passed boolean,
  passing_grade_profile_id uuid references public.passing_grade_profiles (id) on delete set null,
  formation_type text,
  thresholds jsonb,
  tab_switches int not null default 0,
  unique (tryout_id, user_id, attempt_no)
);

create index attempts_user_idx on public.attempts (user_id);
create index attempts_ranking_idx on public.attempts (tryout_id, attempt_no) where submitted_at is not null;

create table public.attempt_answers (
  attempt_id uuid not null references public.attempts (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete cascade,
  option_label text check (option_label in ('A','B','C','D','E')),
  flagged boolean not null default false,
  points int,
  time_spent_ms int not null default 0,
  updated_at timestamptz not null default now(),
  primary key (attempt_id, question_id)
);

-- ---------------------------------------------------------------------------
-- Practice (FR-L20..L24)
-- ---------------------------------------------------------------------------
create table public.practice_answers (
  id bigint generated always as identity primary key,
  user_id uuid not null references public.profiles (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete cascade,
  option_label text not null,
  points int not null,
  is_correct boolean not null,
  created_at timestamptz not null default now()
);
create index practice_answers_user_idx on public.practice_answers (user_id, question_id);

create table public.saved_questions (
  user_id uuid not null references public.profiles (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, question_id)
);

create table public.question_reports (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.questions (id) on delete cascade,
  user_id uuid references public.profiles (id) on delete set null,
  message text not null,
  status text not null default 'open' check (status in ('open', 'resolved', 'rejected')),
  resolution text,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Packages, vouchers, transactions (FR-A31..A33, FR-L41..L42)
-- ---------------------------------------------------------------------------
create table public.packages (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text not null unique,
  description text,
  price int not null check (price >= 0),
  duration_days int,
  until_date date,
  includes_material boolean not null default false,
  includes_practice boolean not null default false,
  includes_all_tryouts boolean not null default false,
  features text[] not null default '{}',
  highlight boolean not null default false,
  is_active boolean not null default true,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  check (duration_days is not null or until_date is not null)
);

create table public.package_tryouts (
  package_id uuid not null references public.packages (id) on delete cascade,
  tryout_id uuid not null references public.tryouts (id) on delete cascade,
  primary key (package_id, tryout_id)
);

create table public.vouchers (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  discount_type text not null check (discount_type in ('percent', 'fixed')),
  discount_value int not null check (discount_value > 0),
  quota int,
  used_count int not null default 0,
  valid_from timestamptz,
  valid_until timestamptz,
  package_id uuid references public.packages (id) on delete cascade,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

create table public.transactions (
  id uuid primary key default gen_random_uuid(),
  order_code text not null unique default ('SA-' || to_char(now(), 'YYMMDD') || '-' || upper(substr(md5(gen_random_uuid()::text), 1, 8))),
  user_id uuid not null references public.profiles (id) on delete cascade,
  package_id uuid not null references public.packages (id) on delete restrict,
  voucher_id uuid references public.vouchers (id) on delete set null,
  base_amount int not null,
  discount_amount int not null default 0,
  amount int not null,
  status public.tx_status not null default 'pending',
  gateway text not null default 'sandbox',
  gateway_ref text,
  payment_url text,
  payment_method text,
  paid_at timestamptz,
  raw_notification jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index transactions_user_idx on public.transactions (user_id);

create table public.user_packages (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles (id) on delete cascade,
  package_id uuid not null references public.packages (id) on delete restrict,
  transaction_id uuid references public.transactions (id) on delete set null,
  starts_at timestamptz not null default now(),
  expires_at timestamptz not null,
  granted_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now()
);
create index user_packages_user_idx on public.user_packages (user_id, expires_at);

-- ---------------------------------------------------------------------------
-- Announcements & audit log
-- ---------------------------------------------------------------------------
create table public.announcements (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  body text not null,
  segment text not null default 'all' check (segment in ('all', 'free', 'premium')),
  published boolean not null default true,
  created_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now()
);

create table public.audit_logs (
  id bigint generated always as identity primary key,
  actor_id uuid,
  action text not null,
  entity text not null,
  entity_id text,
  details jsonb,
  created_at timestamptz not null default now()
);
create index audit_logs_created_idx on public.audit_logs (created_at desc);

create or replace function public.audit_trigger()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  rec jsonb;
begin
  if auth.uid() is null then
    -- system / service role / webhook writes
    null;
  end if;
  rec := case when tg_op = 'DELETE' then to_jsonb(old) else to_jsonb(new) end;
  insert into public.audit_logs (actor_id, action, entity, entity_id, details)
  values (
    auth.uid(),
    lower(tg_op),
    tg_table_name,
    rec ->> 'id',
    case when tg_op = 'UPDATE' then jsonb_build_object('status', rec ->> 'status') else null end
  );
  return null;
end;
$$;

do $$
declare t text;
begin
  foreach t in array array['topics','subtopics','lessons','questions','tryouts','packages','vouchers',
                           'passing_grade_profiles','user_packages','announcements']
  loop
    execute format('create trigger %I_audit after insert or update or delete on public.%I
                    for each row execute function public.audit_trigger()', t, t);
  end loop;
end $$;

create trigger profiles_audit after update of role, suspended on public.profiles
  for each row execute function public.audit_trigger();
create trigger transactions_audit after update of status on public.transactions
  for each row execute function public.audit_trigger();

-- ---------------------------------------------------------------------------
-- Workflow guards (BR-08, BR-11)
-- ---------------------------------------------------------------------------
create or replace function public.guard_publish()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if new.status = 'published'
     and (tg_op = 'INSERT' or old.status is distinct from 'published')
     and auth.uid() is not null
     and not public.can_publish() then
    raise exception 'Only reviewer or admin can publish';
  end if;
  new.updated_at := now();
  return new;
end;
$$;

create trigger lessons_guard_publish before insert or update on public.lessons
  for each row execute function public.guard_publish();
create trigger questions_guard_publish before insert or update on public.questions
  for each row execute function public.guard_publish();

create or replace function public.guard_question_lock()
returns trigger language plpgsql as $$
begin
  if (new.stem, new.options, new.explanation, new.test_code, new.image_url)
     is distinct from (old.stem, old.options, old.explanation, old.test_code, old.image_url)
     and exists (
       select 1 from public.tryout_questions tq
       join public.attempts a on a.tryout_id = tq.tryout_id
       where tq.question_id = old.id
     ) then
    raise exception 'Question is used in a try-out that already has attempts. Create a new version instead.';
  end if;
  return new;
end;
$$;

create trigger questions_lock before update on public.questions
  for each row execute function public.guard_question_lock();

-- Lesson version history (FR-A05)
create or replace function public.snapshot_lesson()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if tg_op = 'UPDATE' and (new.content is distinct from old.content or new.title is distinct from old.title) then
    insert into public.lesson_versions (lesson_id, title, content, saved_by)
    values (old.id, old.title, old.content, auth.uid());
  end if;
  return new;
end;
$$;

create trigger lessons_snapshot after update on public.lessons
  for each row execute function public.snapshot_lesson();

-- ---------------------------------------------------------------------------
-- Entitlements
-- ---------------------------------------------------------------------------
create or replace function public.has_access(p_user uuid, p_feature text)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1
    from public.user_packages up
    join public.packages p on p.id = up.package_id
    where up.user_id = p_user
      and up.starts_at <= now()
      and up.expires_at > now()
      and case p_feature
            when 'material' then p.includes_material
            when 'practice' then p.includes_practice
            when 'tryout' then p.includes_all_tryouts
            else false
          end
  )
$$;

create or replace function public.can_access_tryout(p_user uuid, p_tryout uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.tryouts t where t.id = p_tryout and t.is_free)
      or public.has_access(p_user, 'tryout')
      or exists (
        select 1 from public.package_tryouts pt
        join public.user_packages up on up.package_id = pt.package_id
        where pt.tryout_id = p_tryout and up.user_id = p_user
          and up.starts_at <= now() and up.expires_at > now()
      )
$$;

create or replace function public.is_premium(p_user uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.user_packages where user_id = p_user and starts_at <= now() and expires_at > now())
$$;

-- BR-09: package access ends at 23:59 WIB on the expiry date
create or replace function public.package_expiry(p_package uuid, p_from timestamptz default now())
returns timestamptz language sql stable set search_path = public as $$
  select (
    case
      when p.until_date is not null and p.duration_days is not null
        then least(p.until_date, ((p_from at time zone 'Asia/Jakarta')::date + p.duration_days))
      when p.until_date is not null then p.until_date
      else ((p_from at time zone 'Asia/Jakarta')::date + p.duration_days)
    end + time '23:59:59'
  ) at time zone 'Asia/Jakarta'
  from public.packages p where p.id = p_package
$$;

-- ---------------------------------------------------------------------------
-- Public catalog of lessons (titles visible even when locked)
-- ---------------------------------------------------------------------------
create view public.lesson_catalog as
  select l.id, l.subtopic_id, l.title, l.slug, l.summary, l.is_free, l.sort_order, l.est_minutes,
         s.topic_id, t.test_code
  from public.lessons l
  join public.subtopics s on s.id = l.subtopic_id
  join public.topics t on t.id = s.topic_id
  where l.status = 'published';

-- ---------------------------------------------------------------------------
-- Practice RPCs (questions never leave the server with their keys)
-- ---------------------------------------------------------------------------
create or replace function public.strip_options(p_options jsonb)
returns jsonb language sql immutable as $$
  select coalesce(jsonb_agg(jsonb_build_object('label', o ->> 'label', 'text', o ->> 'text') order by o ->> 'label'), '[]'::jsonb)
  from jsonb_array_elements(p_options) o
$$;

create or replace function public.free_practice_remaining(p_user uuid)
returns int language sql stable security definer set search_path = public as $$
  select greatest(0, 50 - (select count(distinct question_id) from public.practice_answers where user_id = p_user))::int
$$;

create or replace function public.get_practice_questions(p_subtopic uuid, p_limit int default 10, p_mode text default 'random')
returns table (id uuid, test_code public.test_code, stem text, image_url text, options jsonb, difficulty public.difficulty)
language plpgsql security definer set search_path = public as $$
declare
  uid uuid := auth.uid();
  premium boolean;
  remaining int;
begin
  if uid is null then raise exception 'AUTH_REQUIRED'; end if;
  premium := public.has_access(uid, 'practice');
  remaining := public.free_practice_remaining(uid);
  if not premium and remaining <= 0 then
    raise exception 'FREE_LIMIT_REACHED';
  end if;

  return query
    select q.id, q.test_code, q.stem, q.image_url, public.strip_options(q.options), q.difficulty
    from public.questions q
    where q.status = 'published'
      and q.usage in ('practice', 'both')
      and (p_subtopic is null or q.subtopic_id = p_subtopic)
      and (p_mode <> 'saved' or exists (select 1 from public.saved_questions sq where sq.user_id = uid and sq.question_id = q.id))
    order by random()
    limit case when premium then least(p_limit, 50) else least(p_limit, remaining) end;
end;
$$;

-- FR-L23: weak-spot drill
create or replace function public.get_weak_subtopics(p_limit int default 5)
returns table (subtopic_id uuid, subtopic_name text, test_code public.test_code, answered bigint, accuracy numeric)
language sql stable security definer set search_path = public as $$
  with src as (
    select q.subtopic_id, q.test_code,
           case when q.test_code = 'TKP' then a.points / 5.0 else (a.points > 0)::int end as score
    from public.attempt_answers a
    join public.attempts at on at.id = a.attempt_id and at.user_id = auth.uid() and at.submitted_at is not null
    join public.questions q on q.id = a.question_id
    union all
    select q.subtopic_id, q.test_code,
           case when q.test_code = 'TKP' then p.points / 5.0 else p.is_correct::int end
    from public.practice_answers p
    join public.questions q on q.id = p.question_id
    where p.user_id = auth.uid()
  )
  select s.id, s.name, src.test_code, count(*), round(avg(coalesce(src.score, 0)) * 100, 1)
  from src join public.subtopics s on s.id = src.subtopic_id
  group by s.id, s.name, src.test_code
  having count(*) >= 3
  order by avg(coalesce(src.score, 0)) asc
  limit p_limit
$$;

create or replace function public.answer_practice(p_question uuid, p_label text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  uid uuid := auth.uid();
  q public.questions;
  pts int;
  best text;
  correct boolean;
begin
  if uid is null then raise exception 'AUTH_REQUIRED'; end if;
  select * into q from public.questions where id = p_question and status = 'published' and usage in ('practice', 'both');
  if not found then raise exception 'QUESTION_NOT_FOUND'; end if;
  if not public.has_access(uid, 'practice')
     and public.free_practice_remaining(uid) <= 0
     and not exists (select 1 from public.practice_answers where user_id = uid and question_id = p_question) then
    raise exception 'FREE_LIMIT_REACHED';
  end if;

  select coalesce((o ->> 'points')::int, 0) into pts from jsonb_array_elements(q.options) o where o ->> 'label' = p_label;
  if pts is null then raise exception 'INVALID_OPTION'; end if;
  select o ->> 'label' into best from jsonb_array_elements(q.options) o order by (o ->> 'points')::int desc limit 1;
  correct := pts = 5;

  insert into public.practice_answers (user_id, question_id, option_label, points, is_correct)
  values (uid, p_question, p_label, pts, correct);

  return jsonb_build_object(
    'points', pts,
    'is_correct', correct,
    'best_label', best,
    'options', q.options,
    'explanation', q.explanation,
    'test_code', q.test_code
  );
end;
$$;

-- ---------------------------------------------------------------------------
-- Try-out engine RPCs (FR-L30..L39, BR-01..BR-07)
-- ---------------------------------------------------------------------------
create or replace function public.resolve_passing_profile(p_user uuid, p_tryout uuid)
returns uuid language sql stable security definer set search_path = public as $$
  select coalesce(
    (select passing_grade_profile_id from public.profiles where id = p_user),
    (select passing_grade_profile_id from public.tryouts where id = p_tryout),
    (select id from public.passing_grade_profiles where is_default order by year desc limit 1)
  )
$$;

create or replace function public.score_attempt(p_attempt uuid, p_auto boolean default false)
returns public.attempts language plpgsql security definer set search_path = public as $$
declare
  a public.attempts;
  pg public.passing_grade_profiles;
  s_twk int; s_tiu int; s_tkp int; s_total int;
  n_twk int; n_tiu int; n_tkp int;
  thr jsonb;
  ok boolean;
begin
  select * into a from public.attempts where id = p_attempt for update;
  if a.submitted_at is not null then return a; end if;

  -- points per answer (BR-01, BR-02)
  update public.attempt_answers aa
     set points = coalesce((
       select (o ->> 'points')::int from public.questions q, jsonb_array_elements(q.options) o
       where q.id = aa.question_id and o ->> 'label' = aa.option_label), 0)
   where aa.attempt_id = p_attempt;

  select coalesce(sum(aa.points) filter (where q.test_code = 'TWK'), 0),
         coalesce(sum(aa.points) filter (where q.test_code = 'TIU'), 0),
         coalesce(sum(aa.points) filter (where q.test_code = 'TKP'), 0)
    into s_twk, s_tiu, s_tkp
    from public.attempt_answers aa join public.questions q on q.id = aa.question_id
   where aa.attempt_id = p_attempt;
  s_total := s_twk + s_tiu + s_tkp;

  -- question counts per test; thresholds scale proportionally for mini try-outs
  select count(*) filter (where q.test_code = 'TWK'),
         count(*) filter (where q.test_code = 'TIU'),
         count(*) filter (where q.test_code = 'TKP')
    into n_twk, n_tiu, n_tkp
    from unnest(a.question_order) qid join public.questions q on q.id = qid;

  select * into pg from public.passing_grade_profiles where id = a.passing_grade_profile_id;
  if found then
    thr := jsonb_build_object(
      'profile', pg.name, 'rule', pg.rule_type,
      'twk', case when pg.rule_type = 'per_test' then ceil(coalesce(pg.twk_min, 0) * n_twk / 30.0) end,
      'tiu', ceil(coalesce(pg.tiu_min, 0) * n_tiu / 35.0),
      'tkp', case when pg.rule_type = 'per_test' then ceil(coalesce(pg.tkp_min, 0) * n_tkp / 45.0) end,
      'total', case when pg.rule_type = 'cumulative' then ceil(coalesce(pg.total_min, 0) * (n_twk + n_tiu + n_tkp) * 5 / 550.0) end,
      'max_twk', n_twk * 5, 'max_tiu', n_tiu * 5, 'max_tkp', n_tkp * 5);
  end if;
  if not found then
    ok := null;
  elsif pg.rule_type = 'per_test' then
    ok := s_twk >= ceil(coalesce(pg.twk_min, 0) * n_twk / 30.0)
      and s_tiu >= ceil(coalesce(pg.tiu_min, 0) * n_tiu / 35.0)
      and s_tkp >= ceil(coalesce(pg.tkp_min, 0) * n_tkp / 45.0);
  else
    ok := s_total >= ceil(coalesce(pg.total_min, 0) * (n_twk * 5 + n_tiu * 5 + n_tkp * 5) / 550.0)
      and s_tiu >= ceil(coalesce(pg.tiu_min, 0) * n_tiu / 35.0);
  end if;

  update public.attempts
     set submitted_at = case when p_auto then least(now(), deadline) else now() end,
         auto_submitted = p_auto,
         twk_score = s_twk, tiu_score = s_tiu, tkp_score = s_tkp, total_score = s_total,
         passed = ok,
         thresholds = thr
   where id = p_attempt
  returning * into a;
  return a;
end;
$$;
revoke execute on function public.score_attempt(uuid, boolean) from public, anon, authenticated;

-- Auto-submit any of the caller's attempts whose time ran out (BR-04, FR-L33)
create or replace function public.finalize_my_expired_attempts()
returns int language plpgsql security definer set search_path = public as $$
declare r record; n int := 0;
begin
  for r in select id from public.attempts where user_id = auth.uid() and submitted_at is null and deadline < now() loop
    perform public.score_attempt(r.id, true);
    n := n + 1;
  end loop;
  return n;
end;
$$;

create or replace function public.start_tryout(p_tryout uuid)
returns uuid language plpgsql security definer set search_path = public as $$
declare
  uid uuid := auth.uid();
  t public.tryouts;
  prof public.profiles;
  existing public.attempts;
  n_attempts int;
  dur int;
  dl timestamptz;
  qorder uuid[];
  new_id uuid := gen_random_uuid();
begin
  if uid is null then raise exception 'AUTH_REQUIRED'; end if;
  select * into prof from public.profiles where id = uid;
  if prof.suspended then raise exception 'ACCOUNT_SUSPENDED'; end if;

  select * into t from public.tryouts where id = p_tryout and status = 'published';
  if not found then raise exception 'TRYOUT_NOT_FOUND'; end if;

  perform public.finalize_my_expired_attempts();

  -- resume an in-progress attempt (FR-L32)
  select * into existing from public.attempts
   where tryout_id = p_tryout and user_id = uid and submitted_at is null and deadline > now()
   order by attempt_no desc limit 1;
  if found then return existing.id; end if;

  if not public.can_access_tryout(uid, p_tryout) then raise exception 'PACKAGE_REQUIRED'; end if;

  if t.kind = 'scheduled' and (now() < t.starts_at or now() > t.ends_at) then
    raise exception 'OUTSIDE_WINDOW';
  end if;

  select count(*) into n_attempts from public.attempts where tryout_id = p_tryout and user_id = uid;
  if t.attempt_limit is not null and n_attempts >= t.attempt_limit then
    raise exception 'ATTEMPT_LIMIT_REACHED';
  end if;

  -- FR-L39 extended time for disability formation
  dur := case when prof.formation_type = 'disabilitas' and t.extended_duration_minutes is not null
              then t.extended_duration_minutes else t.duration_minutes end;
  dl := now() + make_interval(mins => dur);
  if t.kind = 'scheduled' and t.cap_at_window_end then
    dl := least(dl, t.ends_at);
  end if;

  select array_agg(tq.question_id order by
           case q.test_code when 'TWK' then 1 when 'TIU' then 2 else 3 end,
           case when t.shuffle_questions then md5(new_id::text || tq.question_id::text) else lpad(tq.position::text, 6, '0') end)
    into qorder
    from public.tryout_questions tq join public.questions q on q.id = tq.question_id
   where tq.tryout_id = p_tryout;

  if qorder is null then raise exception 'TRYOUT_EMPTY'; end if;

  insert into public.attempts (id, tryout_id, user_id, attempt_no, deadline, question_order,
                               passing_grade_profile_id, formation_type)
  values (new_id, p_tryout, uid, n_attempts + 1, dl, qorder,
          public.resolve_passing_profile(uid, p_tryout), prof.formation_type);

  insert into public.attempt_answers (attempt_id, question_id)
  select new_id, unnest(qorder);

  return new_id;
end;
$$;

-- Exam payload: questions WITHOUT keys (NFR security)
create or replace function public.get_attempt(p_attempt uuid)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  a public.attempts;
  t public.tryouts;
begin
  select * into a from public.attempts where id = p_attempt and user_id = auth.uid();
  if not found then raise exception 'ATTEMPT_NOT_FOUND'; end if;
  if a.submitted_at is null and a.deadline < now() then
    a := public.score_attempt(a.id, true);
  end if;
  select * into t from public.tryouts where id = a.tryout_id;

  return jsonb_build_object(
    'attempt', jsonb_build_object(
      'id', a.id, 'tryout_id', a.tryout_id, 'title', t.title,
      'started_at', a.started_at, 'deadline', a.deadline, 'submitted_at', a.submitted_at,
      'server_now', now()),
    'questions', (
      select jsonb_agg(jsonb_build_object(
               'id', q.id, 'n', o.n, 'test_code', q.test_code, 'stem', q.stem, 'image_url', q.image_url,
               'options', case when t.shuffle_options then (
                   select jsonb_agg(x order by md5(a.id::text || q.id::text || (x ->> 'label')))
                   from jsonb_array_elements(public.strip_options(q.options)) x)
                 else public.strip_options(q.options) end,
               'answer', aa.option_label, 'flagged', coalesce(aa.flagged, false)) order by o.n)
      from unnest(a.question_order) with ordinality as o(qid, n)
      join public.questions q on q.id = o.qid
      left join public.attempt_answers aa on aa.attempt_id = a.id and aa.question_id = q.id
    )
  );
end;
$$;

create or replace function public.save_answer(p_attempt uuid, p_question uuid, p_label text, p_flagged boolean, p_time_ms int default 0)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  a public.attempts;
begin
  select * into a from public.attempts where id = p_attempt and user_id = auth.uid();
  if not found then raise exception 'ATTEMPT_NOT_FOUND'; end if;
  if a.submitted_at is not null then raise exception 'ALREADY_SUBMITTED'; end if;
  -- small grace for network latency, never beyond
  if now() > a.deadline + interval '3 seconds' then
    perform public.score_attempt(a.id, true);
    raise exception 'TIME_UP';
  end if;
  if p_label is not null and p_label not in ('A','B','C','D','E') then raise exception 'INVALID_OPTION'; end if;

  update public.attempt_answers
     set option_label = p_label,
         flagged = coalesce(p_flagged, false),
         time_spent_ms = time_spent_ms + greatest(0, least(coalesce(p_time_ms, 0), 3600000)),
         updated_at = now()
   where attempt_id = p_attempt and question_id = p_question;
  if not found then raise exception 'QUESTION_NOT_IN_ATTEMPT'; end if;

  return jsonb_build_object('ok', true, 'server_now', now());
end;
$$;

create or replace function public.submit_attempt(p_attempt uuid)
returns jsonb language plpgsql security definer set search_path = public as $$
declare a public.attempts;
begin
  select * into a from public.attempts where id = p_attempt and user_id = auth.uid();
  if not found then raise exception 'ATTEMPT_NOT_FOUND'; end if;
  a := public.score_attempt(a.id, now() > a.deadline);
  return to_jsonb(a);
end;
$$;

create or replace function public.log_tab_switch(p_attempt uuid)
returns void language sql security definer set search_path = public as $$
  update public.attempts set tab_switches = tab_switches + 1
   where id = p_attempt and user_id = auth.uid() and submitted_at is null
$$;

-- Discussion (FR-L35, BR-07): keys + explanation only after submit
-- (scheduled try-outs with discussion_after = window_close: after the window closes).
create or replace function public.get_attempt_review(p_attempt uuid)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  a public.attempts;
  t public.tryouts;
  visible boolean;
begin
  select * into a from public.attempts where id = p_attempt and (user_id = auth.uid() or public.is_staff());
  if not found then raise exception 'ATTEMPT_NOT_FOUND'; end if;
  if a.submitted_at is null then raise exception 'NOT_SUBMITTED'; end if;
  select * into t from public.tryouts where id = a.tryout_id;
  visible := not (t.kind = 'scheduled' and t.discussion_after = 'window_close' and now() < t.ends_at);

  return jsonb_build_object(
    'discussion_visible', visible,
    'discussion_opens_at', case when visible then null else t.ends_at end,
    'items', (
      select jsonb_agg(jsonb_build_object(
               'id', q.id, 'n', o.n, 'test_code', q.test_code, 'stem', q.stem, 'image_url', q.image_url,
               'subtopic', s.name,
               'options', case when visible then q.options else public.strip_options(q.options) end,
               'explanation', case when visible then q.explanation else null end,
               'answer', aa.option_label, 'points', aa.points, 'time_spent_ms', aa.time_spent_ms) order by o.n)
      from unnest(a.question_order) with ordinality as o(qid, n)
      join public.questions q on q.id = o.qid
      left join public.subtopics s on s.id = q.subtopic_id
      left join public.attempt_answers aa on aa.attempt_id = a.id and aa.question_id = q.id
    )
  );
end;
$$;

-- Ranking (FR-L36, BR-06): first attempt only; ties TKP > TIU > TWK
create or replace function public.get_tryout_ranking(p_tryout uuid, p_formation text default null, p_limit int default 100)
returns table (rank bigint, user_id uuid, full_name text, formation_type text,
               twk int, tiu int, tkp int, total int, passed boolean)
language sql stable security definer set search_path = public as $$
  select rank() over (order by a.total_score desc, a.tkp_score desc, a.tiu_score desc, a.twk_score desc),
         a.user_id,
         coalesce(nullif(split_part(p.full_name, ' ', 1), ''), 'Peserta'),
         a.formation_type, a.twk_score, a.tiu_score, a.tkp_score, a.total_score, a.passed
  from public.attempts a join public.profiles p on p.id = a.user_id
  where a.tryout_id = p_tryout and a.attempt_no = 1 and a.submitted_at is not null
    and (p_formation is null or a.formation_type = p_formation)
  order by 1
  limit p_limit
$$;

create or replace function public.get_my_rank(p_attempt uuid)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare
  a public.attempts;
  r bigint; total bigint; r_form bigint; total_form bigint;
begin
  select * into a from public.attempts where id = p_attempt and user_id = auth.uid();
  if not found or a.submitted_at is null then return null; end if;
  with first as (
    select id, total_score, tkp_score, tiu_score, twk_score, formation_type
    from public.attempts where tryout_id = a.tryout_id and attempt_no = 1 and submitted_at is not null
  )
  select count(*) filter (where (total_score, tkp_score, tiu_score, twk_score) > (a.total_score, a.tkp_score, a.tiu_score, a.twk_score)) + 1,
         count(*),
         count(*) filter (where formation_type = a.formation_type and (total_score, tkp_score, tiu_score, twk_score) > (a.total_score, a.tkp_score, a.tiu_score, a.twk_score)) + 1,
         count(*) filter (where formation_type = a.formation_type)
    into r, total, r_form, total_form
    from first;
  return jsonb_build_object(
    'rank', r, 'participants', total,
    'rank_formation', r_form, 'participants_formation', total_form,
    'percentile', case when total > 0 then round(100.0 * (total - r) / total, 1) else null end,
    'counts_for_ranking', a.attempt_no = 1
  );
end;
$$;

-- Per-sub-topic analysis of an attempt vs. all participants (FR-L37)
create or replace function public.get_attempt_analysis(p_attempt uuid)
returns table (subtopic text, test_code public.test_code, questions bigint, my_accuracy numeric, avg_accuracy numeric, avg_time_s numeric)
language sql stable security definer set search_path = public as $$
  with me as (select * from public.attempts where id = p_attempt and user_id = auth.uid() and submitted_at is not null),
  mine as (
    select q.subtopic_id, q.test_code,
           avg(case when q.test_code = 'TKP' then coalesce(aa.points,0)/5.0 else (coalesce(aa.points,0) > 0)::int end) acc,
           count(*) n, avg(aa.time_spent_ms) / 1000.0 t
    from me join public.attempt_answers aa on aa.attempt_id = me.id
    join public.questions q on q.id = aa.question_id
    group by q.subtopic_id, q.test_code
  ),
  everyone as (
    select q.subtopic_id,
           avg(case when q.test_code = 'TKP' then coalesce(aa.points,0)/5.0 else (coalesce(aa.points,0) > 0)::int end) acc
    from me join public.attempts a on a.tryout_id = me.tryout_id and a.submitted_at is not null and a.attempt_no = 1
    join public.attempt_answers aa on aa.attempt_id = a.id
    join public.questions q on q.id = aa.question_id
    group by q.subtopic_id
  )
  select coalesce(s.name, 'Lainnya'), mine.test_code, mine.n,
         round(mine.acc * 100, 1), round(coalesce(everyone.acc, mine.acc) * 100, 1), round(mine.t, 1)
  from mine
  left join everyone on everyone.subtopic_id is not distinct from mine.subtopic_id
  left join public.subtopics s on s.id = mine.subtopic_id
  order by mine.test_code, mine.acc
$$;

-- ---------------------------------------------------------------------------
-- Orders & payments
-- ---------------------------------------------------------------------------
create or replace function public.quote_price(p_package uuid, p_voucher text)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare
  p public.packages;
  v public.vouchers;
  disc int := 0;
begin
  select * into p from public.packages where id = p_package and is_active;
  if not found then raise exception 'PACKAGE_NOT_FOUND'; end if;
  if coalesce(trim(p_voucher), '') <> '' then
    select * into v from public.vouchers
     where upper(code) = upper(trim(p_voucher)) and is_active
       and (valid_from is null or valid_from <= now())
       and (valid_until is null or valid_until >= now())
       and (quota is null or used_count < quota)
       and (package_id is null or package_id = p_package);
    if not found then raise exception 'VOUCHER_INVALID'; end if;
    disc := case when v.discount_type = 'percent' then (p.price * least(v.discount_value, 100)) / 100 else least(v.discount_value, p.price) end;
  end if;
  return jsonb_build_object('package_id', p.id, 'base', p.price, 'discount', disc, 'amount', p.price - disc, 'voucher_id', v.id);
end;
$$;

create or replace function public.create_order(p_package uuid, p_voucher text default null)
returns public.transactions language plpgsql security definer set search_path = public as $$
declare
  q jsonb;
  tx public.transactions;
begin
  if auth.uid() is null then raise exception 'AUTH_REQUIRED'; end if;
  q := public.quote_price(p_package, p_voucher);
  insert into public.transactions (user_id, package_id, voucher_id, base_amount, discount_amount, amount)
  values (auth.uid(), p_package, nullif(q ->> 'voucher_id', '')::uuid, (q ->> 'base')::int, (q ->> 'discount')::int, (q ->> 'amount')::int)
  returning * into tx;
  return tx;
end;
$$;

-- Called by the payment webhook (service role only) or by admin (manual grant)
create or replace function public.fulfill_transaction(p_tx uuid, p_method text default null, p_raw jsonb default null)
returns public.transactions language plpgsql security definer set search_path = public as $$
declare
  tx public.transactions;
  last_exp timestamptz;
begin
  if auth.uid() is not null and not public.is_admin() then raise exception 'FORBIDDEN'; end if;
  select * into tx from public.transactions where id = p_tx for update;
  if not found then raise exception 'TX_NOT_FOUND'; end if;
  if tx.status = 'paid' then return tx; end if;

  update public.transactions
     set status = 'paid', paid_at = now(), payment_method = coalesce(p_method, payment_method),
         raw_notification = coalesce(p_raw, raw_notification), updated_at = now()
   where id = p_tx returning * into tx;

  if tx.voucher_id is not null then
    update public.vouchers set used_count = used_count + 1 where id = tx.voucher_id;
  end if;

  -- stack on top of an active instance of the same package
  select max(expires_at) into last_exp from public.user_packages
   where user_id = tx.user_id and package_id = tx.package_id and expires_at > now();

  insert into public.user_packages (user_id, package_id, transaction_id, starts_at, expires_at, granted_by)
  values (tx.user_id, tx.package_id, tx.id, now(),
          public.package_expiry(tx.package_id, coalesce(last_exp, now())), auth.uid());
  return tx;
end;
$$;
revoke execute on function public.fulfill_transaction(uuid, text, jsonb) from public, anon;

create or replace function public.admin_grant_package(p_user uuid, p_package uuid)
returns public.user_packages language plpgsql security definer set search_path = public as $$
declare up public.user_packages;
begin
  if not public.is_admin() then raise exception 'FORBIDDEN'; end if;
  insert into public.user_packages (user_id, package_id, expires_at, granted_by)
  values (p_user, p_package, public.package_expiry(p_package), auth.uid())
  returning * into up;
  return up;
end;
$$;

-- ---------------------------------------------------------------------------
-- Reports (FR-A40..A42)
-- ---------------------------------------------------------------------------
create or replace function public.admin_overview(p_days int default 30)
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_staff() then raise exception 'FORBIDDEN'; end if;
  return jsonb_build_object(
    'registered', (select count(*) from public.profiles where role = 'learner'),
    'new_users', (select count(*) from public.profiles where role = 'learner' and created_at > now() - make_interval(days => p_days)),
    'active_users', (select count(distinct user_id) from (
        select user_id from public.attempts where started_at > now() - interval '7 days'
        union select user_id from public.practice_answers where created_at > now() - interval '7 days'
        union select user_id from public.lesson_progress where completed_at > now() - interval '7 days') x),
    'paid_users', (select count(distinct user_id) from public.user_packages where expires_at > now()),
    'revenue', (select coalesce(sum(amount), 0) from public.transactions where status = 'paid' and paid_at > now() - make_interval(days => p_days)),
    'attempts', (select count(*) from public.attempts where started_at > now() - make_interval(days => p_days)),
    'questions_published', (select count(*) from public.questions where status = 'published'),
    'questions_in_review', (select count(*) from public.questions where status = 'in_review'),
    'lessons_published', (select count(*) from public.lessons where status = 'published'),
    'open_reports', (select count(*) from public.question_reports where status = 'open'),
    'revenue_daily', (
      select coalesce(jsonb_agg(jsonb_build_object('day', d, 'amount', amt) order by d), '[]'::jsonb)
      from (select (paid_at at time zone 'Asia/Jakarta')::date d, sum(amount) amt
            from public.transactions where status = 'paid' and paid_at > now() - make_interval(days => p_days)
            group by 1) r)
  );
end;
$$;

create or replace function public.admin_tryout_report(p_tryout uuid)
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_staff() then raise exception 'FORBIDDEN'; end if;
  return (
    select jsonb_build_object(
      'participants', count(*),
      'avg_twk', round(avg(twk_score), 1), 'avg_tiu', round(avg(tiu_score), 1),
      'avg_tkp', round(avg(tkp_score), 1), 'avg_total', round(avg(total_score), 1),
      'pass_rate', round(100.0 * avg(passed::int), 1),
      'tab_switch_flagged', count(*) filter (where tab_switches >= 3),
      'distribution', (
        select coalesce(jsonb_agg(jsonb_build_object('bucket', b, 'count', c) order by b), '[]'::jsonb)
        from (select (total_score / 50) * 50 b, count(*) c from public.attempts
              where tryout_id = p_tryout and attempt_no = 1 and submitted_at is not null group by 1) d)
    )
    from public.attempts where tryout_id = p_tryout and attempt_no = 1 and submitted_at is not null
  );
end;
$$;

-- FR-A17 question statistics
create or replace view public.question_stats with (security_invoker = true) as
  select q.id as question_id,
         count(x.*) as times_answered,
         round(100.0 * avg((x.points = 5)::int), 1) as pct_full_points,
         round(avg(x.time_spent_ms) / 1000.0, 1) as avg_time_s,
         jsonb_object_agg(coalesce(x.option_label, '-'), x.c) filter (where x.option_label is not null) as distribution
  from public.questions q
  left join lateral (
    select aa.option_label, aa.points, aa.time_spent_ms, count(*) over (partition by aa.option_label) c
    from public.attempt_answers aa
    join public.attempts a on a.id = aa.attempt_id and a.submitted_at is not null
    where aa.question_id = q.id
  ) x on true
  group by q.id;

-- ---------------------------------------------------------------------------
-- Row Level Security
-- ---------------------------------------------------------------------------
alter table public.passing_grade_profiles enable row level security;
alter table public.profiles enable row level security;
alter table public.topics enable row level security;
alter table public.subtopics enable row level security;
alter table public.lessons enable row level security;
alter table public.lesson_versions enable row level security;
alter table public.lesson_progress enable row level security;
alter table public.lesson_notes enable row level security;
alter table public.questions enable row level security;
alter table public.tryouts enable row level security;
alter table public.tryout_questions enable row level security;
alter table public.attempts enable row level security;
alter table public.attempt_answers enable row level security;
alter table public.practice_answers enable row level security;
alter table public.saved_questions enable row level security;
alter table public.question_reports enable row level security;
alter table public.packages enable row level security;
alter table public.package_tryouts enable row level security;
alter table public.vouchers enable row level security;
alter table public.transactions enable row level security;
alter table public.user_packages enable row level security;
alter table public.announcements enable row level security;
alter table public.audit_logs enable row level security;

-- passing grade profiles: readable by all, managed by super admin
create policy pgp_read on public.passing_grade_profiles for select using (true);
create policy pgp_write on public.passing_grade_profiles for all using (public.is_super_admin()) with check (public.is_super_admin());

-- profiles
create policy profiles_self_read on public.profiles for select using (id = auth.uid() or public.is_staff());
create policy profiles_self_update on public.profiles for update using (id = auth.uid() or public.is_admin());

-- taxonomy
create policy topics_read on public.topics for select using (true);
create policy topics_write on public.topics for insert with check (public.is_staff());
create policy topics_update on public.topics for update using (public.is_staff());
create policy topics_delete on public.topics for delete using (public.is_admin());
create policy subtopics_read on public.subtopics for select using (true);
create policy subtopics_write on public.subtopics for insert with check (public.is_staff());
create policy subtopics_update on public.subtopics for update using (public.is_staff());
create policy subtopics_delete on public.subtopics for delete using (public.is_admin());

-- lessons: content readable only if free or entitled
create policy lessons_read on public.lessons for select using (
  public.is_staff()
  or (status = 'published' and (is_free or public.has_access(auth.uid(), 'material')))
);
create policy lessons_insert on public.lessons for insert with check (public.is_staff());
create policy lessons_update on public.lessons for update using (public.is_staff());
create policy lessons_delete on public.lessons for delete using (public.is_admin());
create policy lesson_versions_read on public.lesson_versions for select using (public.is_staff());

create policy lesson_progress_own on public.lesson_progress for all using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy lesson_notes_own on public.lesson_notes for all using (user_id = auth.uid()) with check (user_id = auth.uid());

-- questions: staff only (learners go through RPCs)
create policy questions_staff_read on public.questions for select using (public.is_staff());
create policy questions_insert on public.questions for insert with check (public.is_staff());
create policy questions_update on public.questions for update using (public.is_staff());
create policy questions_delete on public.questions for delete using (public.is_admin());

-- try-outs
create policy tryouts_read on public.tryouts for select using (status = 'published' or public.is_staff());
create policy tryouts_write on public.tryouts for all using (public.is_admin()) with check (public.is_admin());
create policy tryout_questions_staff on public.tryout_questions for select using (public.is_staff());
create policy tryout_questions_write on public.tryout_questions for all using (public.is_admin()) with check (public.is_admin());

create policy attempts_read on public.attempts for select using (user_id = auth.uid() or public.is_staff());
create policy attempt_answers_read on public.attempt_answers for select using (
  public.is_staff() or exists (
    select 1 from public.attempts a where a.id = attempt_id and a.user_id = auth.uid() and a.submitted_at is not null)
);

create policy practice_answers_read on public.practice_answers for select using (user_id = auth.uid() or public.is_staff());
create policy saved_questions_own on public.saved_questions for all using (user_id = auth.uid()) with check (user_id = auth.uid());

create policy reports_insert on public.question_reports for insert with check (user_id = auth.uid());
create policy reports_read on public.question_reports for select using (user_id = auth.uid() or public.is_staff());
create policy reports_update on public.question_reports for update using (public.is_staff());

-- commerce
create policy packages_read on public.packages for select using (is_active or public.is_admin());
create policy packages_write on public.packages for all using (public.is_admin()) with check (public.is_admin());
create policy package_tryouts_read on public.package_tryouts for select using (true);
create policy package_tryouts_write on public.package_tryouts for all using (public.is_admin()) with check (public.is_admin());
create policy vouchers_admin on public.vouchers for all using (public.is_admin()) with check (public.is_admin());
create policy transactions_read on public.transactions for select using (user_id = auth.uid() or public.is_admin());
create policy transactions_admin on public.transactions for update using (public.is_admin());
create policy user_packages_read on public.user_packages for select using (user_id = auth.uid() or public.is_admin());
create policy user_packages_admin on public.user_packages for all using (public.is_admin()) with check (public.is_admin());

create policy announcements_read on public.announcements for select using (published or public.is_admin());
create policy announcements_write on public.announcements for all using (public.is_admin()) with check (public.is_admin());

create policy audit_read on public.audit_logs for select using (public.is_super_admin());

-- views
grant select on public.lesson_catalog to anon, authenticated;
grant select on public.question_stats to authenticated;
