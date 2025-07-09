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
	href="${pageContext.request.contextPath}/css/03_footer.css" />	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/200_temp.css" />	
<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<!-- 헤더 -->
	<jsp:include page="/common/header.jsp" />
<body class="bg">
  <!-- 전체 wrapper -->
  <div class="page mt1 bg ">
  	<div class="tempbox mt2 ">0.제목</div>
    <!-- 콘텐츠 박스 -->
    <div class="mt2 main-content ">
      <div class="left-box tempbox">
		<h5>🎁 나에게 맞는 혜택 찾기</h5>
		<p>원하는 혜택을 선택하면 맞춤 정보를 알려드려요!</p>
		<div class="benefit-buttons">
		  <button>쿠폰이 좋아요</button>
		  <button>포인트 적립 원해요</button>
		  <button>사은품 받고 싶어요</button>
		</div>
</div>
      <div id="carouselExampleControls" class="carousel slide center-box" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/images/204_eventbook01.jpg" class="d-block w-100" alt="1번">
    </div>
    <div class="carousel-item">
      <img src="/images/204_eventbook02.jpg" class="d-block w-100" alt="2번">
    </div>
    <div class="carousel-item">
      <img src="/images/204_eventbook04.jpg" class="d-block w-100" alt="3번">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
      <div class="right-top-box tempbox">
	 <h5>📦 이번달 혜택 요약</h5>
	  <ul class="benefit-list">
	    <li>첫 구매 고객 <strong>무료배송 쿠폰</strong></li>
	    <li>포토리뷰 작성 시 <strong>1,000P</strong></li>
	    <li>3만원 이상 구매 시 <strong>사은품 지급</strong></li>
	  </ul>
</div>
      <div class="right-bottom-box tempbox">
	<h5>🎯 미션형 이벤트</h5>
	  <p class="mission-desc">오늘의 미션: <strong>상품 3개 보기</strong></p>
	  <div class="progress-bar-wrapper">
	    <div class="progress-bar-fill" style="width: 66%;"></div>
	  </div>
	  <p class="progress-text">2 / 3 완료</p>
</div>
      <div class="bottom-slider tempbox">
      <table class="table">
  <thead>
    <tr>
      <th scope="col">등급안내</th>
      <th scope="col">플래티넘</th>
      <th scope="col">골드</th>
      <th scope="col">일반</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">등급조건</th>
      <td>직전 3개월 간 <h6>30만원 이상</h6>구매회원</td>
      <td>직전 3개월 간 <h6>20만원 이상</h6></td>
      <td>북클럽 <h6>가입 회원</h6></td>
    </tr>
    <tr>
      <th scope="row">매장 적립혜택</th>
      <td>추가 할인 <h6>8%</h6></td>
      <td>추가 할인 <h6>5%</h6></td>
      <td>추가 할인 <h6>1%</h6></td>
    </tr>
    <tr>
      <th scope="row">온라인 적립혜택</th>
      <td class="tcenter" colspan="2">5만원 이상 구매 시 <h6>500P 추가적립</h6></td>
      <td>5만원 이상 구매 시 <h6>100P 추가적립</h6></td>
    </tr>
  </tbody>
</table>
      </div>
    </div>

  </div>
<!-- jQuery (최신 안정 버전 하나만) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Bootstrap JS (번들 형태, Popper 포함) -->
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>
  <!-- Swiper 최신 버전 -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- 커스텀 JS -->
<script src="${pageContext.request.contextPath}/js/401_main.js"></script>

<!-- footer -->
<jsp:include page="/common/footer.jsp" />
</body>
</html>