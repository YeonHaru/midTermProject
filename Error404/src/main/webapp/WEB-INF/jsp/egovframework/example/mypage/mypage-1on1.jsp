<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>1:1 문의하기</title>
  <link rel="stylesheet" href="<c:url value='/css/00_style.css' />" />
  <link rel="stylesheet" href="<c:url value='/css/502_mypage-1on1.css' />" />
</head>
<body>
  <div class="inquiry-popup">
    <h2 class="section-title">1:1 문의하기</h2>

    <form id="inquiryForm" method="post" action="<c:url value='/inquiry/submit.do' />">
      <input
        type="text"
        name="title"
        id="questionTitle"
        placeholder="문의 제목을 입력하세요"
        autocomplete="off"
      />

      <textarea
        name="questionContent"
        id="questionContent"
        placeholder="문의 내용을 상세히 입력하세요"
      ></textarea>

      <div class="popup-actions">
        <button type="submit" id="submitBtn" class="btn">문의 제출</button>
      </div>
    </form>
  </div>

  <script>
    const inquiryForm = document.getElementById("inquiryForm");
    const questionTitle = document.getElementById("questionTitle");
    const questionContent = document.getElementById("questionContent");

    inquiryForm.addEventListener("submit", function (e) {
      if (!questionTitle.value.trim()) {
        alert("문의 제목을 입력해주세요.");
        questionTitle.focus();
        e.preventDefault();
        return;
      }

      if (!questionContent.value.trim()) {
        alert("문의 내용을 입력해주세요.");
        questionContent.focus();
        e.preventDefault();
        return;
      }

      // alert을 제거하고 백엔드 성공 후 팝업 닫기 유도
    });
  </script>

  <!-- 성공 시 팝업 닫기 -->
  <c:if test="${not empty success}">
    <script>
      alert("문의가 정상 접수되었습니다.");
      window.close();
    </script>
  </c:if>
</body>
</html>
