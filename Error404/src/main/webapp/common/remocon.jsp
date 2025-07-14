<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/201_remocon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css">	
<div class="fixed-btn-group mb4">
	<!-- 로그인 사용자 id 전달용이다 -->
	<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}" />
	<input type="hidden" id="userid" value="${sessionScope.loginUser.userid}" />
	<!-- TOP 버튼 -->
	<button id="btnTop" class="btn">
		⬆︎<br>
	</button>
<!-- BOTTOM 버튼 -->
	<button id="btnBottom" class="btn">
		⬇︎<br>
	</button>
</div>

<script>
  // TOP 버튼 클릭 시 부드럽게 맨 위로 이동
  document.getElementById("btnTop")?.addEventListener("click", function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
  // BOTTOM 버튼 클릭 시 부드럽게 맨 아래로 이동
  document.getElementById("btnBottom")?.addEventListener("click", function () {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  });  
</script>
