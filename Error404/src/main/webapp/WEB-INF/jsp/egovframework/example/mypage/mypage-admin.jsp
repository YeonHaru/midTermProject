<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>답변 작성</title>
  <link rel="stylesheet" href="<c:url value='/css/00_style.css' />" />
  <!-- 메인 CSS만 불러옴, 별도 CSS 추가 안함 -->
</head>
<body>
  <main class="popup-container">
    <h2 class="popup-title">답변 작성</h2>

    <form action="<c:url value='/answerSubmit' />" method="post">
      <input type="hidden" name="qnaId" value="${inquiry.qnaId}" />

      <div class="question-title" style="cursor: default; justify-content: flex-start;">
        <span class="question-text">${inquiry.title}</span>
      </div>

      <div class="answer-content active" style="display: block; padding-left: 0;">
        <p><strong>질문 내용:</strong> ${inquiry.questionContent}</p>
      </div>

      <label for="answerContent" style="font-weight: 600; margin-top: 1rem; display: block;">
        답변 내용
      </label>
      <textarea id="answerContent" name="answerContent" rows="6" style="width: 100%; font-size: 1rem; padding: 0.5rem;"
        required>${inquiry.answerContent != null ? inquiry.answerContent : ''}</textarea>

      <label for="answerUserId" style="margin-top: 0.75rem; display: block;">
        답변자 ID
      </label>
      <input type="text" id="answerUserId" name="answerUserId" value="${inquiry.answerUserId}" required
        style="width: 100%; padding: 0.5rem; font-size: 1rem;" />

      <div class="button-wrap">
        <button type="submit" class="pink-btn mt3">답변 저장</button>
        <button type="button" onclick="history.back()" class="pink-btn mt3" style="background-color: #999; margin-left: 1rem;">
          취소
        </button>
      </div>
    </form>
  </main>
</body>
</html>
