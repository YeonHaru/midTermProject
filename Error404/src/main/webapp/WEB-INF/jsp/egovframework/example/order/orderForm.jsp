<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/204_orderForm.css" />
</head>
<body>
<h2>주문서</h2>

<!-- 도서 정보 표시 -->
<div class="order-book-info">
  <p>도서명: <strong>${book.title}</strong></p>
  <p>수량: ${qty}권</p>
  <p>가격: 
    <fmt:formatNumber value="${book.dprice * qty}" pattern="#,###" />원
  </p>
</div>

<!-- 배송지 입력 -->
<div class="order-shipping-info">
  <h3>배송 정보</h3>
  <form action="${pageContext.request.contextPath}/order/submit.do" method="post">
    <input type="hidden" name="bno" value="${book.bno}" />
    <input type="hidden" name="qty" value="${qty}" />

    <label>이름: <input type="text" name="recipient" value="${user.name}" /></label><br/>
    <label>전화번호: <input type="text" name="phone" value="${user.phone}" /></label><br/>
    <label>주소: <input type="text" name="address" value="${user.address}" /></label><br/>

    <button type="submit" class="btn-submit">결제하기</button>
  </form>
</div>
</body>
</html>