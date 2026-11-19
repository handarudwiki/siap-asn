-- Marketing attribution: first-touch UTM parameters per learner.
alter table public.profiles add column if not exists acquisition jsonb;

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, acquisition)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name'),
    new.raw_user_meta_data -> 'utm'
  );
  return new;
end;
$$;

-- Channel report for admins
create or replace function public.admin_acquisition_report(p_days int default 30)
returns table (source text, medium text, campaign text, signups bigint, paid bigint)
language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_staff() then raise exception 'FORBIDDEN'; end if;
  return query
    select coalesce(p.acquisition ->> 'utm_source', '(direct)'),
           coalesce(p.acquisition ->> 'utm_medium', '-'),
           coalesce(p.acquisition ->> 'utm_campaign', '-'),
           count(*),
           count(*) filter (where exists (select 1 from public.transactions t where t.user_id = p.id and t.status = 'paid'))
    from public.profiles p
    where p.role = 'learner' and p.created_at > now() - make_interval(days => p_days)
    group by 1, 2, 3
    order by 4 desc;
end;
$$;
