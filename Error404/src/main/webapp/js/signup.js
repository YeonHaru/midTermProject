console.log("✅ signup.js 로드됨"); // 스크립트 로딩 확인용

// ==============================
// 📧 이메일 도메인 선택 관련
// ==============================
const domainSelect = document.querySelector(".signup-email-domain-select");
const domainInput = document.querySelector(".signup-email-domain-input");

if (domainSelect && domainInput) {
	domainSelect.addEventListener("change", function() {
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
	checkAll.addEventListener("change", function() {
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
// 📩 이메일 & 전화번호 조합 및 비밀번호 일치 체크
// ==============================
const form = document.getElementById("signupForm");

if (form) {
	form.addEventListener("submit", function(e) {
		// 1. 비밀번호 일치 검사
		const password = document.getElementById("signup-password").value.trim();
		const password2 = document.getElementById("signup-password2").value.trim();

		if (password !== password2) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			e.preventDefault();
			return;
		}

		// 2. 이메일 조합 및 검사
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

		// 3. 휴대전화 조합 및 검사
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

		// 4. 수신 동의 여부 조합
		const finalPromoAgree = document.getElementById("finalPromoAgree");
		let agreed = false;

		checkMarketing.forEach(cb => {
			if (cb.checked) agreed = true;
		});

		finalPromoAgree.value = agreed ? "Y" : "N";
		console.log("📩 수신 동의 여부:", finalPromoAgree.value);
	});
}

// ==============================
// 🔍 중복 아이디 체크 blur 이벤트만 등록
// ==============================
const useridInput = document.getElementById("signup-id");
const useridCheckMsg = document.getElementById("checkIdMsg");

// 중복체크 함수
function checkUserid() {
	const userid = useridInput.value.trim();
	if (!userid) {
		useridCheckMsg.textContent = "아이디를 입력해주세요.";
		useridCheckMsg.style.color = "red";
		return;
	}

	fetch(`${window.location.origin}/checkUserid.do?userid=${encodeURIComponent(userid)}`)
		.then(response => response.text())
		.then(data => {
			if (data === "available") {
				useridCheckMsg.textContent = "사용 가능한 아이디입니다.";
				useridCheckMsg.style.color = "green";
			} else {
				useridCheckMsg.textContent = "이미 존재하는 아이디입니다.";
				useridCheckMsg.style.color = "red";
			}
		})
		.catch(() => {
			useridCheckMsg.textContent = "서버와 통신 중 오류가 발생했습니다.";
			useridCheckMsg.style.color = "red";
		});
}

if (useridInput && useridCheckMsg) {
	useridInput.addEventListener("blur", checkUserid);
}

// ==============================
// 🧷 비밀번호 일치 여부 실시간 체크
// ==============================
const pw1 = document.getElementById("signup-password");
const pw2 = document.getElementById("signup-password2");

const pwMsg = document.createElement("span");
pw2.parentNode.appendChild(pwMsg); // 비밀번호 확인 입력 아래에 추가

function checkPasswordMatch() {
	const val1 = pw1.value.trim();
	const val2 = pw2.value.trim();

	if (!val1 || !val2) {
		pwMsg.textContent = "";
		return;
	}

	if (val1 === val2) {
		pwMsg.textContent = "비밀번호가 일치합니다.";
		pwMsg.style.color = "green";
	} else {
		pwMsg.textContent = "비밀번호가 일치하지 않습니다.";
		pwMsg.style.color = "red";
	}
}

if (pw1 && pw2) {
	pw1.addEventListener("input", checkPasswordMatch);
	pw2.addEventListener("input", checkPasswordMatch);
}

