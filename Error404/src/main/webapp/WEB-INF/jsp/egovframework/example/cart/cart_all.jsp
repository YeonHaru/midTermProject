<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>장바구니</title>
<!-- 공통 CSS : 타이틀 밑에 CSS추가하기(밑에 예시는 공통css, header.css, footder.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/00_style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/102_cart.css" />
<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>

<jsp:include page="/common/header.jsp" />
<body class="bg">
	<div class="page">
		<h2 class="mt3 mb3 tcenter">장바구니</h2>

		<table class="cart-table">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>상품</th>
					<th>설명</th>
					<th>수량</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cartList}">
					<tr class="cart-item" data-cno="${item.cno}">
						<td><input type="checkbox" class="row-check" /></td>
						<td class="product-info"><img
							src="${pageContext.request.contextPath}/images/default.jpg"
							alt="${item.title}" class="thumb" /></td>
						<td class="desc">
							<p class="title">${item.title}</p>
							<p class="summary">${item.des}</p>
							<p class="meta">${item.author}지음|${item.publisher}</p>
						</td>
						<td><input type="number" value="${item.quantity}" min="1"
							class="qty-input" /></td>
						<td class="item-price" data-price="${item.dprice}"><fmt:formatNumber
								value="${item.dprice * item.quantity}" type="number" />원</td>
						<td>
							<button class="btn-delete">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="cart-summary tcenter">
			<p>
				<strong>총 금액:</strong> <span> <fmt:formatNumber
						value="${totalPrice}" type="number" />원
				</span>
			</p>
			<a href="#" class="btn-checkout mt2">주문하기</a>
		</div>
	</div>


	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 자바스크립트 연결 -->
	<%-- <script src="<%=request.getContextPath()%>/js/MenuDt_all.js"></script> --%>
	<%-- <script src="<%=request.getContextPath()%>/js/101_cart_all.js"></script> --%>
	<script>
		$(document).ready(function() {
			const contextPath = '${pageContext.request.contextPath}';

			// 수량 변경 시 Ajax 호출
			$('.qty-input').on('change', function() {
				const $row = $(this).closest('tr');
				const cno = $row.data('cno'); // <tr data-cno="..."> 있어야 함!
				const newQty = $(this).val();

				$.ajax({
					url : contextPath + '/cart/updateQuantity.do',
					method : 'POST',
					data : {
						cno : cno,
						quantity : newQty
					},
					success : function(response) {
						if (response === 'success') {
							location.reload(); // 새로고침해서 총액 반영
						} else {
							alert('수량 변경 실패');
						}
					},
					error : function() {
						alert('에러 발생!');
					}
				});
			});
		});
	</script>

	<!-- 외부 JS 라이브러리 : jquery 쓸때 필요한 라이브러리 밑 스와이프 기능들 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</body>


</html>
