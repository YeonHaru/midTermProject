<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/01_login.css">
</head>
<body>

	<div class="login-wrapper">

		<!-- 오른쪽 상단 회원가입 버튼 -->
		<div class="signup-button-container">
			<a href="${pageContext.request.contextPath}/join.do"
				class="signup-button">회원가입</a>
		</div>

		<h2 class="login-title">로그인</h2>

		<!-- 로그인 실패 메시지 -->
		<c:if test="${not empty msg}">
			<p class="error-msg" style="color: red; text-align: center;">${msg}</p>
		</c:if>

		<!-- 탭 영역 -->
		<div class="login-box">
			<div class="login-tabs">
				<button class="login-tab active" data-tab="member">회원 로그인</button>
				<button class="login-tab" data-tab="nonmember">비회원 주문확인</button>
			</div>

			<!-- 회원 로그인 콘텐츠 -->
			<div class="login-content login-member active">
				<form action="${pageContext.request.contextPath}/login.do"
					method="post">
					<div class="login-form">
						<input type="text" name="userid" class="login-input"
							placeholder="아이디를 입력하세요" required> <input type="password"
							name="password" class="login-input" placeholder="비밀번호를 입력하세요"
							required>

						<div class="login-options">
							<label><input type="checkbox" name="remember">
								로그인 상태 유지</label> <label><input type="checkbox" name="saveId">
								아이디 저장</label>
						</div>
					</div>

					<button type="submit" class="login-button login-btn-member active">로그인</button>
				</form>

				<div class="login-links">
					<a href="${pageContext.request.contextPath}/findId.do">아이디 찾기</a> <span>|</span>
					<a href="${pageContext.request.contextPath}/findPw.do">비밀번호 찾기</a>
				</div>

			</div>

			<!-- 비회원 주문확인 콘텐츠 -->
			<div class="login-content login-nonmember">
				<form action="${pageContext.request.contextPath}/guestOrder/check"
					method="post">
					<div class="login-form">
						<input type="text" name="orderId" class="login-input"
							placeholder="주문번호를 입력하세요" required> <input
							type="password" name="orderPassword" class="login-input"
							placeholder="주문 비밀번호를 입력하세요" required>
					</div>
					<small class="login-info-text">조회하실 주문번호와 주문 비밀번호를 입력하세요</small>
					<button type="submit" class="login-button login-btn-nonmember">확인</button>
				</form>
				<c:if test="${not empty guestMsg}">
					<p class="error-msg" style="color: red; text-align: center;">${guestMsg}</p>
				</c:if>
			</div>

			<!-- 간편 로그인 영역 -->
			<div class="login-divider">또는 간편하게 로그인</div>
			<div class="login-sns">
				<button class="sns naver">네이버</button>
				<button class="sns kakao">카카오</button>
				<button class="sns google">구글</button>
				<button class="sns apple">애플</button>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>