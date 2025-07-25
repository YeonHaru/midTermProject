document.addEventListener("DOMContentLoaded", () => {
	// 탭 메뉴 클릭 시 활성화 토글
	const tabs = document.querySelectorAll(".tab-menu li");
	const contents = document.querySelectorAll(".tab-content");

	tabs.forEach((tab) => {
		tab.addEventListener("click", () => {
			const target = tab.dataset.tab;

			tabs.forEach((t) => t.classList.remove("active"));
			tab.classList.add("active");

			contents.forEach((c) => {
				c.classList.toggle("hidden", c.id !== target);
			});
		});
	});
	let hash = window.location.hash.substring(1);
	if (hash) {
		const targetTab = document.querySelector(`.tab-menu li[data-tab="${hash}"]`);
		if (targetTab) {
			setTimeout(() => {
				targetTab.click();
			}, 100);
		}
	}


	// 부가정보 수정 및 저장 버튼 처리
	const editBtn = document.getElementById("editBtn");
	const saveBtn = document.getElementById("saveBtn");
	const inputs = document.querySelectorAll(".additional-info input");

	editBtn.addEventListener("click", () => {
		inputs.forEach((input) => {
			if (input.id !== "gender") input.disabled = false;
		});

		// 알림 수신 토글박스는 항상 활성화 상태이므로 수정 버튼에서 변경하지 않음

		editBtn.classList.add("hidden");
		saveBtn.classList.remove("hidden");
	});

	saveBtn.addEventListener("click", () => {
		const gender = document.getElementById("gender").value;
		const birth = document.getElementById("birth").value;
		const phone = document.getElementById("phone").value;
		const address = document.getElementById("address").value;

		console.log("수정된 값:", { gender, birth, phone, address });

		inputs.forEach((input) => (input.disabled = true));

		editBtn.classList.remove("hidden");
		saveBtn.classList.add("hidden");
		// 저장 요청 (DB 반영)
		fetch("/mypage/updateInfo.do", {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
			},
			body: `birth=${encodeURIComponent(birth)}&phone=${encodeURIComponent(phone)}&address=${encodeURIComponent(address)}`
		})
			.then(res => res.text())
			.then(result => {
				if (result === "success") {
					alert("정보가 성공적으로 수정되었습니다.");
					location.reload(); // 새로고침으로 갱신
				} else {
					alert("정보 수정에 실패했습니다.");
				}
			});


		// 저장 후 실제 서버 저장 처리는 Ajax 또는 form 제출로 추가 구현 필요
	});

	// 알림 수신 동의 토글 상태 텍스트(ON/OFF) 업데이트
	document.querySelectorAll('.toggle-switch').forEach(toggle => {
		const checkbox = toggle.querySelector('input[type="checkbox"]');
		const status = toggle.querySelector('.toggle-status');

		function updateStatus() {
			status.textContent = checkbox.checked ? 'ON' : 'OFF';
		}

		updateStatus();

		checkbox.addEventListener('change', updateStatus);

		// 토글박스는 항상 활성화 상태이므로 disabled 조작 없음
	});

	// PC 화면보기 쿠키 저장 및 적용
	const btnPcView = document.getElementById("btnPcView");
	btnPcView.addEventListener("click", (e) => {
		e.preventDefault();
		document.cookie = "view=pc; path=/; max-age=" + 60 * 60 * 24;
		location.reload();
	});

	if (document.cookie.indexOf("view=pc") !== -1) {
		document.body.classList.add("pc-view");
	}

	// "1:1 문의" 버튼 (class 사용)
	document.querySelectorAll(".openInquiry").forEach((btn) => {
		btn.addEventListener("click", (e) => {
			e.preventDefault();
			window.open(
				"/mypage-1on1.do",
				"inquiryPopup",
				"width=460,height=600"
			);
		});
	});

	// "나의 질문" 버튼 (class 사용)
	document.querySelectorAll(".myQuestion").forEach((btn) => {
		btn.addEventListener("click", (e) => {
			e.preventDefault();
			window.open(
				"/mypage/myQuestions.do",
				"myQuestionsPopup",
				"width=800,height=600"
			);
		});
	});

	// 주문 내역의 취소 버튼
	document.querySelectorAll(".cancel-btn").forEach((btn) => {
		btn.addEventListener("click", (e) => {
			e.preventDefault();
			window.open(
				"/inquiryPopup.do",  // 또는 정확한 팝업 URL
				"cancelPopup",
				"width=460,height=600"
			);
		});
	});

	// toggle-switch 토글 상태 업데이트 및 서버 저장
	document.querySelectorAll('.toggle-switch').forEach(toggle => {
		const checkbox = toggle.querySelector('input[type="checkbox"]');
		const status = toggle.querySelector('.toggle-status');

		function updateStatus() {
			if (status) {
				status.textContent = checkbox.checked ? 'ON' : 'OFF';
			}
		}

		function savePreference() {
			let key, value;
			if (checkbox.id === "promoAgree") {
				key = "promoAgree";
				value = checkbox.checked ? "Y" : "N";
			} else if (checkbox.id === "postNotifyAgree") {
				key = "postNotifyAgree";
				value = checkbox.checked ? "Y" : "N";
			} else {
				return; // id가 없으면 무시
			}

			fetch("/mypage/updatePreferences.do", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded",
				},
				body: `${key}=${value}`
			})
				.then(res => res.text())
				.then(msg => {
					if (msg === "success") {
						console.log(`${key} 설정이 저장되었습니다.`);
					} else {
						alert(`${key} 설정 저장 실패`);
					}
				});
		}

		updateStatus();
		checkbox.addEventListener("change", () => {
			updateStatus();
			savePreference();
		});
	});
	// 환불 요청 내역 팝업
	document.querySelectorAll(".openRefundList").forEach((btn) => {
		btn.addEventListener("click", (e) => {
			e.preventDefault();
			window.open(
				"/refund/list.do",
				"refundPopup",
				"width=800,height=600,scrollbars=yes"
			);
		});

	});
})
