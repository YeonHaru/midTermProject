<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>마이페이지</title>
<link rel="stylesheet" href="<c:url value='/css/00_style.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/500_mypage.css'/>" />
</head>
<body>
	<main class="page">
		<div class="mypage-container">
			<!-- 왼쪽 탭 메뉴 -->
			<nav class="tab-menu" aria-label="마이페이지 메뉴">
				<ul>
					<li><a href="<c:url value='/home.do' />" class="full-link">홈</a></li>
					<li class="active" data-tab="profile" tabindex="0">내 정보</li>
					<li data-tab="orders" tabindex="0">주문 내역</li>
					<li data-tab="favorites" tabindex="0">관심 목록</li>
					<li data-tab="settings" tabindex="0">설정</li>
				</ul>
			</nav>

			<!-- 오른쪽 내정보 콘텐츠 -->
			<section class="tab-content" id="profile">
				<div class="user-summary-box mb4">
					<div class="user-summary-item">
						<span class="icon">👤</span>
						<div>
							<strong>이름</strong>
							<p>
								<c:out value="${user.name}" />
							</p>
						</div>
					</div>
					<div class="user-summary-item">
						<span class="icon">📧</span>
						<div>
							<strong>이메일</strong>
							<p>
								<c:out value="${user.email}" />
							</p>
						</div>
					</div>
					<div class="user-summary-item">
						<span class="icon">💎</span>
						<div>
							<strong>포인트</strong>
							<p>
								<c:out value="${user.point}" />
								점
							</p>
						</div>
					</div>
					<div class="user-summary-item">
						<span class="icon">🧭</span>
						<div>
							<strong>회원등급</strong>
							<p>
								<c:out value="${user.grade}" />
							</p>
						</div>
					</div>
					<div class="user-summary-item qna">
						<span class="icon">💬</span>
						<div>
							<strong>Q &amp; A</strong>
							<div class="link-inline">
								<span class="inquiry-link-wrap"> <a
									href="javascript:void(0);"
									onclick="window.open('<c:url value='/mypage/1on1Inquiry.do' />', 'inquiryPopup', 'width=460,height=600');">1:1
										문의</a>
								</span> <span class="inquiry-link-wrap ml2"> <a
									href="javascript:void(0);"
									onclick="window.open('<c:url value='/mypage/myQuestions.do' />', 'myQuestionsPopup', 'width=600,height=500');"
									class="inquiry-link myQuestion">나의 질문</a>
								</span>
							</div>
						</div>
					</div>
				</div>

				<!-- 부가 정보 박스 (프로모션 동의 제외) -->
				<div class="additional-info mt4">
					<h3 class="section-title">부가 정보</h3>

					<div class="info-item mb2">
						<label for="gender"><strong>성별:</strong></label> <input
							type="text" id="gender" value="<c:out value='${user.gender}'/>"
							disabled />
					</div>

					<div class="info-item mb2">
						<label for="birth"><strong>생년월일:</strong></label> <input
							type="date" id="birth" value="<c:out value='${user.birthdate}'/>"
							disabled />
					</div>

					<div class="info-item mb2">
						<label for="phone"><strong>휴대전화:</strong></label> <input
							type="tel" id="phone" value="<c:out value='${user.phone}'/>"
							disabled />
					</div>

					<div class="info-item mb3">
						<label for="address"><strong>배송지:</strong></label> <input
							type="text" id="address" value="<c:out value='${user.address}'/>"
							disabled />
					</div>
					<div class="button-wrap tcenter">
						<button id="editBtn" class="btn pink-btn mr2">수정</button>
						<button id="saveBtn" class="btn pink-btn hidden">저장</button>
					</div>
					<!-- 알림 수신 동의 토글박스 -->
					<h3 class="section-title">알림 수신 동의</h3>
					<!-- 텍스트 라벨 묶음 박스 -->

					<div class="notification-agree-box">
						<div class="notification-row">
							<label for="promoAgree" class="notification-label"><strong>프로모션
									정보 수신 동의</strong></label>
							<div class="toggle-switch">
								<input type="checkbox" id="promoAgree" name="promoAgree"
									<c:if test="${user.promoAgree == 'Y'}">checked</c:if> /> <label
									for="promoAgree" class="switch-label"></label> <span
									class="toggle-status"></span>
							</div>
						</div>

						<div class="notification-row">
							<label for="postNotifyAgree" class="notification-label"><strong>게시물
									조치 수신 알림</strong></label>
							<div class="toggle-switch">
								<input type="checkbox" id="postNotifyAgree"
									name="postNotifyAgree"
									<c:if test="${user.postNotifyAgree == 'Y'}">checked</c:if> />
								<label for="postNotifyAgree" class="switch-label"></label> <span
									class="toggle-status"></span>
								<!-- 이 부분 꼭 있어야 해요 -->
							</div>
						</div>
					</div>

				</div>
			</section>

			<!-- 이하 주문 내역, 관심 목록, 설정 섹션 -->
			<section class="tab-content hidden" id="orders">
				<h2>주문 내역</h2>
				<ul class="order-list">
					<li class="order-item">
						<div class="order-info">
							<span class="order-date">2025-06-25</span> <span
								class="order-number">주문번호 0001</span>
						</div>
						<div class="order-product">
							<img src="<c:url value='/images/sample.jpg'/>" alt="상품명 A"
								class="order-product-img" /> <span class="order-product-name">책
								A</span>
						</div>
						<div class="order-status status-delivered">배송완료</div>
						<div class="order-price">₩25,000</div>
						<div class="order-actions">
							<a href="#" class="btn btn-small btn-primary">상세</a> <a href="#"
								class="btn btn-small btn-secondary cancel-btn">취소</a>
						</div>
					</li>
					<li class="order-item">
						<div class="order-info">
							<span class="order-date">2025-06-25</span> <span
								class="order-number">주문번호 0002</span>
						</div>
						<div class="order-product">
							<img src="<c:url value='/images/sample.jpg'/>" alt="상품명 B"
								class="order-product-img" /> <span class="order-product-name">책
								B</span>
						</div>
						<div class="order-status status-shipping">배송중</div>
						<div class="order-price">₩15,000</div>
						<div class="order-actions">
							<a href="#" class="btn btn-small btn-primary">상세</a> <a href="#"
								class="btn btn-small btn-secondary cancel-btn">취소</a>
						</div>
					</li>
					<li class="order-item">
						<div class="order-info">
							<span class="order-date">2025-06-25</span> <span
								class="order-number">주문번호 0001</span>
						</div>
						<div class="order-product">
							<img src="<c:url value='/images/sample.jpg'/>" alt="상품명 C"
								class="order-product-img" /> <span class="order-product-name">책
								C</span>
						</div>
						<div class="order-status status-canceled">배송취소</div>
						<div class="order-price">₩35,000</div>
						<div class="order-actions">
							<a href="#" class="btn btn-small btn-primary">상세</a> <a href="#"
								class="btn btn-small btn-secondary cancel-btn">취소</a>
						</div>
					</li>
				</ul>
			</section>

			<section class="tab-content hidden" id="favorites">
				<h2>관심 목록</h2>
				<ul>
					<li>책 제목 A</li>
					<li>책 제목 B</li>
				</ul>
			</section>

			<section class="tab-content hidden" id="settings">
				<h2 class="section-title">설정</h2>

				<!-- 모바일에서는 아코디언 형태가 편함 -->
				<details open>
					<summary class="set-accordion-header">비밀번호 변경</summary>
					<form id="changePasswordForm" method="post"
						action="<c:url value='/mypage/changePassword.do'/>"
						class="set-form-stack">

						<label for="currentPassword" class="mt3">현재 비밀번호</label> <input
							type="password" id="currentPassword" name="currentPassword"
							required class="mt0" /> <label for="newPassword" class="mt3">새
							비밀번호</label> <input type="password" id="newPassword" name="newPassword"
							required class="mt0" /> <label for="confirmPassword" class="mt3">새
							비밀번호 확인</label> <input type="password" id="confirmPassword"
							name="confirmPassword" required class="mt0" />

						<button type="submit" class="set-btn set-pink-btn mt4">변경하기</button>
					</form>
				</details>

				<details>
					<summary class="set-accordion-header">2단계 인증 설정</summary>
					<label class="set-switch-label mt4"> <input type="checkbox"
						id="twoFactorAuth" /> 2단계 인증 사용
					</label>
				</details>

				<details>
					<summary class="set-accordion-header">최근 로그인 기록</summary>
					<ul class="set-login-history mt3">
						<li>2025-07-01 14:22 - 서울, PC</li>
						<li>2025-06-30 18:11 - 부산, 모바일</li>
					</ul>
				</details>
			</section>
		</div>

		<!-- 푸터 -->
		<footer class="mypage-footer tcenter pt3 pb3">
			<ul class="footer-links">
				<li><a href="<c:url value='/logout.do' />" class="footer-link">로그아웃</a></li>
				<li><a href="#" class="footer-link">고객센터</a></li>
				<li><a href="#" id="btnPcView" class="footer-link">PC 화면보기</a></li>
			</ul>
		</footer>
	</main>

	<script src="<c:url value='/js/500_mypage1.js'/>"></script>
</body>
</html>
