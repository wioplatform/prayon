PRAY ON v14

수정 사항
- 익명 기도함의 '기도 남기기' 버튼이 작동하지 않던 JavaScript 구문 오류 수정
- 익명 기도 입력칸의 예시 문구 제거
- 상단 스마일을 사용자가 제공한 노란색 원형 빅스마일 이미지로 교체
- 기존 Supabase 연결값, 공개 기도목록, 신고, 관리자 삭제 기능 유지
- 모든 이용자에게 공유되는 12시간 기도 발광 기능 유지

배포
1. index.html과 assets 폴더를 GitHub 저장소에 덮어씁니다.
2. config.js와 admin.html은 기존 파일 그대로 함께 업로드해도 됩니다.
3. Commit changes 후 GitHub Pages가 갱신되면 강력 새로고침합니다.

DB
- 이미 supabase_v11_patch.sql과 supabase_v13_shared_glow.sql을 실행했다면 추가 SQL은 필요하지 않습니다.
- v13 공유 발광 SQL을 아직 실행하지 않았다면 supabase_v13_shared_glow.sql을 한 번 실행하세요.
