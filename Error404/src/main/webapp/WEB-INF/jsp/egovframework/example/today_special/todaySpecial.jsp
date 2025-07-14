<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	href="${pageContext.request.contextPath}/css/02_header.css" />	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/203_today_special.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />		
</head>
<body>
<%
request.setAttribute("hideSearch", true);
%><!-- 7월10일 이 문구는 특정페이지에서 검색창이 숨겨지는 기능을 구현header -->
<%
  request.setAttribute("hideFooter", true);
%><!-- 7월10일 이 문구는 특정페이지에서 북클립이 숨겨지는 기능을 구현footer -->
<jsp:include page="/common/header.jsp" />
<div class="page pt5">
  <c:forEach var="book" items="${books}">
    <div class="special-book-container mb2">
      <div class="special-book-image">
        <c:choose>
          <c:when test="${not empty book.fileUrl}">
            <img src="${pageContext.request.contextPath}${book.fileUrl}" alt="${book.title}" />
          </c:when>
          <c:otherwise>
            <img src="${pageContext.request.contextPath}/images/default.jpg" alt="기본 이미지" />
          </c:otherwise>
        </c:choose>
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
            <input type="number" class="quantity-input tcenter" name="quantity" value="1" min="1" />
          </form>

          <form action="${pageContext.request.contextPath}/cart/add.do" method="post" class="cart-form">
            <input type="hidden" name="bno" value="${book.bno}" />
            <button type="submit" class="btn-cart">
              <small>장바구니</small>
            </button>
          </form>
		  <!-- 바로구매 버튼 -->
			<jsp:include page="/common/buynow.jsp">
			  <jsp:param name="bno" value="${book.bno}" />
			</jsp:include>
        </div>
      </div>
    </div>
  </c:forEach>
</div>


</body>
<jsp:include page="/common/footer.jsp" />
</html>