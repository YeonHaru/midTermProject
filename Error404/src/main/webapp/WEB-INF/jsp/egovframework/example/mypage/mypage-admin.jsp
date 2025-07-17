<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <!-- 문의 글 고유 ID -->
      <input type="hidden" name="qnaId" value="${inquiry.qnaId}" />

      <!-- 제목 표시 (읽기 전용) -->
      <div class="question-title" style="cursor: default; justify-content: flex-start;">
        <span class="question-text">${inquiry.title}</span>
      </div>

      <!-- 질문 내용 표시 -->
      <div class="answer-content active" style="display: block; padding-left: 0;">
        <p><strong>질문 내용:</strong> ${inquiry.questionContent}</p>
      </div>

      <!-- 답변 입력 -->
      <label for="answerContent" style="font-weight: 600; margin-top: 1rem; display: block;">
        답변 내용
      </label>
      <textarea id="answerContent" name="answerContent" rows="6"
        style="width: 100%; font-size: 1rem; padding: 0.5rem;" required>${inquiry.answerContent != null ? inquiry.answerContent : ''}</textarea>

      <!-- 답변자 ID: 관리자가 수정하지 못하도록 설정 -->
      <label for="answerUserId" style="margin-top: 0.75rem; display: block;">답변자 ID</label>

      <!-- 실제 서버로 전달될 값 (숨김 처리) -->
      <input type="hidden" id="answerUserId" name="answerUserId" value="${inquiry.answerUserId}" />

      <!-- 관리자에겐 보여주되, 수정은 못 하게 readonly 설정 -->
      <input type="text" value="${inquiry.answerUserId}" readonly
        style="width: 100%; padding: 0.5rem; font-size: 1rem; background-color: #f4f4f4;" />

      <!-- 버튼 영역 -->
      <div class="button-wrap">
        <button type="submit" class="pink-btn mt3">답변 저장</button>
        <button type="button" onclick="history.back()" class="pink-btn mt3"
          style="background-color: #999; margin-left: 1rem;">취소</button>
      </div>
    </form>
  </main>
</body>
</html>
