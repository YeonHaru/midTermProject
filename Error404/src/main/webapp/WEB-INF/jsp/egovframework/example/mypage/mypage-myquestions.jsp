<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>나의 질문</title>
<link rel="stylesheet" href="<c:url value='/css/00_style.css' />" />
<link rel="stylesheet" href="<c:url value='/css/503_myquestions.css' />" />
</head>
<body>
	<main class="popup-container">
		<h2 class="popup-title">나의 질문</h2>

		<section class="question-list">
			<ul>
				<c:forEach var="inq" items="${inquiries}">
					<li class="question-item">
						<div class="question-title">
							<span class="arrow-icon">▶</span> <span class="question-text">${inq.title}</span>
							<span class="question-date"> <fmt:formatDate
									value="${inq.requestDate}" pattern="yyyy-MM-dd" />
							</span>
						</div>
						<div class="answer-content">
							<c:out value="${inq.content}" />
							<br /> <br /> <strong>관리자 답변:</strong>
							<c:choose>
								<c:when
									test="${not empty inq.answer and fn:trim(inq.answer) ne ''}">
									<c:out value="${inq.answer}" escapeXml="false" />
									<br />
									<small> 답변일: <fmt:formatDate value="${inq.answerDate}"
											pattern="yyyy-MM-dd" />
									</small>
								</c:when>
								<c:otherwise>
									<span class="no-answer">답변이 없습니다.</span>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>

		<div class="button-wrap">
			<button onclick="window.close()" class="btn pink-btn">닫기</button>
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
          answer.classList.toggle('active');
          arrow.classList.toggle('rotated');
        });
      });
    });
  </script>
</body>
</html>
