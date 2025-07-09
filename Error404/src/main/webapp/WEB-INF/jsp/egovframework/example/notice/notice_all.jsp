<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/03_footer.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/300_notice.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
  <jsp:include page="/common/header.jsp" />

  <form id="listForm" name="listForm" method="get">
    <input type="hidden" id="noticeId" name="noticeId">
    <input type="hidden" id="pageIndex" name="pageIndex">
    <div class="bg mt3">
      <div class="page">
        <h2 class="tcenter mb3">📢 공지사항</h2>

        <!-- 데스크탑용 테이블 -->
        <table class="table notice-table">
          <thead class="table-head">
            <tr>
              <th>No</th>
              <th>공지제목</th>
              <th>작성자</th>
              <th>날짜</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="data" items="${noticeList}">
              <tr>
                <td><c:out value="${data.noticeId}" /></td>
                <td>
                  <a href="javascript:fn_select('${data.noticeId}')">
                    <c:out value="${data.title}" />
                  </a>
                </td>
                <td><c:out value="${data.writer}" /></td>
                <td>
                  <fmt:formatDate value="${data.createDate}" pattern="yyyy.MM.dd" />
                </td>
                <td><c:out value="${data.viewCount}" /></td>
              </tr>
            </c:forEach>
            <c:if test="${empty noticeList}">
              <tr>
                <td colspan="5" class="tcenter text-muted">등록된 공지사항이 없습니다.</td>
              </tr>
            </c:if>
          </tbody>
        </table>

        <!-- 모바일용 리스트 -->
        <ul class="notice-list">
          <c:forEach var="data" items="${noticeList}">
            <li class="notice-item">
              <a href="javascript:fn_select('${data.noticeId}')">
                <c:out value="${data.title}" />
              </a>
              <div class="notice-meta">
                작성자: <c:out value="${data.writer}" /> | 
                날짜: <fmt:formatDate value="${data.createDate}" pattern="yyyy.MM.dd" />
              </div>
            </li>
          </c:forEach>
          <c:if test="${empty noticeList}">
            <li class="tcenter text-muted">등록된 공지사항이 없습니다.</li>
          </c:if>
        </ul>

        <div class="tcenter mt3">
          <ul id="pagination" class="pagination justify-content-center"></ul>
        </div>
      </div>
    </div>
  </form>

  <script type="text/javascript">
    function fn_egov_link_page(pageNo) {
      $("#pageIndex").val(pageNo);
      $("#listForm").attr("action", '<c:out value="/notice/notice.do" />').submit();
    }
    function fn_select(noticeId) {
      $("#noticeId").val(noticeId);
      $("#listForm").attr("action", '<c:out value="/notice/detail.do" />').submit();
    }
  </script>

  <script src="/js/jquery.twbsPagination.js"></script>
  <script type="text/javascript">
    $('#pagination').twbsPagination({
      totalPages: "${paginationInfo.totalPageCount}",
      startPage: parseInt("${paginationInfo.currentPageNo}"),
      visiblePages: "${paginationInfo.recordCountPerPage}",
      initiateStartPageClick: false,
      onPageClick: function (event, page) {
        fn_egov_link_page(page);
      }
    });
  </script>

  <jsp:include page="/common/footer.jsp" />
</body>
</html>
