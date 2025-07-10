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
	href="${pageContext.request.contextPath}/css/200_gradesales.css" />
<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<!-- 헤더 -->
<%
request.setAttribute("hideSearch", true);
%><!-- 7월10일 이 문구는 특정페이지에서 검색창이 숨겨지는 기능을 구현 -->
<jsp:include page="/common/header.jsp" />
<body class="bg">
	<div class="page mt3 bg">
	<h3>회원등급별 혜택 안내</h3>
		<div class="tempbox tcenter small">
			<table class="table">
				<thead>
					<tr>
						<th>등급안내</th>
						<th title="직전 3개월간 30만원 이상 구매한 회원">💎 플래티넘<br>
						<small>Platinum</small></th>
						<th title="직전 3개월간 20만원 이상 구매한 회원">🔶 골드<br>
						<small>Gold</small></th>
						<th title="북클럽 가입 회원">🟢 일반<br>
						<small>General</small></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>등급조건</th>
						<td>3개월간 30만원 이상 구매</td>
						<td>3개월간 20만원 이상 구매</td>
						<td>북클럽 가입</td>
					</tr>
					<tr>
						<th>매장 적립혜택</th>
						<td title="도서 3%, 문구/음반/디지털 1% + 추가 5%">도서 3%<br>문구 1%<br>+추가
							5%
						</td>
						<td title="도서 3%, 문구/음반/디지털 1% + 추가 4%">도서 3%<br>문구 1%<br>+추가
							4%
						</td>
						<td title="도서 1%, 문구/음반/디지털 1%">도서 1%<br>문구 1%
						</td>
					</tr>
					<tr>
						<th>온라인 적립혜택</th>
						<td>상품별 적립률<br> <small>도서/문구/클래스</small><br> 10만원
							이상 구매 시<br>
						<strong>5,000P</strong><br> 5만원 이상 구매 시<br>
						<strong>2,000P</strong>
						</td>
						<td>상품별 적립률<br> <small>도서/문구/클래스</small><br> 5만원 이상
							구매 시<br>
						<strong>2,000P</strong>
						</td>
						<td>신규가입 시 <strong>1,000P</strong><br> 5만원 이상 구매 시<br>
						<strong>100P</strong>
						</td>
					</tr>
					<tr>
						<th>온라인 추가혜택</th>
						<td>7만원 이상 구매 시<br>도서교환권 3,500원 x2<br>
						<small>YP Books</small><br> <strong>무료배송</strong>
						</td>
						<td>6만원 이상 구매 시<br>도서교환권 2,500원 x2<br>
						<small>YP Books</small><br> <strong>무료배송</strong>
						</td>
						<td>5만원 이상 구매 시<br>도서교환권 1,500원 x2<br>
						<small>YP Books</small><br> 3만원 이상 구매 시<br>도서교환권 1,500원
							x1<br> 1만원 이상 구매 시<br>
						<strong>무료배송</strong>
						</td>
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
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!-- footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>