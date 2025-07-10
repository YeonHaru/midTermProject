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
  <div class="page mt1 bg ">
      <div class="tempbox tcenter small">
      <table class="table">
  <thead>
    <tr>
      <th scope="col">등급안내</th>
      <th scope="col">💎플래티넘</th>
      <th scope="col">🔶골드</th>
      <th scope="col">🟢일반</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">등급조건</th>
		     <td>
			  <span class="tooltip" data-tooltip="가장 높은 혜택을 받을 수 있는 플래티넘 등급입니다.">
			    💎플래티넘
			  </span>
		  </td>
      <td>직전 3개월 간 <strong>20만원 이상</strong></td>
      <td>북클럽 <strong>가입 회원</strong></td>
    </tr>
    <tr>
      <th scope="row">매장 적립혜택</th>
      <td>추가 할인 <strong>8%</strong></td>
      <td>추가 할인 <strong>5%</strong></td>
      <td>추가 할인 <strong>1%</strong></td>
    </tr>
    <tr>
      <th scope="row">온라인 적립혜택</th>
      <td class="tcenter" colspan="2">5만원 이상 구매 시<strong>500P 추가적립</strong></td>
      <td>5만원 이상 구매 시<strong>100P 추가적립</strong></td>
    </tr>
  </tbody>
</table>
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
<!-- footer -->
<jsp:include page="/common/footer.jsp" />
</body>
</html>