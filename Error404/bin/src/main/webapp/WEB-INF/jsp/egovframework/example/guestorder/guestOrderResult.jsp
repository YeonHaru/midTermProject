<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>비회원 주문 결과</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/01_login.css">
</head>
<body>
  <div class="login-wrapper">
  <h2 class="login-title">주문 조회 결과</h2>

  <c:if test="${not empty order}">
    <p class="login-info-text">주문번호: ${order.orderId}</p>
    <p class="login-info-text">주문자명: ${order.customerName}</p>
    <p class="login-info-text">상품명: ${order.productName}</p>
    <p class="login-info-text">주문일자: ${order.orderDate}</p>
    <p class="login-info-text">총 결제금액: ${order.totalPrice}원</p>
    <p class="login-info-text">배송지 주소: ${order.address}</p>
    <p class="login-info-text">연락처: ${order.phone}</p>
  </c:if>

  <c:if test="${empty order}">
    <p class="login-info-text" style="color: #e74c3c; font-weight: 600;">주문 내역이 없습니다.</p>
  </c:if>

  <a href="${pageContext.request.contextPath}/login.do" class="login-button">돌아가기</a>
</div>

</body>
</html>
