<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/201_remocon.css">
<div class="fixed-btn-group mb4">
<!-- 로그인 사용자 id 전달용이다 -->
<input type="hidden" id="userid" value="${loginUser.userid}">
  <!-- TOP 버튼 -->
  <button id="btnTop" class="btn">⬆︎<br>TOP</button>
  <!-- 최근 본 상품 버튼 -->
<button id="btnRecent" class="btn">🕒</button>
</div>

<!-- 최근 본 상품 모달 -->
<div id="recentModal" class="recent-modal">
  <span id="closeModal" class="close">&times;</span>
  <span class="modal-title">최근 본 상품</span>
  <div id="recentList"></div>
</div>

<script src="${pageContext.request.contextPath}/js/203_remocon.js"></script>
<script>
  // TOP 버튼 클릭 시 부드럽게 맨 위로 이동
  document.getElementById("btnTop")?.addEventListener("click", function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
</script>
