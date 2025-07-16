<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 특가</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
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
		<table
			class="table table-bordered table-striped align-middle text-center">
			<thead class="table-light">
				<tr>
					<th>이미지</th>
					<th>제목</th>
					<th>정가</th>
					<th>할인가</th>
					<th>배송</th>
					<th>수령예정일</th>
					<th>수량</th>
					<th>장바구니</th>
					<th>바로구매</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books}">
					<tr>
						<!-- 이미지 -->
						<td><c:choose>
								<c:when test="${not empty book.fileUrl}">
									<img src="${pageContext.request.contextPath}${book.fileUrl}"
										alt="${book.title}" width="80" />
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/images/default.jpg"
										alt="기본 이미지" width="80" />
								</c:otherwise>
							</c:choose></td>

						<!-- 제목 -->
						<td>${book.title}</td>

						<!-- 정가 -->
						<td><fmt:formatNumber value="${book.fprice}" pattern="#,###" />원</td>

						<!-- 할인가 -->
						<td><span class="price-sale"><fmt:formatNumber
									value="${book.dprice}" pattern="#,###" /></span>원</td>

						<!-- 배송 -->
						<td>무료배송</td>

						<!-- 수령예정일 -->
						<td>내일 도착 예정</td>

						<!-- 수량 -->
						<td>
							<form action="${pageContext.request.contextPath}/cart/add.do"
								method="post">
								<input type="hidden" name="bno" value="${book.bno}" /> <input
									type="hidden" name="quantity" value="1" /> <span>1권</span>
						</td>

						<!-- 장바구니 -->
						<td>
							<button type="submit" class="btn btn-outline-primary btn-sm">장바구니</button>
							</form>
						</td>

						<!-- 바로구매 -->
						<td>
							<form method="post"
								action="${pageContext.request.contextPath}/order/buyNowForm.do">
								<input type="hidden" name="dno" value="${book.bno}" /> <input
									type="hidden" name="qty" value="1" />
								<button type="submit" class="btn btn-success btn-sm">바로구매</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



</body>
<jsp:include page="/common/footer.jsp" />
<script>
	function setQtyAndSubmit(bno) {
		const qty = document.getElementById(`qty_${bno}`).value;
		document.getElementById(`buyNowQty_${bno}`).value = qty;
		return true; // submit 진행
	}
</script>
</html>
