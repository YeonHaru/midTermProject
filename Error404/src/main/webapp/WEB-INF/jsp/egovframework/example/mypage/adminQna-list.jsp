<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>관리자 QnA - 답변 대기 목록</title>
<link rel="stylesheet" href="<c:url value='/css/adminQna-list.css' />" />
</head>
<body>
	<main class="popup-container">
		<h2 class="popup-title">관리자 QnA - 답변 대기 목록</h2>

		<section class="question-list">
			<ul>
				<c:forEach var="inq" items="${inquiries}">
					<li class="question-item">
						<div class="question-title" role="button" tabindex="0" aria-expanded="false">
							<span class="arrow-icon">▶</span>
							<span class="question-text">${inq.questionTitle}</span>
							<span class="question-date">
								<fmt:formatDate value="${inq.createdDate}" pattern="yyyy-MM-dd" />
							</span>
						</div> 
						
						<div class="answer-content" aria-hidden="true">
							<c:out value="${inq.questionContent}" /><br/>
							<c:choose>
								<c:when test="${not empty inq.answerContent and fn:trim(inq.answerContent) ne ''}">
									<c:set var="answerText" value="${inq.answerContent}" />
									<%
									String answer = (String) pageContext.getAttribute("answerText");
									if (answer != null) {
										answer = answer.replaceAll("\\r\\n|\\r|\\n", "<br/>");
									}
									%>
									<%=answer%>
									<br />
									<small>답변일: <fmt:formatDate value="${inq.answerDate}" pattern="yyyy-MM-dd" /></small>
								</c:when>
								<c:otherwise>
									<span class="no-answer">답변이 없습니다.</span>
								</c:otherwise>
							</c:choose>
							<br/>
							<a href="<c:url value='/answerForm?id=${inq.id}' />" class="pink-btn">답변 작성</a>
						</div>
					</li>
				</c:forEach>
				
				<c:if test="${empty inquiries}">
					<li>답변 대기 중인 문의가 없습니다.</li>
				</c:if>
			</ul>
		</section>

		<div class="button-wrap">
			<button onclick="window.close()" class="pink-btn">닫기</button>
		</div>
	</main>

	<script>
    document.addEventListener('DOMContentLoaded', function () {
      const items = document.querySelectorAll('.question-item');

      items.forEach(item => {
        const title = item.querySelector('.question-title');
        const answer = item.querySelector('.answer-content');
        const arrow = item.querySelector('.arrow-icon');

        title.addEventListener('click', () => {
          const expanded = title.getAttribute('aria-expanded') === 'true';
          title.setAttribute('aria-expanded', !expanded);
          answer.classList.toggle('active');
          answer.setAttribute('aria-hidden', expanded);
          arrow.classList.toggle('rotated');
        });
      });
    });
  </script>
</body>
</html>
