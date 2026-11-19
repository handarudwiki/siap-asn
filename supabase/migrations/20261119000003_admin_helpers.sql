-- Admin helpers: user listing, duplicate detection, refunds, try-out auto-fill.

create extension if not exists pg_trgm;
create index if not exists questions_stem_trgm_idx on public.questions using gin (stem gin_trgm_ops);

-- FR-A30: user list with email (auth.users is not exposed via the Data API)
create or replace function public.admin_list_users(p_search text default null, p_role public.user_role default null, p_limit int default 50, p_offset int default 0)
returns table (id uuid, email text, full_name text, role public.user_role, formation_type text, suspended boolean,
               created_at timestamptz, last_sign_in_at timestamptz, premium boolean, attempts bigint, total_count bigint)
language plpgsql stable security definer set search_path = public, auth as $$
begin
  if not public.is_staff() then raise exception 'FORBIDDEN'; end if;
  return query
    select p.id, u.email::text, p.full_name, p.role, p.formation_type, p.suspended, p.created_at, u.last_sign_in_at,
           public.is_premium(p.id),
           (select count(*) from public.attempts a where a.user_id = p.id),
           count(*) over ()
    from public.profiles p join auth.users u on u.id = p.id
    where (p_search is null or p_search = '' or u.email ilike '%' || p_search || '%' or p.full_name ilike '%' || p_search || '%')
      and (p_role is null or p.role = p_role)
    order by p.created_at desc
    limit p_limit offset p_offset;
end;
$$;

-- FR-A14: duplicate detection on stem text
create or replace function public.find_similar_questions(p_stem text, p_exclude uuid default null)
returns table (id uuid, stem text, status public.content_status, similarity real)
language sql stable security definer set search_path = public as $$
  select q.id, q.stem, q.status, similarity(q.stem, p_stem)
  from public.questions q
  where public.is_staff()
    and (p_exclude is null or q.id <> p_exclude)
    and q.stem % p_stem
  order by similarity(q.stem, p_stem) desc
  limit 5
$$;

-- FR-A33: refund – mark refunded and revoke the access granted by it
create or replace function public.admin_refund_transaction(p_tx uuid)
returns public.transactions language plpgsql security definer set search_path = public as $$
declare tx public.transactions;
begin
  if not public.is_admin() then raise exception 'FORBIDDEN'; end if;
  update public.transactions set status = 'refunded', updated_at = now() where id = p_tx and status = 'paid' returning * into tx;
  if not found then raise exception 'TX_NOT_PAID'; end if;
  update public.user_packages set expires_at = now() where transaction_id = p_tx and expires_at > now();
  return tx;
end;
$$;

-- FR-A22: fill a try-out randomly from tags following its blueprint and a difficulty mix
create or replace function public.admin_fill_tryout(p_tryout uuid, p_easy int default 30, p_medium int default 50, p_hard int default 20, p_replace boolean default true)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  t public.tryouts;
  code public.test_code;
  need int; n_easy int; n_med int; n_hard int; got int;
  result jsonb := '{}';
begin
  if not public.is_admin() then raise exception 'FORBIDDEN'; end if;
  select * into t from public.tryouts where id = p_tryout;
  if exists (select 1 from public.attempts where tryout_id = p_tryout) then raise exception 'TRYOUT_HAS_ATTEMPTS'; end if;
  if p_replace then delete from public.tryout_questions where tryout_id = p_tryout; end if;

  foreach code in array array['TWK','TIU','TKP']::public.test_code[] loop
    need := coalesce((t.blueprint ->> code::text)::int, 0)
            - (select count(*) from public.tryout_questions tq join public.questions q on q.id = tq.question_id
               where tq.tryout_id = p_tryout and q.test_code = code);
    if need <= 0 then continue; end if;
    n_easy := round(need * p_easy / 100.0);
    n_hard := round(need * p_hard / 100.0);
    n_med := need - n_easy - n_hard;

    insert into public.tryout_questions (tryout_id, question_id, position)
    select p_tryout, x.id, 0 from (
      (select q.id from public.questions q where q.test_code = code and q.status = 'published' and q.usage in ('tryout','both') and q.difficulty = 'easy'
         and not exists (select 1 from public.tryout_questions e where e.tryout_id = p_tryout and e.question_id = q.id) order by random() limit n_easy)
      union all
      (select q.id from public.questions q where q.test_code = code and q.status = 'published' and q.usage in ('tryout','both') and q.difficulty = 'medium'
         and not exists (select 1 from public.tryout_questions e where e.tryout_id = p_tryout and e.question_id = q.id) order by random() limit n_med)
      union all
      (select q.id from public.questions q where q.test_code = code and q.status = 'published' and q.usage in ('tryout','both') and q.difficulty = 'hard'
         and not exists (select 1 from public.tryout_questions e where e.tryout_id = p_tryout and e.question_id = q.id) order by random() limit n_hard)
    ) x
    on conflict do nothing;

    -- top up from any difficulty when a bucket was short
    need := coalesce((t.blueprint ->> code::text)::int, 0)
            - (select count(*) from public.tryout_questions tq join public.questions q on q.id = tq.question_id
               where tq.tryout_id = p_tryout and q.test_code = code);
    if need > 0 then
      insert into public.tryout_questions (tryout_id, question_id, position)
      select p_tryout, q.id, 0 from public.questions q
      where q.test_code = code and q.status = 'published' and q.usage in ('tryout','both')
        and not exists (select 1 from public.tryout_questions e where e.tryout_id = p_tryout and e.question_id = q.id)
      order by random() limit need
      on conflict do nothing;
    end if;

    select count(*) into got from public.tryout_questions tq join public.questions q on q.id = tq.question_id
     where tq.tryout_id = p_tryout and q.test_code = code;
    result := result || jsonb_build_object(code::text, got);
  end loop;

  -- renumber positions: TWK, TIU, TKP
  update public.tryout_questions tq set position = r.pos
  from (select tq2.question_id, row_number() over (order by case q.test_code when 'TWK' then 1 when 'TIU' then 2 else 3 end, q.created_at) pos
        from public.tryout_questions tq2 join public.questions q on q.id = tq2.question_id where tq2.tryout_id = p_tryout) r
  where tq.tryout_id = p_tryout and tq.question_id = r.question_id;

  return result;
end;
$$;

-- FR-A26: clone a try-out (settings + questions + packages)
create or replace function public.admin_clone_tryout(p_tryout uuid)
returns uuid language plpgsql security definer set search_path = public as $$
declare new_id uuid := gen_random_uuid();
begin
  if not public.is_admin() then raise exception 'FORBIDDEN'; end if;
  insert into public.tryouts (id, title, slug, description, kind, starts_at, ends_at, cap_at_window_end, duration_minutes,
                              extended_duration_minutes, attempt_limit, blueprint, shuffle_questions, shuffle_options,
                              discussion_after, is_free, passing_grade_profile_id, status, created_by)
  select new_id, title || ' (salinan)', slug || '-' || substr(new_id::text, 1, 6), description, kind, starts_at, ends_at,
         cap_at_window_end, duration_minutes, extended_duration_minutes, attempt_limit, blueprint, shuffle_questions,
         shuffle_options, discussion_after, is_free, passing_grade_profile_id, 'draft', auth.uid()
  from public.tryouts where id = p_tryout;
  insert into public.tryout_questions (tryout_id, question_id, position)
    select new_id, question_id, position from public.tryout_questions where tryout_id = p_tryout;
  insert into public.package_tryouts (package_id, tryout_id)
    select package_id, new_id from public.package_tryouts where tryout_id = p_tryout;
  return new_id;
end;
$$;

-- FR-A42: weakest sub-topics across all learners
create or replace function public.admin_content_report()
returns table (subtopic text, test_code public.test_code, answers bigint, accuracy numeric)
language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_staff() then raise exception 'FORBIDDEN'; end if;
  return query
    select s.name, q.test_code, count(*),
           round(100.0 * avg(case when q.test_code = 'TKP' then coalesce(aa.points, 0) / 5.0 else (coalesce(aa.points, 0) > 0)::int end), 1)
    from public.attempt_answers aa
    join public.attempts a on a.id = aa.attempt_id and a.submitted_at is not null
    join public.questions q on q.id = aa.question_id
    left join public.subtopics s on s.id = q.subtopic_id
    group by s.name, q.test_code
    order by 4 asc nulls last;
end;
$$;

-- Allow trusted contexts (SQL editor / service role, where auth.uid() is null)
-- to set roles, e.g. to bootstrap the first super admin.
create or replace function public.guard_profile_update()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if (new.role is distinct from old.role) and auth.uid() is not null and not public.is_super_admin() then
    raise exception 'Only super admin can change roles';
  end if;
  if (new.suspended is distinct from old.suspended) and auth.uid() is not null and not public.is_admin() then
    raise exception 'Only admin can suspend accounts';
  end if;
  new.updated_at := now();
  return new;
end;
$$;
