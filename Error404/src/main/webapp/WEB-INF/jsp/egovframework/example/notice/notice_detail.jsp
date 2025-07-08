<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/301_notice_detail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/03_footer.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
</head>
<body>
  <jsp:include page="/common/header.jsp" />
  <div class="page">
    <div class="container mt-4">
      <div class="notice-detail-container">
        <h3><c:out value="${noticeVO.title}" /></h3>

        <div class="notice-meta">
          <p><strong>작성자:</strong> <c:out value="${noticeVO.writer}" /></p>
          <p><strong>작성일:</strong> <fmt:formatDate value="${noticeVO.createDate}" pattern="yyyy.MM.dd" /></p>
          <p><strong>조회수:</strong> <c:out value="${noticeVO.viewCount}" /></p>
        </div>

        <div class="notice-content">
          <c:out value="${noticeVO.content}" />
        </div>
<br> 
        <div class="notice-nav">
          <c:if test="${prevNotice != null}">
            <div class="mb-2">
              이전글: <a href="/notice/detail.do?noticeId=${prevNotice.noticeId}"><c:out value="${prevNotice.title}" /></a>
            </div>
          </c:if>

          <c:if test="${nextNotice != null}">
            <div>
              다음글: <a href="/notice/detail.do?noticeId=${nextNotice.noticeId}"><c:out value="${nextNotice.title}" /></a>
            </div>
          </c:if>
        </div>

        <a href="/notice.do" class="btn btn-secondary mt-4">목록으로</a>
      </div>
    </div>
  </div>
  <script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
  <jsp:include page="/common/footer.jsp" />
</body>
</html>