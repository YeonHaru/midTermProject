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
		<div class="card-list">
			<c:forEach var="book" items="${books}">
				<div class="book-card shadow-sm">
					<div class="book-image">
						<a
							href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}">
							<c:choose>
								<c:when test="${not empty book.downloadUrl}">
									<img src="${book.downloadUrl}" alt="${book.title}" />
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/images/default.jpg"
										alt="기본 이미지" />
								</c:otherwise>
							</c:choose>
						</a>
					</div>

					<div class="book-info">
						<h5 class="book-title">${book.title}</h5>
						<p class="price-original">
							<fmt:formatNumber value="${book.fprice}" pattern="#,###" />
							원
						</p>
						<p class="price-sale">
							<fmt:formatNumber value="${book.dprice}" pattern="#,###" />
							원 <span class="badge bg-danger ms-2">특가</span>
						</p>
						<p class="delivery">🚚 무료배송 · 내일 도착</p>

						<div class="card-actions mt-2">
							<button type="button"
								class="btn btn-outline-primary btn-sm btn-add-cart"
								data-bno="${book.bno}">장바구니</button>
							<form method="post"
								action="${pageContext.request.contextPath}/order/buyNowForm.do"
								class="d-inline">
								<input type="hidden" name="dnoList" value="${book.bno}" /> <input
									type="hidden" name="qtyList" value="1" />
								<button type="submit" class="btn btn-success btn-sm">바로구매</button>
							</form>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>



</body>
<jsp:include page="/common/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- Bootstrap JS (번들 형태, Popper 포함) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script>

<script>
	const contextPath = "${pageContext.request.contextPath}";

	$(document)
			.on(
					'click',
					'.btn-add-cart',
					function() {
						const bno = $(this).data('bno');
						const qty = 1; // 수량 고정값 (필요 시 동적 처리도 가능)

						$
								.ajax({
									url : contextPath + '/cart/add.do',
									method : 'POST',
									data : {
										bno : bno,
										quantity : qty
									},
									success : function(result) {
										console.log("🧾 응답:", result);
										if (result.trim() === 'success') {
											alert('✅ 장바구니에 추가되었습니다.');
											window
													.open(
															contextPath
																	+ "/cart.do?popup=true",
															"fullCartPopup",
															"width=900,height=700,scrollbars=yes,resizable=yes");
										} else if (result.trim() === 'login') {
											alert('🔒 로그인 후 이용해주세요.');
											window.location.href = contextPath
													+ '/login.do';
										} else {
											alert('❌ 장바구니 추가 실패!');
										}
									},
									error : function() {
										alert('🚨 서버 오류 발생!');
									}
								});
					});
</script>


<script>
	function setQtyAndSubmit(bno) {
		const qty = document.getElementById(`qty_${bno}`).value;
		document.getElementById(`buyNowQty_${bno}`).value = qty;
		return true; // submit 진행
	}
</script>
</html>
