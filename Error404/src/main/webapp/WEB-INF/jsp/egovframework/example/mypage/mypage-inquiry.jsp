<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>환불사유</title>
<link rel="stylesheet" href="<c:url value='/css/00_style.css' />" />
<link rel="stylesheet"
	href="<c:url value='/css/501_mypage-inquiry.css' />" />
</head>
<body>
	<div class="inquiry-popup">
		<h2 class="section-title">환불 사유를 선택해주세요</h2>

		<form id="refundForm" method="post"
			action="<c:url value='/refund/submit.do' />">
			<div class="mb3">
				<select id="reasonSelect" name="reason" class="reason-select"
					required>
					<option value="" disabled selected>사유를 선택하세요</option>
					<option value="단순변심">단순변심</option>
					<option value="상품 불량">상품 불량</option>
					<option value="배송 지연">배송 지연</option>
					<option value="오배송">오배송</option>
					<option value="기타">기타</option>
				</select>
			</div>

			<textarea id="inquiryText" name="content"
				placeholder="추가 내용을 입력하세요 (선택 사항)"></textarea>

			<div class="popup-actions tcenter mt3">
				<button type="submit" id="submitBtn" class="btn pink-btn">문의
					제출</button>
			</div>
		</form>
	</div>

	<script>
  document.addEventListener("DOMContentLoaded", function () {
    const reasonSelect = document.getElementById("reasonSelect");
    const textarea = document.getElementById("inquiryText");
    const submitBtn = document.getElementById("submitBtn");
    const form = document.getElementById("refundForm");

    if (reasonSelect && textarea) {
      reasonSelect.addEventListener("change", () => {
        textarea.value = reasonSelect.value;
      });
    }

    if (form) {
      form.addEventListener("submit", function (event) {
        if (!reasonSelect.value) {
          alert("환불 사유를 선택해주세요.");
          reasonSelect.focus();
          event.preventDefault();
        }
      });
    }
  });
  
</script>
<!-- 여기 넣기 -->
	<c:if test="${success != null}">
	  <script>
	    if (${success}) {
	      alert("환불 요청이 정상 접수되었습니다.");
	      window.close();
	    } else {
	      alert("환불 요청 중 오류가 발생했습니다.");
	    }
	  </script>
	</c:if>

</body>
</html>
