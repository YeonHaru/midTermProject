<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/03_footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/204_order_form.css" />
</head>

<%
request.setAttribute("hideFooter", true);
%>

<body>
<div class="order-form-container">
	<h2>📝 주문서</h2>

	<!-- 주문 상품 정보 -->
	<div class="ordered-items mb4">
		<h3>📚 주문 상품</h3>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead class="table-light">
					<tr>
						<th>도서명</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${selectedBooks}" varStatus="status">
						<tr>
							<td>${book.title}</td>
							<td>${quantities[status.index]}권</td>
							<td><fmt:formatNumber value="${book.dprice * quantities[status.index]}" pattern="#,###" />원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 주문 요약 -->
	<div class="order-summary mb4 text-center">
		<p>
			총 <strong>${totalQuantity}</strong>권 / 총 결제금액: <strong>
				<fmt:formatNumber value="${totalPrice}" pattern="#,###" />
			</strong>원
		</p>
	</div>

	<!-- 회원/비회원 분기 form -->
	<c:choose>
		<c:when test="${not empty userInfo}">
			<form method="post" action="${pageContext.request.contextPath}/order/submit.do">
		</c:when>
		<c:otherwise>
			<form method="post" action="${pageContext.request.contextPath}/guestOrder/submit.do">
		</c:otherwise>
	</c:choose>

		<!-- 숨겨진 데이터 전달 -->
		<c:forEach var="book" items="${selectedBooks}" varStatus="status">
			<c:if test="${not empty book.bno and quantities[status.index] > 0}">
				<input type="hidden" name="dnoList" value="${book.bno}" />
				<input type="hidden" name="qtyList" value="${quantities[status.index]}" />
			</c:if>
		</c:forEach>

		<div class="order-shipping-form mt4">
			<h3>🚚 배송 정보</h3>
			<div class="table-responsive">
				<table class="table table-bordered align-middle">
					<tbody>
						<tr>
							<th scope="row"><label for="recipient">수령인</label></th>
							<td><input type="text" id="recipient" name="recipient"
								class="form-control" placeholder="홍길동" required
								value="${userInfo != null ? userInfo.name : ''}" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="phone">전화번호</label></th>
							<td><input type="text" id="phone" name="phone"
								class="form-control" placeholder="010-1234-5678" required
								value="${userInfo != null ? userInfo.phone : ''}" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="address">주소</label></th>
							<td><input type="text" id="address" name="address"
								class="form-control" placeholder="서울시 강남구 ..." required
								value="${userInfo != null ? userInfo.address : ''}" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="presetMemo">배송 요청사항</label></th>
							<td>
								<select id="presetMemo" class="form-select mb-2">
									<option value="">-- 요청사항 선택 --</option>
									<option value="문 앞에 놓아주세요">문 앞에 놓아주세요</option>
									<option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
									<option value="벨 누르지 말아주세요">벨 누르지 말아주세요</option>
									<option value="배송 전에 연락주세요">배송 전에 연락주세요</option>
								</select>
								<input type="text" id="memo" name="memo" class="form-control"
									placeholder="요청사항을 직접 입력할 수도 있어요" />
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="paymentMethod">결제 수단</label></th>
							<td>
								<select id="paymentMethod" name="paymentMethod" class="form-select" required>
									<option value="card">💳 신용카드</option>
									<option value="bank">🏦 무통장 입금</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="text-center mt3">
			<button type="submit" class="btn-submit">💳 결제하기</button>
		</div>
	</form> <!-- 조건문 밖에 form 닫는 태그 배치 -->

</div>

<jsp:include page="/common/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		// 배송 요청사항 preset 선택 처리
		const presetMemo = document.getElementById("presetMemo");
		const memoInput = document.getElementById("memo");

		if (presetMemo && memoInput) {
			presetMemo.addEventListener("change", function () {
				const selected = this.value;
				if (selected) {
					memoInput.value = selected;
				}
			});
		}

		// 로그인 여부에 따라 form action 경로 변경
		const form = document.querySelector("form");
		const isGuest = ${empty loginUser};  // loginUser 없으면 true

		if (form) {
			if (isGuest) {
				form.action = "${pageContext.request.contextPath}/guestOrder/submit.do";
			} else {
				form.action = "${pageContext.request.contextPath}/order/submit.do";
			}
		}
	});
</script>

</body>
</html>
