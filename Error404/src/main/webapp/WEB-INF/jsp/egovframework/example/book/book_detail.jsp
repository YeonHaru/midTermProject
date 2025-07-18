<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${bookImg.title}</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/00_style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/101_book_detail.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
<!-- 여기페이지 전체를 bookdto에서 이미지를 받아야함으로 수정함 7/19일 강대성  -->
	<div class="background pb5 pt5">
		<div class="page">
			<div class="book-detail-container pt5">
				<div class="book-image">
					<c:choose>
						<c:when test="${not empty bookImg.downloadUrl}">
							<img src="${bookImg.downloadUrl}" alt="${bookImg.title}" />
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/images/default.jpg"
								alt="${bookImg.title}" />
						</c:otherwise>
					</c:choose>
				</div>

				<div class="book-info">
					<h1 class="book-title">${bookImg.title}</h1>
					<div class="book-text">
						<p>
							<strong>정가: </strong>
							<fmt:formatNumber value="${bookImg.fprice}" pattern="#,###" />
							원<br /> <strong>판매가: </strong> <span class="price-sale">
								<fmt:formatNumber value="${bookImg.dprice}" pattern="#,###" />
							</span>원<br /> <strong>총 금액: </strong> <span id="totalPrice"> <fmt:formatNumber
									value="${bookImg.dprice}" pattern="#,###" />
							</span>원<br /> <strong>배송: </strong>무료배송<br /> <strong>수령예상일:
							</strong>내일 도착 예정<br />
						</p>
					</div>
					<div class="button-group">
						<!-- 수량 입력창은 버튼 그룹 밖으로 분리 -->
						<form action="${pageContext.request.contextPath}/cart/add.do"
							method="post" class="cart-form">
							<input type="hidden" name="bno" value="${bookImg.bno}" /> <label
								for="quantity">수량:</label> <input type="number"
								class="quantity-input" id="quantity" name="quantity" value="1"
								min="1" />
						</form>

						<!-- 버튼 그룹 : 버튼 4개 모두 균일 크기 -->
						<button type="button" class="btn-cart btn-add-cart"
							data-bno="${bookImg.bno}">
							<small>장바구니</small>
						</button>

						<button class="btn-buy">
							<small>바로구매</small>
						</button>
						<button class="btn-gift">
							<small>선물하기</small>
						</button>
						<button class="btn-save">
							<small>보관함</small>
						</button>
					</div>

				</div>
			</div>

			<section class="book-basic-info">
				<div class="info-item">
					<div class="info-label">기본정보</div>
					<div class="info-text">
						<p>${bookImg.author}</p>
						<p>${bookImg.publisher}</p>
						<p>${bookImg.pubDate}</p>
					</div>
				</div>

				<div class="info-item">
					<div class="info-label">카테고리</div>
					<div class="info-text">
						<p>${bookImg.category}</p>
					</div>
				</div>

				<div class="info-item">
					<div class="info-label">🎁 이벤트</div>
					<div class="info-text">
						<p>이벤트 정보 없음</p>
					</div>
				</div>

				<div class="info-item">
					<div class="info-label">책소개</div>
					<div class="info-text">${bookImg.des}</div>
				</div>

				<div class="info-item">
					<div class="info-label">재고수량</div>
					<div class="info-text">${bookImg.stock}</div>
				</div>

				<div class="info-item">
					<div class="info-label">태그</div>
					<div class="info-text">
						<p>#인기 #추천 #신간</p>
					</div>
				</div>
			</section>

			<%--      <section class="related-books">
        <div class="container">
          <h3 class="section-title">이 상품을 구입하신 분들이 다음 상품도 구입하셨습니다</h3>
          <div class="swiper related-swiper">
            <div class="swiper-wrapper">
              <c:forEach var="related" items="${relatedBooks}">
                <div class="swiper-slide book-slide">
                  <div class="image-box">
                    <img src="${pageContext.request.contextPath}/images/${related.image}" alt="${related.title}" />
                  </div>
                  <p class="book-title">${related.title}</p>
                </div>
              </c:forEach>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </section> --%>

			<!-- 교환 반품 안내 jsp 아직 만들어지지 않음에 따라, 주석으로 막고 section처리 -->
			<%--       <jsp:include page="/WEB-INF/views/common/return_info.jsp" /> --%>
			<section class="return-exchange-info pb5">
				<div class="container">
					<h2 class="info-title">반품/교환안내</h2>
					<div class="info-grid">
						<div class="info-item">
							<div class="label">반품/교환 방법</div>
							<div class="description">
								"나의계정 &gt; 주문조회 &gt; 반품/교환신청", 1:1상담 &gt; 반품/교환 또는
								고객센터(1544-2514)<br /> 판매자 배송상품은 판매자와 반품/교환이 협의된 상품에 한해 가능
							</div>
						</div>

						<div class="info-item">
							<div class="label">반품/교환 가능기간</div>
							<div class="description">
								· 변심반품 수령 후 20일<br /> (단, 중고매장 상품은 7일 / 전자책 단말기 등은 수령 후 7일 이내
								포장 미개봉 시)<br /> · 파본 등 상품결함 시 발견 후 30일 (수령일로부터 3개월 이내)
							</div>
						</div>

						<div class="info-item">
							<div class="label">반품/교환 비용</div>
							<div class="description">
								· 변심 또는 착오 반품 시 고객 반송비 부담<br /> · 해외직배송 도서는 판매가의 20% 취소수수료 부과<br />
								(수입제반비용 + 재고리스크 포함)
							</div>
						</div>

						<div class="info-item">
							<div class="label">반품/교환 불가 사유</div>
							<div class="description">
								· 소비자 과실로 인한 손상 또는 사용한 경우<br /> · 가치 하락 우려 상품 개봉 시<br /> · 디지털
								콘텐츠 다운로드 또는 열람한 경우<br /> · 세트 상품 일부 반품 불가
							</div>
						</div>

						<div class="info-item">
							<div class="label">소비자 피해보상</div>
							<div class="description">
								· 불량, A/S, 환불 등은 소비자분쟁해결기준에 따름<br /> · 환불 지연 시 배상은 전자상거래법 기준 적용
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
	</div>

	<!-- 바로구매 전송용 form (단일 구매) -->
	<form id="buyNowForm" method="post"
		action="${pageContext.request.contextPath}/order/buyNowForm.do">
		<input type="hidden" name="dnoList" /> <input type="hidden"
			name="qtyList" />
	</form>

	<script>
  const contextPath = "${pageContext.request.contextPath}";
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script>
    const relatedSwiper = new Swiper(".related-swiper", {
      slidesPerView: 2,
      spaceBetween: 40,
      loop: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      breakpoints: {
        768: {
          slidesPerView: 4,
        },
      },
    });
  </script>

	<script>
  document.addEventListener('DOMContentLoaded', () => {
    const quantityInput = document.getElementById('quantity');
    const totalPriceSpan = document.getElementById('totalPrice');
    const unitPrice = ${bookImg.dprice}; // 서버에서 dprice를 JS 변수로 넘김

    quantityInput.addEventListener('input', () => {
      const qty = parseInt(quantityInput.value) || 1;
      const total = unitPrice * qty;
      totalPriceSpan.textContent = total.toLocaleString(); // 1,000 단위 쉼표 붙임
    });
  });
</script>

	<!-- 바로구매 -->
	<script>
document.addEventListener("DOMContentLoaded", () => {
  const btnBuy = document.querySelector(".btn-buy");
  const qtyInput = document.querySelector("#quantity"); // 수량 입력칸

  btnBuy?.addEventListener("click", () => {
    const bno = "${bookImg.bno}";
    const qty = qtyInput?.value || 1;

    const form = document.getElementById("buyNowForm");
    form.querySelector("input[name='dnoList']").value = bno;
    form.querySelector("input[name='qtyList']").value = qty;
	    console.log("▶ bno:", bno);
	    console.log("▶ qty:", qty);
    form.submit();
  });
});
</script>
	<!-- jQuery CDN 추가되어야 함 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
  $(document).ready(function () {
    const contextPath = '${pageContext.request.contextPath}';

    $('.btn-add-cart').on('click', function () {
      const bno = $(this).data('bno');
      const qty = $('#quantity').val() || 1;

      $.ajax({
        url: contextPath + '/cart/add.do',
        method: 'POST',
        data: {
          bno: bno,
          quantity: qty
        },
        success: function (result) {
          console.log("🧾 응답:", result);
          if (result.trim() === 'success') {
            alert('✅ 장바구니에 추가되었습니다.');
            window.open(contextPath + "/cart.do?popup=true", "fullCartPopup", "width=900,height=700,scrollbars=yes,resizable=yes");
          } else if (result.trim() === 'login') {
            alert('🔒 로그인 후 이용해주세요.');
            window.location.href = contextPath + '/login.do';
          } else {
            alert('❌ 장바구니 추가 실패!');
          }
        },
        error: function (xhr, status, error) {
          console.error("🚨 Ajax 오류:", error);
          alert('🚨 서버 오류 발생!');
        }
      });
    });
  });
</script>

</body>
</html>
