<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- a태그, c태그 정리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 공통 CSS : 타이틀 밑에 CSS추가하기(밑에 예시는 공통css, header.css, footder.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/401_main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/402_Notice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/403_ikon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/200_temp.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/401_pastmain.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/402_bestSellers.css" />
<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />

</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<jsp:include page="/common/remocon.jsp" />

	<div class="bg page">
		<div class="mainpage-container">
			<!-- 메인 배너 -->
			<div class="main-banner-wrapper">
				<div class="swiper main-banner-swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide main-banner-slide">
							<div class="ebook-main-image"></div>
						</div>
						<div class="swiper-slide main-two-slide">
							<div class="ebook-main-image2"></div>
						</div>
						<div class="swiper-slide main-two-slide">
							<div class="ebook-main-image3"></div>
						</div>
						<div class="swiper-slide main-two-slide">
							<div class="ebook-main-image4"></div>
						</div>
						<div class="swiper-slide main-two-slide">
							<div class="ebook-main-image5"></div>
						</div>
					</div>
				</div>
			</div>

			<!-- 메인배너 우측 사이드 박스 -->
			<div class="mainpage-right">
				<div class="swiper notice-swiper">
					<div class="swiper-wrapper">

						<!-- 예시 상품 1 -->
						<div class="swiper-slide">
							<div class="mainpage-side-box">
								<div class="side-box-badge">오늘만 특가</div>
								<img
									src="${pageContext.request.contextPath}/images/main/school.png"
									alt="사무용품 세트" />
								<div class="mainpage-side-box-content">
									<h5>
										오늘만 특가 <br /> 네오 학용품 세트
									</h5>
									<a href="#" class="bluedelete">오늘만 이 가격 <br /> 13,200원!
									</a>
									<div class="side-box-price"></div>
								</div>
							</div>
						</div>

						<!-- 예시 상품 2 -->
						<div class="swiper-slide">
							<div class="mainpage-side-box">
								<div class="side-box-badge">
									내일까지 <br /> 특가
								</div>
								<img
									src="${pageContext.request.contextPath}/images/main/Eco.image.png"
									alt="에코백" />
								<div class="mainpage-side-box-content">
									<h5>
										내일까지 특가! <br /> Eco 에코백
									</h5>
									<a href="#" class="bluedelete">지금 9,900원! <br /> 내일 자정
										12시까지 특가!
									</a>
									<div class="side-box-price"></div>
								</div>
							</div>
						</div>

						<!-- 예시 상품 3 -->
						<div class="swiper-slide">
							<div class="mainpage-side-box">
								<div class="side-box-badge">한정 수량</div>
								<img
									src="${pageContext.request.contextPath}/images/main/bookmark.image.png"
									alt="책갈피" />
								<div class="mainpage-side-box-content">
									<h5>
										한정 판매 <br /> 우주 책갈피!
									</h5>
									<a href="#" class="bluedelete">지금 한정판매중! <br /> 4개 묶음으로 단돈
										5,500 판매!
									</a>
									<div class="side-box-price"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 아이콘 -->
		<div class="quick-menu">
			<ul class="quick-menu-list">
				<c:forEach var="icon"
					items="${pageContext.request.contextPath}/images/main/">
					<!-- 이 부분은 향후 JSTL 배열 등으로 처리 가능 -->
				</c:forEach>
				<!-- /temp.do 템플릿 양식 예시입니다. 홈 컨트롤러에 임시로 해놨습니다. 템플릿양식으로 연결만 시켜둘게요. -->
				<li><a href="/temp.do"><img
						src="${pageContext.request.contextPath}/images/main/jewelry.svg"
						alt="할인혜택" /><span>할인혜택</span></a></li>
				<li><a href="/todaySpecial.do"><img
						src="${pageContext.request.contextPath}/images/main/sale.svg"
						alt="오늘만특가" /><span>오늘만특가</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/app.svg"
						alt="APP혜택" /><span>APP혜택</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/card.svg"
						alt="기프트카드" /><span>기프트카드</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/book.svg"
						alt="바로출판" /><span>바로출판</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/book of.svg"
						alt="이달의 책" /><span>이달의 책</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/pen.svg"
						alt="손글씨캠페인" /><span>글씨캠페인</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/box.svg"
						alt="사은품" /><span>사은품</span></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/images/main/good1.svg"
						alt="추천" /><span>추천</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/writerinfo/writerinfo.do"><img
						src="${pageContext.request.contextPath}/images/main/Books.svg"
						alt="인물&작품" /><span>인물&작품</span></a></li>
			</ul>
		</div>
		<!-- 위에까지가 미니 아이콘 배너들 -->

		<!--  회원가입유도 배너  -->
		<section class="container mt5 mb5">
			<div
				class="signup-banner tcenter rounded-4 shadow flex items-center p-4">
				<!-- 텍스트와 버튼 -->
				<div class="banner-text">
					<h3 class="mb3">
						🎁 지금 가입하면 <span class="highlight">3,000원 할인</span>!
					</h3>
					<small class="mb4">간편 가입하고, 다양한 혜택과 함께 책을 만나보세요 📚</small>
					<div class="mt4">
						<a href="${pageContext.request.contextPath}/login.do"
							class="btn-signup">회원가입 하러가기</a>
					</div>
				</div>
			</div>
		</section>

		<!-- 신간 도서 섹션 -->
		<section class="book-section new-books mb5">
			<h3>📘 신간 도서</h3>
			<div class="book-list">
				<c:forEach var="book" items="${latestBooks}">
					<div class="book-card">
						<a
							href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}">
							<div class="image-box">
								<img
									src="${pageContext.request.contextPath}/images/401_maincar.jpg"
									alt="${book.title}" />
							</div>
							<p class="title">${book.title}</p>
						</a>
					</div>
				</c:forEach>
			</div>
		</section>




		<div class="pastmain-content">
			<!-- 책과 함께하는 삶 배너 -->
			<section class="pastbanner">
				<h2>책과 함께하는 삶</h2>
				<p>당신만의 책을 만나보세요</p>
			</section>
		</div>


		<!-- 베스트셀러 TOP 10 -->
		<section class="page mt3">
			<h2 class="tcenter mb3">베스트셀러 TOP 10</h2>
			<ul class="best-list">
				<c:forEach var="book" items="${bestSellers}" varStatus="status">
					<li class="best-item"><span class="best-rank">${status.index + 1}</span>
						<span class="best-title">
						<a href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}">
						 ${book.title}
						 </a>
						 <!-- 신규, 순위변동 표시 (예: new, up, down) -->
							<c:if test="${book.newFlag}">
								<span class="best-new">new</span>
							</c:if> <c:if test="${book.rankUp > 0}">
								<span class="best-up">${book.rankUp}</span>
							</c:if> <c:if test="${book.rankDown > 0}">
								<span class="best-down">${book.rankDown}</span>
							</c:if> 
					</span></li>
				</c:forEach>
			</ul>
		</section>

		<div class="pastmain-content mt5 mb5">
			<!-- AI 추천 picks 배너 -->
			<section class="pastbanner">
				<h2>AI 추천 Picks</h2>
				<p>발견의 기쁨을 선물합니다. 취향을 분석해 추천해드릴게요.</p>
			</section>
		</div>

		<!-- 랜덤 도서 섹션 -->
		<section class="book-section new-books mb5">
			<h3>📘 랜덤 픽! 이 책 어때요?</h3>
			<div class="book-list">
				<c:forEach var="book" items="${randomBooks}">
					<div class="book-card">
						<a
							href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}">
							<div class="image-box">
								<img
									src="${pageContext.request.contextPath}/images/401_maincar.jpg"
									alt="${book.title}" />
							</div>
							<p class="title">${book.title}</p>
						</a>
					</div>
				</c:forEach>
			</div>
		</section>

		<div class="pastmain-content">
			<!-- 바로 출판 POD 배너 -->
			<section class="pastbanner">
				<h2>바로 출판 POD</h2>
				<p>사람들이 많이 찾고 있어요.</p>
			</section>
		</div>

		<!-- 플립 도서 섹션 -->
		<section class="book-section new-books mb5">
			<h3>🎁 할인까지 담긴 책 추천</h3>
			<div class="page tcenter mt2">

				<div class="book-list flex wrap mt4">
					<c:forEach var="book" items="${flipBooks}">
						<div class="book-flip-card">
							<div class="flip-inner">

								<!-- 앞면 -->
								<div class="flip-front">
									<div class="image-box">
										<!-- 할인 뱃지: 이미지 오른쪽 상단 -->
										<c:if test="${not empty book.discount}">
											<span class="badge-top">${book.discount}%↓</span>
										</c:if>
										<img
											src="${pageContext.request.contextPath}/images/401_maincar.jpg"
											alt="${book.title}" />
									</div>

									<!-- 책 제목 -->
									<p class="title">${book.title}</p>

									<!-- 할인 가격 강조 표시 -->
									<c:if test="${not empty book.dprice}">
										<p class="price-short text-danger">
											<fmt:formatNumber value="${book.dprice}" type="number" />
											원
										</p>
									</c:if>

								</div>

								<!-- 뒷면 -->
								<div class="flip-back">
									<div class="content-top">
										<p class="title">${book.title}</p>
										<p class="desc">${book.des}</p>
									</div>

									<div class="content-bottom">
										<p class="price">
											<del>
												<fmt:formatNumber value="${book.fprice}" type="number" />
												원
											</del>
											<br /> <strong class="text-danger"><fmt:formatNumber
													value="${book.dprice}" type="number" /> 원</strong>
										</p>

										<!-- 할인율 뱃지 -->
										<c:if test="${not empty book.discount}">
											<span class="discount-badge">${book.discount}% 할인</span>
										</c:if>

										<!-- 버튼 -->
										<a
											href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}"
											class="detail-btn">자세히 보기</a>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>

			</div>

		</section>

	</div>

	<!-- 꼬리말 -->
	<!-- jQuery (최신 안정 버전 하나만) -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- Bootstrap JS (번들 형태, Popper 포함) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script>
  document.querySelectorAll(".book-flip-card").forEach(card => {
    card.addEventListener("click", function () {
      this.querySelector(".flip-inner").classList.toggle("flipped");
    });
  });
</script>

	<!-- Swiper 최신 버전 -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- 커스텀 JS -->
	<script src="${pageContext.request.contextPath}/js/401_main.js"></script>
	<!-- 헤더의 검색창 영역 JS파일 -->
	<script src="${pageContext.request.contextPath}/js/200_search.js"></script>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>