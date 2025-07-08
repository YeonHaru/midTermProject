<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 상세</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css" />
  
  <!-- jQuery 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- Bootstrap 5.2.3 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous" />
</head>
<body>

  <div class="container mt-4">
    <h2><c:out value="${noticeVO.title}" /></h2>

    <p><strong>작성자:</strong> <c:out value="${noticeVO.writer}" /></p>
  <p><strong>작성일:</strong> <fmt:formatDate value="${noticeVO.createDate}" pattern="yyyy.MM.dd" /></p>
    <p><strong>조회수:</strong> <c:out value="${noticeVO.viewCount}" /></p>
    
    <hr>

    <!-- 내용 출력: 줄바꿈 처리 -->
    <pre class="mt-3" style="white-space: pre-wrap; font-family: inherit;">
<c:out value="${noticeVO.content}" />
    </pre>

<!-- 🔽 이전글/다음글 버튼 추가 위치 -->
<div class="mt-3">
  <c:if test="${prevNotice != null}">
    <div class="mb-2">
      이전글:
      <a href="/notice/detail.do?noticeId=${prevNotice.noticeId}">
        <c:out value="${prevNotice.title}" />
      </a>
    </div>
  </c:if>

  <c:if test="${nextNotice != null}">
    <div>
      다음글:
      <a href="/notice/detail.do?noticeId=${nextNotice.noticeId}">
        <c:out value="${nextNotice.title}" />
      </a>
    </div>
  </c:if>
</div>

    <a href="/notice.do" class="btn btn-secondary mt-3">목록으로</a>
  </div>
<!-- 페이징 라이브러리 -->
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
</body>
</html>