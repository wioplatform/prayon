PRAY ON v7

변경 사항
- 사용자가 제공한 망대 원형 아이콘을 상단 로고로 통일
- 스마일 눈을 위로 올리고 입을 더 길게 만든 Big Smile 적용
- 오늘의 기도카드 영역을 상단 첫 콘텐츠로 이동
- 내가 붙잡은 한 문장 / 내가 쓴 기도제목 기록 기능 추가
  · 현재는 브라우저 localStorage에 저장
- 익명 기도함 Supabase 연결 코드 추가
- Supabase SQL 및 config.js 설정 파일 포함

온라인 익명 기도함 연결
1. Supabase에서 새 프로젝트를 만듭니다.
2. SQL Editor에서 supabase_schema.sql 내용을 실행합니다.
3. Project Settings > API에서 Project URL과 Publishable key를 확인합니다.
4. config.js의 두 값을 교체합니다.
5. index.html, config.js, assets 폴더를 GitHub에 다시 업로드합니다.

중요
- secret/service_role 키는 절대 GitHub나 config.js에 넣지 마세요.
- 익명 사용자는 기도제목을 제출만 할 수 있고, 다른 기도제목은 읽을 수 없도록 RLS 정책을 구성했습니다.
- 관리자 열람 화면은 로그인과 관리자 전용 정책을 추가하는 다음 단계에서 구현합니다.
