PRAY ON v9 — Supabase + 관리자 익명 기도함

포함 파일
- index.html: 사용자 페이지 및 익명 기도함 제출
- admin.html: 관리자 이메일/비밀번호 로그인, 익명 기도 조회 및 즉시 삭제
- config.js: Supabase Project URL과 Publishable key
- supabase_full_schema.sql: 전체 테이블, RLS 정책, 관리자 권한 구조
- assets/: 기존 이미지와 PDF

설치 순서
1. Supabase SQL Editor에서 supabase_full_schema.sql 전체 실행
2. Supabase Authentication > Users에서 관리자 계정 생성
   - 이메일과 비밀번호 지정
   - 이메일 확인이 필요한 경우 Auto Confirm User를 사용하거나 확인 메일 처리
3. SQL Editor에서 다음 한 줄을 관리자 이메일로 바꾸어 실행
   update public.profiles
   set role='admin', is_active=true, updated_at=now()
   where lower(email)=lower('관리자이메일');
4. Settings > API Keys에서 Publishable key 복사
5. config.js의 YOUR_SUPABASE_PUBLISHABLE_KEY를 실제 키로 교체
6. GitHub 저장소에 index.html, admin.html, config.js, assets 폴더 업로드
7. 사용자 주소: /prayon/
   관리자 주소: /prayon/admin.html

주의
- config.js에는 Publishable key만 사용합니다.
- Secret key와 service_role key는 절대로 GitHub 또는 브라우저 코드에 넣지 마세요.
- 익명 방문자는 기도제목을 제출만 할 수 있습니다.
- 관리자 계정만 익명 기도제목을 읽고 삭제할 수 있습니다.


배포 준비 상태
- Project URL 입력 완료
- Publishable key 입력 완료
- Secret key/service_role 키는 사용하지 않음


PRAY ON v10 수정
- 삭제된 HTML 요소를 호출하던 JavaScript 오류를 수정했습니다.
- 이 오류로 중단되었던 테두리 색상 변경 기능을 복구했습니다.
- 메인 기도이미지 아래에 주일 1부 강단 메시지 제목·본문·핵심문장을 다시 표시했습니다.
- 기도이미지와 동일하게 주일 1부 메시지로 고정해 내용 불일치를 막았습니다.
- Supabase Project URL과 Publishable key는 기존 연결 완료 상태를 유지했습니다.
