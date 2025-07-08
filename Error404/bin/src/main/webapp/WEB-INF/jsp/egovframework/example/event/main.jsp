<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<!-- CSS 경로 변경 (JSP에서는 ContextPath 사용 권장) -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />
<!-- 수정 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/202_eventmain.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="bg-light">
	<!-- 헤더추가 -->
	<%@ include file="/common/header.jsp"%>
<!-- 전체 감싸는 div -->
  <div class="event-wrapper">

    <!-- 📢 메인 배너 -->
    <section class="event-banner">
      <div class="banner-text">
        <h2>Annyeong? KOREAN!</h2>
        <p>교재 외국어 / 외서</p>
      </div>
    </section>
 
	<!-- 🔍 검색 및 정렬 -->
	<section class="event-search-bar">
	  <form action="eventSearch.do" method="get" class="search-form">
	    <input type="text" name="keyword" placeholder="이벤트명, 상품명으로 검색해 보세요." />
	    <button type="submit"><i class="bi bi-search"></i></button>
	  </form>
	</section>

    <!-- 🗂 카테고리 바로가기 -->
    <nav class="event-categories">
      <ul>
        <li><a href="#">주제 추천</a></li>
        <li><a href="#">초특가 도서</a></li>
        <li><a href="#">사은품</a></li>
        <li><a href="#">단독 도서</a></li>
        <li><a href="#">기간 한정 이벤트</a></li>
        <li><a href="#">이달의 혜택모음</a></li>
      </ul>
    </nav>
    
<!-- 슬라이드 + 추천을 감싸는 래퍼 -->
<div class="event-swiper-section">

  <!-- 왼쪽: 스와이프 슬라이드 -->
  <section class="mt1 event-swiper-wrapper">
    <div class="swiper eventSwiper">
      <div class="swiper-wrapper">

        <!-- 슬라이드 1 -->
        <div class="swiper-slide">
          <div class="event-slide">
            <div class="slide-banner">
              <div class="banner-label">종이책</div>
              <h3>네 번째 전설의 등장!<br>이지은 작가 '첫 호러' 그림책</h3>
              <p>먹어 보면 알지 교보단독 쿨매트 사은품</p>
              <div class="slide-images">
                <img src="../images/event-mat.png" alt="매트">
                <img src="../images/event-book.png" alt="책">
              </div>
            </div>
          </div>
        </div>
        <!-- 슬라이드 2 -->
        <div class="swiper-slide">
          <div class="event-slide">
            <div class="slide-banner">
              <div class="banner-label">추천이벤트</div>
              <h3>여름방학 추천 도서<br>아이와 함께 읽어요</h3>
              <p>구매 시 시원한 손선풍기 증정</p>
              <div class="slide-images">
                <img src="../images/event-fan.png" alt="선풍기">
                <img src="../images/event-kidbook.png" alt="어린이책">
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 네비게이션 & 페이지네이션 -->
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-pagination"></div>
    </div>
  </section>
  <!-- 오른쪽: 추천 고정 div -->
  <div class="mt1 slide-recommend">
    <h4 class="tcenter"><i class="bi bi-hand-thumbs-up-fill"></i> 추천</h4>
    <ul>
      <li>상반기 결산 북로그</li>
      <li>독서는 여름이 제철 🍉</li>
      <li>7월에 함께 읽어요</li>
      <li>스테디셀러 81권</li>
      <li>세계 문구 여행 🧳</li>
      <li><어떤> 3호. 모험 ⛰️</li>
      <li>읽는사람의 카탈로그</li>
      <li>초중고 여름방학</li>
      <li>읽는 자에게만 허락된 곳</li>
      <li>여름방학에 해야할 것들</li>
    </ul>
  </div>
 </div>
</div> <!-- .event-wrapper -->

	<!-- 푸터 추가 -->
	<%@ include file="/common/footer.jsp"%>
	<!-- 스크립트 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script defer src="${pageContext.request.contextPath}/js/202_eventmain.js"></script>
	<script defer src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</body>
</html>