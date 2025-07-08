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

    <form id="inquiryForm" method="post" action="<c:url value='/inquiry/submit' />">
      <input
        type="text"
        name="title"
        id="questionTitle"
        placeholder="문의 제목을 입력하세요"
        autocomplete="off"
      />

      <textarea
        name="content"
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

      alert("문의가 접수되었습니다.");
      // 약간의 딜레이 후 창 닫기 (서버로 데이터 전송되도록)
      setTimeout(() => {
        window.close();
      }, 300);
    });
  </script>
</body>
</html>
