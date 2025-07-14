<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="order-summary mt4">
  <p><strong>주문번호:</strong> ${ono}</p>
  <p><strong>상품명:</strong> ${book.title}</p>
  <p><strong>결제금액:</strong>
    <fmt:formatNumber value="${book.dprice * qty}" pattern="#,###" />원
  </p>
</div>
</body>
</html>