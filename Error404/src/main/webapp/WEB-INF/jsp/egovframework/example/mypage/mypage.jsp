<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>마이페이지</title>
<link rel="stylesheet" href="<c:url value='/css/00_style.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/500_mypage.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/css/304_mypage_Wishlist.css'/>" />
</head>
<body>


	<main class="page">
		<div class="mypage-container">
			<!-- 왼쪽 탭 메뉴 -->
			<nav class="tab-menu" aria-label="마이페이지 메뉴">
				<ul>
					<li style="padding-left: 0;"><a
						href="<c:url value='/home.do' />"
						class="full-link d-flex align-items-center "> <img
							src="${pageContext.request.contextPath}/images/logo_2.png"
							alt="홈" style="width: 3rem; height: 3rem; margin-right: 8px;" />
							<span
							style="font-size: 1rem; font-weight: bold; position: relative; top: -17px; line-height: 1;">BLUEMING
								PAGE</span>
					</a></li>
					<li class="active" data-tab="profile" tabindex="0">내 정보</li>
					<li data-tab="orders" tabindex="0">주문 내역</li>

					<li data-tab="wishlist" tabindex="0">보관함</li>

					<li><a href="<c:url value='/cart.do' />" class="full-link">장바구니</a></li>
					<!-- 7/15일 장바구니 추가 강대성 -->

					<li data-tab="settings" tabindex="0">설정</li>
				</ul>
			</nav>

			<!-- 오른쪽 내정보 콘텐츠 -->
			<section class="tab-content" id="profile">
				<div class="user-summary-box mb4">
					<!-- 프로필 사진 수정 영역 -->
					<!-- 프로필 이미지 경로 조건 설정 -->
					<c:choose>
						<c:when test="${not empty user.profileImagePath}">
							<c:set var="profileImgPath" value="${user.profileImagePath}" />
						</c:when>
						<c:otherwise>
							<!-- 기존: /images/sample2.png -->
							<c:set var="profileImgPath" value="/images/sample2.jpg" />
						</c:otherwise>
					</c:choose>

					<!-- 프로필 사진 업로드 영역 -->
					<div class="profile-photo-box mb4">
						<form id="photoForm" method="post" enctype="multipart/form-data"
							action="<c:url value='/mypage/uploadPhoto.do'/>">

							<div class="profile-photo-preview">
								<img src="<c:url value='${profileImgPath}' />" alt="프로필 사진"
									class="profile-photo-img" />
							</div>

							<input type="file" id="profilePhoto" name="profilePhoto"
								accept="image/*" class="profile-photo-input hidden"
								onchange="document.getElementById('photoForm').submit();" />

							<button type="button" class="btn pink-btn btn-photo-change"
								onclick="document.getElementById('profilePhoto').click();">
								사진 변경</button>
						</form>
					</div>
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
						<span class="icon">🟢</span>
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
							type="date" id="birth"
							value="${fn:substring(user.birthdate, 0, 10)}" disabled />
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

				<c:choose>
					<c:when test="${not empty orders}">
						<ul class="order-list">
							<c:forEach var="order" items="${orders}">
								<li class="order-item">
									<div class="order-info">
										<span class="order-date"><fmt:formatDate
												value="${order.odate}" pattern="yyyy-MM-dd" /></span> <span
											class="order-number">주문번호 ${order.ono}</span>
									</div> <c:forEach var="item" items="${order.items}">
										<c:choose>
											<c:when
												test="${not empty item.bookImg and not empty item.bookImg.downloadUrl}">
												<img src="${item.bookImg.downloadUrl}"
													alt="${item.book.title}" class="order-product-img" />
											</c:when>
											<c:otherwise>
												<img src="<c:url value='/images/sample.jpg' />" alt="기본 이미지"
													class="order-product-img" />
											</c:otherwise>
										</c:choose>

										<!-- 책 제목 추가 -->
										<span class="order-product-name">${item.book.title}</span>

										<div class="order-status">${order.ostatus}</div>

										<div class="order-price">
											₩
											<fmt:formatNumber value="${item.book.dprice * item.qty}"
												pattern="#,###" />
										</div>

										<div class="order-actions">
											<a href="<c:url value='/book/detail.do?bno=${item.book.bno}'/>"
											   class="btn btn-small btn-primary" target="_blank" >상세</a> 
											<a href="#" class="btn btn-small btn-secondary cancel-btn">취소</a>
										</div>
									</c:forEach>
								</li>
							</c:forEach>
						</ul>
					</c:when>
					<c:otherwise>
						<p>주문 내역이 없습니다.</p>
					</c:otherwise>
				</c:choose>



				<!-- 주문내역 아래에 버튼 추가 새창으로 나오게 구현 했습니다. 7/15일 강대성 -->
				<div class="tcenter mt4">
					<a href="javascript:void(0);" class="btn pink-btn"
						onclick="window.open('<c:url value='/refund/list.do' />', 'refundPopup', 'width=800,height=600,scrollbars=yes');">
						환불 요청 내역 보기 </a>
				</div>

			</section>


			<!-- 보관함 (승화) -->
			<section class="tab-content hidden" id="wishlist">
				<h2 class="tcenter mt5">위시리스트</h2>
				<c:choose>
					<%-- 위시리스트가 비어있을 때 --%>
					<c:when test="${empty wishlist}">
						<div class="wishlist-empty">
							<img
								src="${pageContext.request.contextPath}/images/300_wishlist_empty.png"
								alt="위시리스트 비어 있음" class="empty-icon" />
							<p>
								찜한 도서가 없습니다.<br>마음에 드는 책을 담아보세요!
							</p>
							<br> <a href="/book.do" class="btn btn-primary">도서 보러가기</a>
						</div>
					</c:when>

					<%-- 위시리스트가 존재할 때 --%>
					<c:otherwise>
						<ul class="wishlist-list">
							<c:forEach var="book" items="${wishlist}">
								<li class="wishlist-item"><img
									src="${pageContext.request.contextPath}/images/401_maincar.jpg"
									alt="${book.title}" class="wishlist-thumb" />
									<div class="wishlist-info">
										<h3 class="wishlist-title">${book.title}</h3>
										<p class="wishlist-author">${book.author}</p>
										<p class="wishlist-price">
											<fmt:formatNumber value="${book.dprice}" type="currency"
												currencySymbol="₩" />
										</p>
										<div class="wishlist-actions">
											<a
												href="<c:url 
											value='${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}'/>"
												class="btn-small btn-primary">상세보기</a>
											<form method="post"
												action="<c:url value='/wishlist/remove'/>"
												style="display: inline;">
												<input type="hidden" name="bno" value="${book.bno}" />
												<button type="submit" class="btn-small btn-secondary">삭제</button>
											</form>
										</div>
									</div></li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
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

	<!-- 맨 아래 팝업 알림 -->
	<c:if test="${isTempPassword eq true}">
		<script>
    alert("현재 임시 비밀번호를 사용 중입니다.\n마이페이지에서 꼭 비밀번호를 변경해주세요.");
  </script>
	</c:if>

</body>
</html>
