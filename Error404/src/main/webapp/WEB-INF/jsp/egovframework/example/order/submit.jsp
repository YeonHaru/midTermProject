<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/205_orderComplete.css" />
</head>
<body>
	<div class="order-complete-container">
  <h2>🎉 주문이 접수되었습니다</h2>

  <!-- 주문 정보 요약 -->
  <div class="order-summary mb4">
    <p><strong>주문번호:</strong> ${order.ono}</p>
    <p><strong>총 결제 금액:</strong> <fmt:formatNumber value="${order.total}" pattern="#,###" />원</p>
    <p><strong>결제수단:</strong>
      <c:choose>
        <c:when test="${order.paymentMethod eq 'card'}">신용카드</c:when>
        <c:when test="${order.paymentMethod eq 'bank'}">무통장입금</c:when>
        <c:otherwise>기타</c:otherwise>
      </c:choose>
    </p>
  </div>

  <!-- 주문 상품 리스트 -->
  <div class="ordered-items mb4">
    <h3>📚 주문한 상품</h3>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead class="table-light">
          <tr>
            <th>도서명</th>
            <th>수량</th>
            <th>금액</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${order.items}">
            <tr>
              <td>${item.book.title}</td>
              <td>${item.qty}권</td>
              <td><fmt:formatNumber value="${item.price}" pattern="#,###" />원</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <!-- 배송 정보 테이블 -->
<div class="delivery-info mt4">
  <h3>📦 배송 정보</h3>
  <div class="table-responsive">
    <table class="table table-bordered">
      <tbody>
        <tr>
          <th scope="row">수령인</th>
          <td>${order.recipient}</td>
        </tr>
        <tr>
          <th scope="row">연락처</th>
          <td>${order.phone}</td>
        </tr>
        <tr>
          <th scope="row">주소</th>
          <td>${order.address}</td>
        </tr>
        <tr>
          <th scope="row">요청사항</th>
          <td>${order.memo}</td>
        </tr>
        <tr>
          <th scope="row">결제수단</th>
          <td>
            <c:choose>
              <c:when test="${order.paymentMethod eq 'card'}">신용카드</c:when>
              <c:when test="${order.paymentMethod eq 'bank'}">무통장입금</c:when>
              <c:otherwise>기타</c:otherwise>
            </c:choose>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

  <!-- 버튼 영역 -->
  <div class="d-flex justify-content-center">
    <a href="${pageContext.request.contextPath}/home.do" class="btn-main">메인으로 가기</a>
    <a href="${pageContext.request.contextPath}/mypage.do" class="btn-sub ml2">주문내역 보기</a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>