<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<!-- 헤더 -->
<%
request.setAttribute("hideSearch", true);
%><!-- 7월10일 이 문구는 특정페이지에서 검색창이 숨겨지는 기능을 구현header -->
<%
  request.setAttribute("hideFooter", true);
%><!-- 7월10일 이 문구는 특정페이지에서 북클립이 숨겨지는 기능을 구현footer -->
<body>
<div class="container py-5">
  <div class="text-center mb-4">
    <h2 class="fw-bold">🎉 주문이 완료되었습니다!</h2>
    <p class="text-muted">고객님의 주문이 정상적으로 접수되었습니다.</p>
    <p class="text-muted">주문내역은 <strong>마이페이지 > 주문내역</strong>에서 확인하실 수 있습니다.</p>
  </div>

  <!-- 주문 요약 테이블 -->
  <div class="table-responsive mb-4">
    <table class="table table-bordered align-middle text-center">
      <thead class="table-light">
        <tr>
          <th>도서명</th>
          <th>수량</th>
          <th>가격</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${order.items}">
          <tr>
            <td>${item.book.title}</td>
            <td>${item.qty}권</td>
            <td>
              <fmt:formatNumber value="${item.book.dprice * item.qty}" pattern="#,###" />원
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- 주문번호 및 총 결제금액 -->
  <div class="mb-4">
    <p><strong>주문번호:</strong> ${order.ono}</p>
    <p><strong>총 결제 금액:</strong> <fmt:formatNumber value="${order.total}" pattern="#,###" />원</p>
  </div>

  <!-- 버튼 영역 -->
  <div class="d-flex justify-content-center gap-3">
    <a href="${pageContext.request.contextPath}/home.do" class="btn btn-primary">메인으로 돌아가기</a>
    <a href="${pageContext.request.contextPath}/mypage.do" class="btn btn-outline-secondary">주문내역 보기</a>
  </div>
</div>

<!-- footer -->
	<jsp:include page="/common/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>