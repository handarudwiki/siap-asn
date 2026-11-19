-- FR-A30: single-user lookup with auth email for the admin user detail page.
create or replace function public.admin_get_user(p_user uuid)
returns table (email text, last_sign_in_at timestamptz, email_confirmed_at timestamptz)
language plpgsql stable security definer set search_path = public, auth as $$
begin
  if not public.is_admin() then raise exception 'FORBIDDEN'; end if;
  return query select u.email::text, u.last_sign_in_at, u.email_confirmed_at from auth.users u where u.id = p_user;
end;
$$;
