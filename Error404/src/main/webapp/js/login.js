// DOMContentLoaded 이벤트를 사용해 DOM 로드 후 스크립트 실행
document.addEventListener("DOMContentLoaded", function () {
  // 탭 버튼과 콘텐츠 영역, 그리고 버튼들 선택
  const tabs = document.querySelectorAll('.login-tab');
  const contents = document.querySelectorAll('.login-content');
  const memberBtn = document.querySelector('.login-btn-member');
  const nonMemberBtn = document.querySelector('.login-btn-nonmember');

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      // 1. 모든 탭에서 active 클래스 제거 후 클릭한 탭에 active 추가
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      // 2. 모든 콘텐츠 영역 숨기고
      contents.forEach(content => content.classList.remove('active'));

      // 3. data-tab 속성 값에 따라 해당 콘텐츠에 active 클래스 추가
      const selected = tab.getAttribute('data-tab'); // "member" 또는 "nonmember"
      const targetContent = document.querySelector(`.login-${selected}`);
      if (targetContent) {
        targetContent.classList.add('active');
      }

      // 4. 회원과 비회원 전용 버튼 전환 (버튼 텍스트가 다르므로)
      if (selected === 'member') {
        memberBtn.classList.add('active');
        nonMemberBtn.classList.remove('active');
      } else {
        memberBtn.classList.remove('active');
        nonMemberBtn.classList.add('active');
      }
    });
  });
});
