<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
</head>
<body>
	<div class="page order-summary-container mt4">

		<h2>🎉 주문이 완료되었습니다!</h2>

		<div class="order-summary">
			<p>
				<strong>주문번호:</strong> ${order.ono}
			</p>
			<p>
				<strong>상품명:</strong> ${order.items[0].book.title}
			</p>
			<p>
				<strong>수량:</strong> ${order.items[0].qty}권
			</p>
			<p>
				<strong>결제금액:</strong>
				<fmt:formatNumber value="${order.total}" pattern="#,###" />
				원
			</p>
		</div>

		<div class="ordered-items">
			<h3>📚 주문한 상품</h3>
			<c:forEach var="item" items="${order.items}">
				<div class="item-box mb2">
					<p>
						<strong>도서명:</strong> ${item.book.title}
					</p>
					<p>수량: ${item.qty}권</p>
					<p>
						금액:
						<fmt:formatNumber value="${item.price}" pattern="#,###" />
						원
					</p>
				</div>
			</c:forEach>
		</div>

		<div class="delivery-info mt3">
			<h3>📦 배송 정보</h3>
			<p>
				<strong>수령인:</strong> ${order.recipient}
			</p>
			<p>
				<strong>연락처:</strong> ${order.phone}
			</p>
			<p>
				<strong>주소:</strong> ${order.address}
			</p>
			<p>
				<strong>요청사항:</strong> ${order.memo}
			</p>
			<p>
				<strong>결제수단:</strong>
				<c:choose>
					<c:when test="${order.paymentMethod eq 'card'}">신용카드</c:when>
					<c:when test="${order.paymentMethod eq 'bank'}">무통장입금</c:when>
				</c:choose>
			</p>
		</div>

	</div>
</body>
</html>