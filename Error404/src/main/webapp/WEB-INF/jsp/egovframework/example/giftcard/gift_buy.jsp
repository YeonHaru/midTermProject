<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>기프트카드 구매</title>
<link rel="stylesheet" href="/css/00_style.css" />
<link rel="stylesheet" href="/css/406_gift_buy.css" />
<link rel="stylesheet" href="/css/02_header.css" />
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<section class="gift-select-container">
		<div class="gift-select-header">
			<div class="select-left">
				<input type="checkbox" id="selectAll" /> <label for="selectAll">전체선택</label>
			</div>

			<div class="sort-dropdown">
				<label for="sort"></label> <select id="sort">
					<option value="new">최신순</option>
					<option value="sales">판매량순</option>
					<option value="high">높은가격순</option>
					<option value="low">낮은가격순</option>
				</select>
			</div>
		</div>
		<c:forEach var="data" items="${giftBuys}">
			<form method="POST" action="/gift/buySubmit.do">
				<div class="gift-item">
					<div class="gift-left">
						<input type="checkbox" class="gift-checkbox" /> <img
							src="<c:out value='${data.photo}'/>" alt="기프트 이미지"
							class="gift-image" /> <input type="hidden" name="photo"
							value="${data.photo}" />
					</div>
					<div class="gift-right">
						<div class="gift-info">
							<p class="gift-title">
								<c:out value="${data.name}" />
								<input type="hidden" name="name" value="${data.name}" />
							</p>
							<p class="gift-price">
								<c:out value="${data.money}" />
								<input type="hidden" name="money" value="${data.money}" />
							</p>
							<button type="button" class="wishlist-btn">🤍</button>
						</div>
						<button class="buy-btn"
							onclick="window.open('/giftBuy/popup.do?gno=${data.gno}', 'giftPopup', 'width=500,height=600')">
							구매하기</button>
					</div>
				</div>
			</form>
		</c:forEach>

	</section>
	<!-- 찜 저장 -->
	<script>
      document.addEventListener("DOMContentLoaded", function () {
        const wishlistButtons = document.querySelectorAll(".wishlist-btn");

        wishlistButtons.forEach((btn) => {
          btn.addEventListener("click", function () {
            if (btn.textContent === "🤍") {
              btn.textContent = "❤️";
            } else {
              btn.textContent = "🤍";
            }
          });
        });
      });
    </script>
	<!-- 전체 선택 박스 -->
	<script>
      document.addEventListener("DOMContentLoaded", () => {
        const selectAll = document.getElementById("selectAll");
        const checkboxes = document.querySelectorAll(".gift-checkbox");

        selectAll.addEventListener("change", () => {
          checkboxes.forEach((chk) => {
            chk.checked = selectAll.checked;
          });
        });
      });
    </script>

	<script>
  function openGiftPopup(gno) {
    const url = `/giftBuy/popup.do?gno=` + gno;
    const width = 400;
    const height = 500;
    const left = (screen.width - width) / 2;
    const top = (screen.height - height) / 2;
    window.open(url, 'giftPopup', `width=${width},height=${height},left=${left},top=${top}`);
  }
</script>

</body>
</html>
