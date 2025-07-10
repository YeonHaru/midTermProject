/**
 * 
 */
function openModal(grade) {
  const modal = document.getElementById("gradeModal");
  const modalText = document.getElementById("modalText");

  let content = "";
  switch (grade) {
    case "platinum":
      content = "<strong>💎 플래티넘 회원</strong><br>최근 3개월간 구매금액 30만원 이상";
      break;
    case "gold":
      content = "<strong>🔶 골드 회원</strong><br>최근 3개월간 구매금액 20만원 이상";
      break;
    case "general":
      content = "<strong>🟢 일반 회원</strong><br>북클럽 가입 시 기본 등급";
      break;
  }

  modalText.innerHTML = content;
  modal.style.display = "block";
}

function closeModal() {
  document.getElementById("gradeModal").style.display = "none";
}
