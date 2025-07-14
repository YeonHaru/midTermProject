<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/203_today_special.css" />	
</head>
<body>
<div class="special-book-container pt5">
  <div class="special-book-image">
    <img src="${pageContext.request.contextPath}/images/${book.coverImg}" alt="${book.title}" />
  </div>

  <div class="special-book-info">
    <h2 class="special-book-title">${book.title}</h2>
    <div class="special-book-text">
      <p>
        <strong>정가: </strong>
        <fmt:formatNumber value="${book.fprice}" pattern="#,###" />원<br />
        <strong>할인가: </strong>
        <span class="price-sale">
          <fmt:formatNumber value="${book.dprice}" pattern="#,###" />
        </span>원<br />
        <strong>배송: </strong> 무료배송<br />
        <strong>수령예정일: </strong> 내일 도착 예정<br />
      </p>
    </div>

    <div class="special-button-group">
      <form action="${pageContext.request.contextPath}/cart/add.do" method="post" class="cart-form">
        <input type="hidden" name="bno" value="${book.bno}" />
        <label for="quantity">수량:</label>
        <input type="number" class="quantity-input" id="quantity" name="quantity" value="1" min="1" />
      </form>

      <form action="${pageContext.request.contextPath}/cart/add.do" method="post" class="cart-form">
        <input type="hidden" name="bno" value="${book.bno}" />
        <button type="submit" class="btn-cart">
          <small>장바구니</small>
        </button>
      </form>

      <button class="btn-buy"><small>바로구매</small></button>
      <button class="btn-gift"><small>선물하기</small></button>
      <button class="btn-save"><small>보관함</small></button>
    </div>
  </div>
</div>
</body>
</html>