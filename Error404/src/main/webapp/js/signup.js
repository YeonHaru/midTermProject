// ✅ signup.js 전체 파일

console.log("✅ signup.js 로드됨"); // 스크립트 로딩 확인용

// ==============================
// 📧 이메일 도메인 선택 관련
// ==============================
const domainSelect = document.querySelector(".signup-email-domain-select");
const domainInput = document.querySelector(".signup-email-domain-input");

if (domainSelect && domainInput) {
  domainSelect.addEventListener("change", function () {
    domainInput.value = this.value;
    if (this.value === "") {
      domainInput.placeholder = "도메인 입력";
      domainInput.focus();
    }
  });
}

// ==============================
// ✅ 약관 체크 전체선택 처리
// ==============================
const checkAll = document.getElementById("check-all");
const checkEach = document.querySelectorAll(".check-each");
const checkMarketing = document.querySelectorAll(".check-marketing");

if (checkAll) {
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
}

// ==============================
// 📩 이메일 & 전화번호 조합 후 hidden에 담기
// ==============================
const form = document.getElementById("signupForm");
if (form) {
  form.addEventListener("submit", function (e) {
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
    console.log("📧 조립된 이메일:", email.value);

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
    console.log("📱 조립된 전화번호:", phone.value);
    
    // ✅ 수신 동의 여부 조합 (이제 제대로 위치함)
    const finalPromoAgree = document.getElementById("finalPromoAgree");
    let agreed = false;

    checkMarketing.forEach(cb => {
      if (cb.checked) agreed = true;
    });

    finalPromoAgree.value = agreed ? "Y" : "N";
    console.log("📩 수신 동의 여부:", finalPromoAgree.value);
  });
  
  
}
