document.addEventListener("DOMContentLoaded", function () {
  // ==============================
  // 📧 이메일 도메인 선택 관련
  // ==============================
  const domainSelect = document.querySelector(".signup-email-domain-select");
  const domainInput = document.querySelector(".signup-email-domain-input");

  domainSelect.addEventListener("change", function () {
    domainInput.value = this.value; // 선택 시 자동입력
    if (this.value === "") {
      domainInput.placeholder = "도메인 입력";
      domainInput.focus();
    }
  });

  // ==============================
  // ✅ 약관 체크 전체선택 처리
  // ==============================
  const checkAll = document.getElementById("check-all");
  const checkEach = document.querySelectorAll(".check-each");
  const checkMarketing = document.querySelectorAll(".check-marketing");

  checkAll.addEventListener("change", function () {
    const checked = checkAll.checked;
    checkEach.forEach(cb => cb.checked = checked);
    checkMarketing.forEach(cb => cb.checked = checked);
  });

  const updateAllCheck = () => {
    const allEachChecked = Array.from(checkEach).every(cb => cb.checked);
    const allMarketingChecked = Array.from(checkMarketing).every(cb => cb.checked);
    checkAll.checked = allEachChecked && allMarketingChecked;
  };

  checkEach.forEach(cb => cb.addEventListener("change", updateAllCheck));
  checkMarketing.forEach(cb => cb.addEventListener("change", updateAllCheck));

  // ==============================
  // 📩 이메일 & 전화번호 조합 후 hidden에 담기
  // ==============================
  document.getElementById("signupForm").addEventListener("submit", function (e) {
    // 이메일 조합
    const emailId = document.getElementById("emailId").value.trim();
    const emailDomain = document.getElementById("emailDomain").value.trim();
    const email = document.getElementById("email");

    if (!emailId || !emailDomain) {
      alert("이메일을 올바르게 입력해주세요.");
      e.preventDefault();
      return;
    }
    email.value = emailId + "@" + emailDomain;

    // 휴대전화 조합
    const phone1 = document.getElementById("phone1").value.trim();
    const phone2 = document.getElementById("phone2").value.trim();
    const phone3 = document.getElementById("phone3").value.trim();
    const phone = document.getElementById("phone");

    if (!phone1 || !phone2 || !phone3) {
      alert("휴대전화 번호를 올바르게 입력해주세요.");
      e.preventDefault();
      return;
    }
    phone.value = phone1 + "-" + phone2 + "-" + phone3;
  });
});
