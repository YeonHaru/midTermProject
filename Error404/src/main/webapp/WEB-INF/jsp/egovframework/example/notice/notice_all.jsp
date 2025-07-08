<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
	
<!-- jQuery 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 5.2.3 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<form id="listForm" name="listForm" method="get">
	   <!-- 수정페이지 열기때문에 필요 -->
   <input type="hidden" id="noticeId" name="noticeId">
		<!-- 컨트롤러로 보낼 페이지번호 -->
		<input type="hidden" id="pageIndex" name="pageIndex">
		<div class="bg mt3">
			<div class="page">
				<h2 class="tcenter mb3">📢 공지사항</h2>

				<table class="table notice-table">
					  <thead class="table-head">
            <tr>
              <th scope="col"  style="width: 10%;">No</th>
              <th scope="col">공지제목</th>
              <th scope="col" style="width: 15%;">작성자</th>
              <th scope="col" style="width: 20%;">날짜</th>
              <th scope="col" style="width: 10%;" >조회수</th>
            </tr>
          </thead>

					<tbody>
						<c:forEach var="data" items="${noticeList}" varStatus="status">
							<tr>
								<td><c:out value="${data.noticeId}"></c:out></td>
								<td><a href="javascript:fn_select('<c:out value="${data.noticeId}" />')">
										<c:out value="${data.title}" />
								</a></td>
								<td><c:out value="${data.writer}"></c:out></td>
								<td><fmt:formatDate value="${data.createDate}" pattern="yyyy.MM.dd" /></td>
								<td><c:out value="${data.viewCount}"></c:out></td>
							</tr>
						</c:forEach>

						<!-- 공지 없음 처리 -->
						<c:if test="${empty noticeList}">
							<tr>
								<td colspan="10" class="tcenter text-muted">등록된 공지사항이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				
      <!-- 페이징 영역 -->
      <div class="tcenter mt3">
        <ul id="pagination" class="pagination justify-content-center"></ul>
      </div>
			</div>
		</div>
	</form>

<script type="text/javascript">
/* 페이지번호 클릭시 전체조회 */
function fn_egov_link_page(pageNo) {
	/* 현재페이지번호 저장 */
	$("#pageIndex").val(pageNo);
	$("#listForm").attr("action",'<c:out value="/notice/notice.do" />').submit();
}
/* 전체조회 */
function fn_egov_selectList() {
	$("#pageIndex").val(1);																//최초화면에서는 페이지번호 1페이지 지정
	$("#listForm").attr("action",'<c:out value="/notice/notice.do" />').submit();
}
/* 수정페이지 열기 */
function fn_select(noticeId) {

		$("#noticeId").val(noticeId);
/* 수정페이지 url */
		$("#listForm").attr("action",'<c:out value="/notice/detail.do" />').submit();
}
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

<!-- 페이징 라이브러리 -->
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>

<script type="text/javascript">
/* 페이징 처리 */
    $('#pagination').twbsPagination({
        totalPages: "${paginationInfo.totalPageCount}",
        startPage:parseInt("${paginationInfo.currentPageNo}"),
        visiblePages: "${paginationInfo.recordCountPerPage}",
        initiateStartPageClick: false,
        onPageClick: function (event, page) {
            /* 재조회 함수 실행 */
            fn_egov_link_page(page);
        }
    });
    </script>
</body>
</html>