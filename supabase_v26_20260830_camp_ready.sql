-- PRAY ON v26 — 2026-08-30 + 캠프용 개인기록 표시 설정
-- 기존 개인일기·익명기도·이전 주차 데이터는 삭제하지 않습니다.

create table if not exists public.prayon_settings (
  id integer primary key default 1 check (id = 1),
  journal_enabled boolean not null default false,
  updated_at timestamptz not null default now()
);

alter table public.prayon_settings enable row level security;
grant select on public.prayon_settings to anon, authenticated;
grant insert, update on public.prayon_settings to authenticated;

insert into public.prayon_settings(id,journal_enabled)
values (1,false)
on conflict (id) do nothing;

do $policies$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname='public' and tablename='prayon_settings'
      and policyname='public read prayon settings'
  ) then
    execute 'create policy "public read prayon settings"
      on public.prayon_settings for select
      to anon, authenticated
      using (true)';
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname='public' and tablename='prayon_settings'
      and policyname='admin update prayon settings'
  ) then
    execute 'create policy "admin update prayon settings"
      on public.prayon_settings for all
      to authenticated
      using (public.is_admin())
      with check (public.is_admin())';
  end if;
end
$policies$;

update public.weekly_content
set is_published=false, updated_at=now()
where message_date <> date '2026-08-30'
  and is_published=true;

insert into public.weekly_content (
  message_date,service_label,message_title,scripture,
  first_title,first_scripture,first_youtube_url,
  second_title,second_scripture,second_youtube_url,
  middle_title,middle_scripture,middle_youtube_url,
  high_title,high_scripture,high_youtube_url,
  first_pdf_url,second_pdf_url,
  key_sentence,daily_prayer,
  mon_excerpt,mon_prayer,tue_excerpt,tue_prayer,
  wed_excerpt,wed_prayer,thu_excerpt,thu_prayer,
  fri_excerpt,fri_prayer,sat_excerpt,sat_prayer,
  prayer_worry,prayer_hurt,prayer_anger,prayer_courage,prayer_thanks,prayer_friend,
  is_published,updated_at
) values (
  date '2026-08-30','주일 1부 예배','그날의 아침','출애굽기 12:12',
  '그날의 아침','출애굽기 12:12','https://www.youtube.com/watch?v=5BrkWcTuVRw',
  '처음 주신 성전','출애굽기 23:14-17','https://www.youtube.com/watch?v=YrKqCidT6HA',
  '','','',
  '','','',
  'assets/20260830_1ST_Garo_KR.pdf','assets/20260830_2ND_Garo_KR.pdf',
  '정확한 언약은 반드시 성취되고, 그날은 운명과 능력과 미래를 바꾸는 시작이 됩니다.',
  '하나님, 그리스도 안에서 해방된 하나님의 자녀라는 신분을 붙잡고 오늘의 삶과 능력과 미래를 말씀으로 새롭게 시작하게 해 주세요.',
  '애굽 같은 현실을 넘어서고, 내 생각과 사람의 생각에서도 나와야 합니다.',
  '하나님, 눈에 보이는 현실과 제 생각에 매이지 않고 그리스도 안에서 해방된 하나님의 자녀임을 믿게 해 주세요. 정확한 언약을 오늘 제 마음에 심게 해 주세요.',
  '내 안에 망대, 내 앞에 보좌의 여정, 가는 길에는 보좌의 이정표가 있습니다.',
  '하나님, 7·7·7 언약으로 제 안에 망대를 세우게 해 주세요. 오늘 제 앞에 여시는 길과 그 길에 준비된 미래를 말씀으로 보게 해 주세요.',
  '유월절은 운명을, 오순절은 능력을, 수장절은 배경과 미래를 바꾸는 시작입니다.',
  '하나님, 제 운명과 신분은 그리스도 안에서 해방되었음을 믿습니다. 제 능력을 하나님의 것으로 바꾸고, 보좌의 배경 속에서 미래를 바라보게 해 주세요.',
  '보좌의 능력을 누리는 예배, 보좌의 백성이 남기는 발자취, 후대와 세계를 살리는 성전을 준비해요.',
  '하나님, 예배 속에서 보좌의 능력을 누리고 제 삶에 믿음의 발자취를 남기게 해 주세요. 다음 세대와 세계에 복음을 전하는 일에 제 삶이 쓰임 받게 해 주세요.',
  '아침에는 모든 것을 회복하고, 낮에는 길을 보고, 밤에는 300% 작품을 남겨요.',
  '하나님, 오늘 아침 확신으로 시작하고 낮에는 주신 길을 보며 밤에는 하루를 말씀 안에서 정리하게 해 주세요. 제 삶 자체가 기도가 되게 해 주세요.',
  '삶의 기도, 예배의 다섯 길, 그리고 하나님이 부르신 이유를 찾는 특별 집중을 시작해요.',
  '하나님, 일상 속 기도를 지속하고 예배에서 말씀 성취와 기도 응답을 확인하게 해 주세요. 제게 맡기신 한 가지를 발견하고 집중하는 새로운 시작을 하게 해 주세요.',
  '하나님, 지금 제 걱정보다 해방된 하나님의 자녀라는 신분을 더 크게 보게 해 주세요. 제 생각에 묶이지 않고 오늘 여시는 길을 보게 해 주세요.',
  '하나님, 마음이 아픈 순간에도 정확한 언약은 반드시 성취됨을 믿고 제 안에 말씀의 망대를 세우게 해 주세요.',
  '하나님, 감정과 사람의 말에 붙잡히지 않고 말씀으로 반응하며 믿음의 발자취를 남기게 해 주세요.',
  '하나님, 유월절의 해방과 오순절의 능력과 수장절의 배경을 붙잡고 오늘 해야 할 한 걸음을 담대히 시작하게 해 주세요.',
  '하나님, 오늘 주신 삶과 예배와 말씀에 감사합니다. 아침의 회복과 낮의 길과 밤의 작품을 감사로 누리게 해 주세요.',
  '하나님, 친구와 현장에 복음의 망대가 세워지고 서로의 삶에 사람을 살리는 믿음의 발자취가 남게 해 주세요.',
  true,now()
)
on conflict (message_date) do update set
  service_label=excluded.service_label,message_title=excluded.message_title,scripture=excluded.scripture,
  first_title=excluded.first_title,first_scripture=excluded.first_scripture,first_youtube_url=excluded.first_youtube_url,
  second_title=excluded.second_title,second_scripture=excluded.second_scripture,second_youtube_url=excluded.second_youtube_url,
  middle_title=excluded.middle_title,middle_scripture=excluded.middle_scripture,middle_youtube_url=excluded.middle_youtube_url,
  high_title=excluded.high_title,high_scripture=excluded.high_scripture,high_youtube_url=excluded.high_youtube_url,
  first_pdf_url=excluded.first_pdf_url,second_pdf_url=excluded.second_pdf_url,
  key_sentence=excluded.key_sentence,daily_prayer=excluded.daily_prayer,
  mon_excerpt=excluded.mon_excerpt,mon_prayer=excluded.mon_prayer,
  tue_excerpt=excluded.tue_excerpt,tue_prayer=excluded.tue_prayer,
  wed_excerpt=excluded.wed_excerpt,wed_prayer=excluded.wed_prayer,
  thu_excerpt=excluded.thu_excerpt,thu_prayer=excluded.thu_prayer,
  fri_excerpt=excluded.fri_excerpt,fri_prayer=excluded.fri_prayer,
  sat_excerpt=excluded.sat_excerpt,sat_prayer=excluded.sat_prayer,
  prayer_worry=excluded.prayer_worry,prayer_hurt=excluded.prayer_hurt,prayer_anger=excluded.prayer_anger,
  prayer_courage=excluded.prayer_courage,prayer_thanks=excluded.prayer_thanks,prayer_friend=excluded.prayer_friend,
  is_published=true,updated_at=now();
