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
  	<div class="tempbox mt2">
  	<h3>평점 9.0 이상 FOUND 선정 평점 좋은 책</h3><br>
		<p>구매자들의 공감을 많이 받은 리뷰가 우선 노출된 도서 모음.<br> 높은 평가를 받은 책들을 만나 보세요!</div>

    <!-- 콘텐츠 박스 -->
    <div class="mt2 main-content ">
      <div class="left-box tempbox">1. 컨텐츠</div>
      <div class="center-box tempbox">2. 메인 콘텐츠</div>
      <div class="right-top-box tempbox">3. 컨텐츠</div>
      <div class="right-bottom-box tempbox">4. 컨텐츠</div>
      <div class="bottom-slider tempbox">5. 하단 컨텐츠</div>
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