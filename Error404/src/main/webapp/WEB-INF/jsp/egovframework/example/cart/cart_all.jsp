<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>장바구니</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/102_cart.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<!-- 디버깅용: 서버에서 전달된 값 확인 -->
<p>서버 전달 totalPrice: ${totalPrice}</p>
<jsp:include page="/common/header.jsp" />
<body class="bg">
	<div class="page">
		<h2 class="mt3 mb3 tcenter">장바구니</h2>

		<table class="cart-table">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>상품 이미지</th>
					<th>설명</th>
					<th>수량</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cartList}">
					<tr class="cart-item" data-cno="${item.cno}">
						<td><input type="checkbox" class="row-check" /></td>
						<td>
							<div class="thumb-wrapper">
								<img src="/images/sample.jpg" alt="${item.title}" class="thumb" />
							</div>
						</td>
						<td class="desc">
							<p class="title">${item.title}</p>
							<p class="summary">${item.des}</p>
							<p class="meta">${item.author}지음|${item.publisher}</p>
						</td>
						<td><input type="number" value="${item.quantity}" min="1"
							class="qty-input" /></td>
						<td class="item-price" data-price="${item.dprice}"><fmt:formatNumber
								value="${item.dprice * item.quantity}" type="number" />원</td>
						<td>
							<button class="btn-delete">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="tcenter mb2 mt5">
			<button type="button" class="btn btn-danger btn-delete-selected">삭제</button>
		</div>

		<div class="cart-summary tcenter">
			<p>
				<strong>총 금액:</strong> 
				<fmt:formatNumber
								value="${totalPrice}" type="number" />원
			</p>
			<a href="#" class="btn-checkout mt2">주문하기</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<script>
	const contextPath = '${pageContext.request.contextPath}';

	// 총 금액 계산 및 표시 함수
	function updateTotalPrice() {
		let total = 0;
		$('.cart-item').each(function() {
			const pricePerItem = parseInt($(this).find('.item-price').data('price'), 10) || 0;
			const qty = parseInt($(this).find('.qty-input').val(), 10) || 0;
			total += pricePerItem * qty;
		});
		const formatted = total.toLocaleString();
		$('.cart-summary .total-price').text(`${formatted}원`);
	}

	$(document).ready(function() {
		// 초기 총 금액 계산
		updateTotalPrice();

		// 수량 변경 시 서버 업데이트 + 총 금액 갱신
		$('.qty-input').on('change', function() {
			const $row = $(this).closest('tr');
			const cno = $row.data('cno');
			const newQty = $(this).val();

			$.ajax({
				url: contextPath + '/cart/updateQuantity.do',
				method: 'POST',
				data: { cno: cno, quantity: newQty },
				success: function(response) {
					if (response === 'success') {
						updateTotalPrice();
					} else {
						alert('수량 변경 실패');
					}
				},
				error: function() {
					alert('에러 발생!');
				}
			});
		});

		// 전체 선택 / 해제
		$('#checkAll').on('change', function() {
			const isChecked = $(this).is(':checked');
			$('.row-check').prop('checked', isChecked);
		});

		// 개별 체크박스 상태에 따른 전체 선택 체크박스 상태 변경
		$('.row-check').on('change', function() {
			const allCount = $('.row-check').length;
			const checkedCount = $('.row-check:checked').length;
			$('#checkAll').prop('checked', allCount === checkedCount);
		});

		// 개별 삭제 버튼 클릭 시
		$('.btn-delete').on('click', function() {
			const $row = $(this).closest('tr');
			const cno = $row.data('cno');

			if (!confirm('이 항목을 삭제하시겠습니까?')) return;

			$.ajax({
				url: contextPath + '/cart/deleteOne.do',
				method: 'POST',
				data: { cno: cno },
				success: function(response) {
					if (response === 'success') {
						location.reload();
					} else {
						alert('삭제 실패');
					}
				},
				error: function() {
					alert('에러 발생!');
				}
			});
		});

		// 선택된 항목 일괄 삭제
		$('.btn-delete-selected').on('click', function() {
			const checkedItems = [];
			$('.row-check:checked').each(function() {
				const cno = $(this).closest('tr').data('cno');
				checkedItems.push(cno);
			});

			if (checkedItems.length === 0) {
				alert("삭제할 항목을 선택해주세요!");
				return;
			}

			if (!confirm('선택한 상품을 삭제하시겠습니까?')) return;

			$.ajax({
				url: contextPath + '/cart/deleteChecked.do',
				method: 'POST',
				traditional: true,
				data: { cnos: checkedItems },
				success: function(response) {
					if (response === 'success') {
						location.reload();
					} else {
						alert('삭제 실패');
					}
				},
				error: function() {
					alert('에러 발생!');
				}
			});
		});
	});
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</body>
</html>
