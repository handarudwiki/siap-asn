-- Two full-length SKD try-outs (30 TWK + 35 TIU + 45 TKP, 100 minutes) built from the
-- published bank with a ~30/50/20 easy/medium/hard mix. Paid (included in Try-out Pack
-- and Premium Lengkap via includes_all_tryouts). Idempotent by slug.
do $$
declare
  t record;
  new_id uuid;
  code public.test_code;
  need int;
begin
  for t in select * from (values
      ('Try-out SKD Lengkap #1', 'tryout-skd-lengkap-1', 'Simulasi penuh SKD: 110 soal, 100 menit, penilaian dan passing grade sesuai aturan resmi.'),
      ('Try-out SKD Lengkap #2', 'tryout-skd-lengkap-2', 'Simulasi penuh SKD kedua dengan kombinasi soal berbeda untuk mengukur kemajuan Anda.')
    ) as v(title, slug, description)
  loop
    if exists (select 1 from public.tryouts where slug = t.slug) then continue; end if;
    insert into public.tryouts (title, slug, description, kind, duration_minutes, extended_duration_minutes, attempt_limit,
                                blueprint, shuffle_questions, shuffle_options, is_free, status, passing_grade_profile_id)
    values (t.title, t.slug, t.description, 'on_demand', 100, 130, 2, '{"TWK":30,"TIU":35,"TKP":45}', true, false, false, 'published',
            (select id from public.passing_grade_profiles where is_default order by year desc limit 1))
    returning id into new_id;

    foreach code in array array['TWK','TIU','TKP']::public.test_code[] loop
      need := case code when 'TWK' then 30 when 'TIU' then 35 else 45 end;
      insert into public.tryout_questions (tryout_id, question_id, position)
      select new_id, x.id, 0 from (
        select q.id, row_number() over (partition by q.difficulty order by random()) rn, q.difficulty
        from public.questions q
        where q.test_code = code and q.status = 'published' and q.usage in ('tryout', 'both')
      ) x
      where (x.difficulty = 'easy' and x.rn <= round(need * 0.3))
         or (x.difficulty = 'medium' and x.rn <= need - round(need * 0.3) - round(need * 0.2))
         or (x.difficulty = 'hard' and x.rn <= round(need * 0.2));
      -- top up if a difficulty bucket was short
      insert into public.tryout_questions (tryout_id, question_id, position)
      select new_id, q.id, 0 from public.questions q
      where q.test_code = code and q.status = 'published' and q.usage in ('tryout', 'both')
        and not exists (select 1 from public.tryout_questions e where e.tryout_id = new_id and e.question_id = q.id)
      order by random()
      limit greatest(0, need - (select count(*) from public.tryout_questions tq join public.questions q2 on q2.id = tq.question_id
                                 where tq.tryout_id = new_id and q2.test_code = code));
    end loop;

    update public.tryout_questions tq set position = r.pos
    from (select tq2.question_id, row_number() over (order by case q.test_code when 'TWK' then 1 when 'TIU' then 2 else 3 end, random()) pos
          from public.tryout_questions tq2 join public.questions q on q.id = tq2.question_id where tq2.tryout_id = new_id) r
    where tq.tryout_id = new_id and tq.question_id = r.question_id;
  end loop;
end $$;
