document.addEventListener("DOMContentLoaded", function () {
  const domainSelect = document.querySelector(".signup-email-domain-select");
  const domainInput = document.querySelector(".signup-email-domain-input");

  domainSelect.addEventListener("change", function () {
    domainInput.value = this.value; // 선택하면 자동 입력
    if (this.value === "") {
      domainInput.placeholder = "도메인 입력";
      domainInput.focus();
    }

    
  });
});
document.addEventListener("DOMContentLoaded", function () {
  const checkAll = document.getElementById("check-all");
  const checkEach = document.querySelectorAll(".check-each");
  const checkMarketing = document.querySelectorAll(".check-marketing");

  // "전체 동의" 클릭 시 모두 체크 또는 해제
  checkAll.addEventListener("change", function () {
    const checked = checkAll.checked;
    checkEach.forEach(cb => cb.checked = checked);
    checkMarketing.forEach(cb => cb.checked = checked);
  });

  // 개별 체크박스 상태가 바뀌면 전체 체크 여부 판단
  const updateAllCheck = () => {
    const allEachChecked = Array.from(checkEach).every(cb => cb.checked);
    const allMarketingChecked = Array.from(checkMarketing).every(cb => cb.checked);
    checkAll.checked = allEachChecked && allMarketingChecked;
  };

  checkEach.forEach(cb => cb.addEventListener("change", updateAllCheck));
  checkMarketing.forEach(cb => cb.addEventListener("change", updateAllCheck));
});

