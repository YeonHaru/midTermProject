<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/204_order_form.css" />
</head>
<%
request.setAttribute("hideFooter", true);
%><!-- 7월10일 이 문구는 특정페이지에서 북클립이 숨겨지는 기능을 구현footer -->
<body>
	<div class="page order-form-container">

		<h2>주문서</h2>

		<!-- 주문상품 정보 -->
		<c:forEach var="book" items="${selectedBooks}" varStatus="status">
			<div class="order-book-info">
				<p>
					도서명: <strong>${book.title}</strong>
				</p>
				<p>수량: ${quantities[status.index]}권</p>
				<p>
					가격:
					<fmt:formatNumber value="${book.dprice * quantities[status.index]}"
						pattern="#,###" />
					원
				</p>
			</div>
		</c:forEach>

		<!-- 주문 요약 -->
		<div class="order-summary tcenter">
			<p>
				총 <strong>${fn:length(selectedBooks)}</strong>권 / 총 결제금액: <strong><fmt:formatNumber
						value="${totalPrice}" pattern="#,###" /></strong>원
			</p>
		</div>

		<!-- 배송지 입력 -->
		<div class="order-shipping-info mt4">
			<h3>배송 정보</h3>
			<form method="post"
				action="${pageContext.request.contextPath}/order/submit.do">

				<!-- 숨겨진 값 -->
				<c:forEach var="book" items="${selectedBooks}" varStatus="status">
					<input type="hidden" name="bnoList" value="${book.bno}" />
					<input type="hidden" name="qtyList"
						value="${quantities[status.index]}" />
				</c:forEach>

				<label>수령인</label> <input type="text" name="recipient"
					placeholder="홍길동" required /> <label>전화번호</label> <input
					type="text" name="phone" placeholder="010-1234-5678" required /> <label>주소</label>
				<input type="text" name="address" placeholder="서울시 강남구 ..." required />

				<label>배송 요청사항</label> <input type="text" name="memo"
					placeholder="문 앞에 놓아주세요" /> <label>결제 수단</label> <select
					name="paymentMethod" required>
					<option value="card">💳 신용카드</option>
					<option value="bank">🏦 무통장 입금</option>
				</select>

				<button type="submit" class="btn-submit">💳 결제하기</button>
			</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>