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
	href="${pageContext.request.contextPath}/css/01_main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />
<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="bg">
		<div class="page">
			<main class="main-content">
				<!-- 메인 배너 -->
				<section class="banner">
					<h2>책과 함께하는 삶</h2>
					<p>당신만의 책을 만나보세요</p>
				</section>

				<!-- 신간 도서 섹션 -->
				<section class="book-section new-books">
					<h3>📘 신간 도서</h3>
					<div class="book-list">
						<div class="book-card">
							<div class="image-box">
								<img src="./images/sample.jpg" alt="도서 이미지" />
							</div>
							<p class="title">도서 제목 1</p>
						</div>
						<div class="book-card">
							<div class="image-box">
								<img src="./images/sample2.jpg" alt="도서 이미지" />
							</div>
							<p class="title">도서 제목 1</p>
						</div>
						<div class="book-card">
							<div class="image-box">
								<img src="./images/sample.jpg" alt="도서 이미지" />
							</div>
							<p class="title">도서 제목 1</p>
						</div>
						<div class="book-card">
							<div class="image-box">
								<img src="./images/sample2.jpg" alt="도서 이미지" />
							</div>
							<p class="title">도서 제목 1</p>
						</div>
					</div>

					<section class="page mt3 mb4">
						<h2 class="tcenter mb3">베스트셀러 TOP 10</h2>
						<ul class="best-list">
							<div>
								<li class="best-item"><span class="best-rank">1</span> <span
									class="best-title">심판 <span class="best-new">new</span></span>
								</li>
							</div>

							<div>
								<li class="best-item"><span class="best-rank">2</span> <span
									class="best-title">첫 여름, 완주 <span class="best-up">3</span></span>
								</li>
							</div>

							<div>
								<li class="best-item"><span class="best-rank">3</span> <span
									class="best-title">안녕이라 그랬어</span> <span class="best-title"></span>
								</li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">4</span> <span
									class="best-title">급류<span class="best-new">new</span></span></li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">5</span> <span
									class="best-title">청춘의 독서</span> <span class="best-title"></span>
								</li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">6</span> <span
									class="best-title">검지의 힘</span></li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">7</span> <span
									class="best-title">열혈간호 93 <span class="best-down">1</span></span>
								</li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">8</span> <span
									class="best-title">고래눈이 내리다</span> <span class="best-title"></span>
								</li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">9</span> <span
									class="best-title">광장 이후 (한정판) <span class="best-new">new</span></span>
								</li>
							</div>
							<div>
								<li class="best-item"><span class="best-rank">10</span> <span
									class="best-title">치유의 빛<span class="best-down">2</span></span>
								</li>
							</div>
						</ul>
					</section>
				</section>

				<!--  회원가입유도 배너  -->
				<section class="container mb3">
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
			</main>
		</div>
	</div>



	<!-- 꼬리말 -->
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 외부 JS 라이브러리 : jquery 쓸때 필요한 라이브러리 밑 스와이프 기능들 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>