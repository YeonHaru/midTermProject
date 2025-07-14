<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/03_footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/205_orderComplete.css" />
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 헤더 -->
<%
request.setAttribute("hideSearch", true);
%><!-- 7월10일 이 문구는 특정페이지에서 검색창이 숨겨지는 기능을 구현header -->
<%
  request.setAttribute("hideFooter", true);
%><!-- 7월10일 이 문구는 특정페이지에서 북클립이 숨겨지는 기능을 구현footer -->
<body>
<div class="page order-complete-container tcenter">
  <h2 class="mt4">🎉 주문이 완료되었습니다!</h2>
<!-- 추후에 테이블 연동으로 해볼 것 -->  
<div class="order-summary mt4">
    <p><strong>주문번호:</strong> 20250714001</p>
    <p><strong>상품명:</strong> ${book.title}</p>
    <p><strong>결제금액:</strong> <fmt:formatNumber value="${book.dprice * qty}" pattern="#,###" />원</p>
  </div>  
  <p class="mt2">고객님의 주문이 정상적으로 접수되었습니다.</p>
  <p>주문내역은 <strong>마이페이지 > 주문내역</strong>에서 확인하실 수 있습니다.</p>
  <div class="mt3">
     <a href="${pageContext.request.contextPath}/home.do" class="btn-main">메인으로 돌아가기</a>
  	<a href="${pageContext.request.contextPath}/mypage.do#orders" class="btn-sub ml2">주문내역 보기</a>
  </div>
</div>
<!-- footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>