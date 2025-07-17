<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Insert title here</title>
    <style>
      .card:hover {
        transform: scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
      }
    </style>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/400_modal.css" />
    <link rel="stylesheet" href="/css/00_style.css" />
  </head>
  <body>
    <%
	request.setAttribute("hideSearch", true);
	%><!-- 7월10일 이 문구는 특정페이지에서 검색창이 숨겨지는 기능을 구현header -->
	<%
	request.setAttribute("hideFooter", true);
	%><!-- 7월10일 이 문구는 특정페이지에서 북클립이 숨겨지는 기능을 구현footer -->
	<jsp:include page="/common/header.jsp" />
    <div class="container my-5">
      <form id="listForm" name="listForm" method="get">
        <!-- 컨트롤러로 보낼 페이지번호 -->
        <input type="hidden" id="pageIndex" name="pageIndex" />

        <!-- ✅ 제목 영역 -->
        <h4 class="section-title">지금 가장 인기있는 작가&작품</h4>

        <div>
          <!-- 카드 반복: 총 8개 -->
          <!-- 카드 1 ~ 4 (하트 버튼) -->
          <c:forEach var="data" items="${writerinfos}" varStatus="status">
            <div class="col4">
              <!-- 1번 -->

              <div class="card card1 mb2">
                <img
                  src="/images/pink_person.png"
                  class="card-img-top book-img"
                  alt="작가 이미지"
                />
                <div
                  class="card-body d-flex justify-content-between align-items-center"
                >
                  <div class="title-writer-wrapper">
                    <h5 class="card-title mb-1">${data.writer}</h5>
                    <h6 class="card-writer mb-0">${data.prize}</h6>
                  </div>
                  <i
                    class="bi bi-heart-fill heart-icon"
                    style="color: red; cursor: pointer; font-size: 1.5rem"
                  ></i>
                </div>
              </div>

              <!-- 5번 -->
              <!-- 카드 5 -->
              <div class="card card2">
                <img
                  src="${data.bookurl}"
                  class="card-img-top book-img"
                  alt="작품 이미지"
                />
                <div class="card-body">
                  <div
                    class="card-header-info d-flex flex-column align-items-end"
                  >
                    <h5 class="card-title text-start w-100">${data.work}</h5>
                    <h6 class="card-writer">&lt;${data.writer}&gt;</h6>
                  </div>

                  <br />
                  <p class="card-text">
                    ${data.details}
                    <a
                      href="#"
                      data-bs-toggle="modal"
                      data-bs-target="#modalDetail${status.index}"
                      style="color: #ff9aa2"
                      >더보기</a
                    >
                  </p>
                </div>
              </div>

              <!-- 모달 영역 (body 바로 안쪽에 추가) -->
              <div
                class="modal fade"
                id="modalDetail${status.index}"
                tabindex="-1"
                aria-labelledby="modalDetailLabel${status.index}"
                aria-hidden="true"
              >
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5
                        class="modal-title"
                        id="modalDetailLabel${status.index}"
                      >
                        ${data.work}
                      </h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div
                      class="modal-body"
                      style="white-space: pre-line; text-align: center"
                    >
                      ${data.plot}
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                      >
                        닫기
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
          <!-- 페이지 번호 -->
          <div class="flex-center">
            <ul class="pagination" id="pagination"></ul>
          </div>
        </div>
        <!-- 검색박스 -->
        <div class="kyobo-container">
          <h3 class="kyobo-title">궁금한 작가&작품이 있으신가요?</h3>
          <p class="kyobo-subtitle">인물명, 도서 이름을 검색해보세요.</p>
          <div class="kyobo-wrapper">
            <div class="kyobo-search">
              <select
                class="kyobo-select"
                id="searchCondition"
                name="searchCondition"
              >
                <option value="all">전체</option>
                <option value="writer">작가</option>
                <option value="work">작품</option>
              </select>
              <input
                type="text"
                class="kyobo-input"
                id="searchKeyword"
                name="searchKeyword"
                placeholder="인물을 검색해 보세요"
              />
              <button class="kyobo-btn" onclick="fn_egov_selectList()">
                🔍
              </button>
            </div>
          </div>
        </div>
      </form>
      <div
        id="no-result-message"
        style="display: none; text-align: center; color: #888; margin-top: 2rem"
      >
        <p>검색 결과가 없습니다.</p>
      </div>
    </div>

    <script>
      // 하트 아이콘 토글
      document.querySelectorAll(".heart-icon").forEach((icon) => {
        icon.addEventListener("click", () => {
          if (icon.classList.contains("bi-heart-fill")) {
            icon.classList.remove("bi-heart-fill");
            icon.classList.add("bi-heart");
            icon.style.color = "black"; // 빈 하트 색상
          } else {
            icon.classList.remove("bi-heart");
            icon.classList.add("bi-heart-fill");
            icon.style.color = "red"; // 채워진 하트 색상
          }
        });
      });
    </script>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 페이징 라이브러리 -->
    <script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <script type="text/javascript">
      /* 페이지번호 클릭시 전체조회 */
      function fn_egov_link_page(pageNo) {
        /* 현재페이지번호 저장 */
        $("#pageIndex").val(pageNo);
        $("#listForm")
          .attr("action", '<c:out value="/writerinfo/writerinfo.do" />')
          .submit();
      }
      /* 전체조회 */
      function fn_egov_selectList() {
        $("#pageIndex").val(1); //최초화면에서는 페이지번호 1페이지 지정
        $("#listForm")
          .attr("action", '<c:out value="/writerinfo/writerinfo.do" />')
          .submit();
      }
    </script>

    <script type="text/javascript">
      /* 페이징 처리 */
      $("#pagination").twbsPagination({
        totalPages: "${paginationInfo.totalPageCount}",
        startPage: parseInt("${paginationInfo.currentPageNo}"),
        visiblePages: "${paginationInfo.recordCountPerPage}",
        initiateStartPageClick: false,

        first: false, // "처음" 제거
        last: false, // "끝" 제거

        // 아이콘 추가!
        prev: '<i class="bi bi-chevron-left"></i>',
        next: '<i class="bi bi-chevron-right"></i>',

        onPageClick: function (event, page) {
          fn_egov_link_page(page);
        },
      });
    </script>
  </body>
</html>
