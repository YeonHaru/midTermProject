<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 공통 CSS : 타이틀 밑에 CSS추가하기(밑에 예시는 공통css, header.css, footder.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_header.css" />
<title>도서 상세</title>


<link rel="stylesheet"

   href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/css/book_all.css" />

<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
<%-- 디버깅용 --%>
<%
  String uid = (String) session.getAttribute("userId");
  System.out.println("✅ book_all.jsp session userId = " + uid);
%>

	<%
	request.setAttribute("hideFooter", true);
	%><!-- 7월10일 이 문구는 특정페이지에서 북클립이 숨겨지는 기능을 구현footer -->
	<jsp:include page="/common/header.jsp" />
	<div class="page mt5">
	<form id="listForm" name="listForm" method="get">
	<!-- 컨트롤러로 보낼 페이지번호(승화 수정) -->
     <input type="hidden" id="pageIndex" name="pageIndex" value="${param.pageIndex != null ? param.pageIndex : 1}" />

    <!-- 필터(검색조건) 유지용 히든(승화 수정) -->
    <input type="hidden" id="nat" name="nat" value="${param.nat}" />
    <input type="hidden" id="category" name="category" value="${param.category}" />
    <input type="hidden" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}" />
    <input type="hidden" id="searchCondition" name="searchCondition" value="${param.searchCondition}" />
	
		<!-- 메뉴 시작 -->


		<main class="main-container">
			<!-- 사이드바 (태블릿 이상에서만 보임) -->
			<aside class="sidebar">
				<h2>베스트셀러</h2>
				<h3>종합 베스트</h3>
				<ul>
					<li>주간</li>
					<li>월간</li>
					<li>연간</li>
				</ul>
				<h3>온라인 베스트</h3>
				<ul>
					<li>일간</li>
					<li>주간</li>
					<li>월간</li>
				</ul>
			</aside>

			<!-- 책 상품 리스트 -->
			<section class="book-list">
				<c:forEach var="book" items="${books}">
					<div class="book-item">
						<div class="book-list-image">
							<a
								href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}">
								<img src="<c:out value="${book.downloadUrl}"></c:out>"
								alt="책 이미지" />
							</a>
						</div>
						<div class="book-right">
							<div class="book-info">
							  <a href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}" class="book-title-link">
								<h4 class="book-title">${book.title}</h4>
								</a>
								<p class="book-desc">지은이 : ${book.author}, 출판사 :
									${book.publisher}</p>
								<div class="delivery-date">배송: 내일 도착</div>
								<br />
								<p>
									할인가
									<fmt:formatNumber value="${book.dprice}" type="number"
										pattern="#,###" />
									원
									<del>
										<fmt:formatNumber value="${book.fprice}" type="number"
											pattern="#,###" />
										원
									</del>
								</p>
							</div>
							<div class="button-group mt2">
								<button type="button" class="btn-add-cart" data-bno="${book.bno}">장바구니</button>
								<button type="button" class="btn-buy-now" data-bno="${book.bno}">바로구매</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</section>

		</main>
		<!-- 페이지 번호 -->
          <div class="flex-center">
            <ul class="pagination" id="pagination"></ul>
          </div>
          
	</form>
	</div>
	<!-- 바로구매 전송용 form -->
<form id="buyNowForm" method="post" action="${pageContext.request.contextPath}/order/buyNowForm.do">
  <input type="hidden" name="dnoList" />
  <input type="hidden" name="qtyList" value="1" />
</form>


	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 외부 JS 라이브러리 : jquery 쓸때 필요한 라이브러리 밑 스와이프 기능들 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
		 <!-- 페이징 라이브러리 -->
    <script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
    
    <!-- 바로구매  -->
<script>
document.addEventListener("DOMContentLoaded", function () {
  const contextPath = '${pageContext.request.contextPath}';
  console.log("📍 contextPath =", contextPath);

  const buyNowButtons = document.querySelectorAll(".btn-buy-now");
  buyNowButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      const bno = btn.dataset.bno;
      const form = document.getElementById("buyNowForm");
      form.querySelector("input[name='dnoList']").value = bno;
      form.querySelector("input[name='qtyList']").value = 1;
      form.submit();
    });
  });

  $('.btn-add-cart').on('click', function () {
    const bno = $(this).data('bno');

    $.ajax({
      url: contextPath + '/cart/add.do',
      type: 'POST',
      data: {
        bno: bno,
        quantity: 1
      },
      success: function (result) {
        console.log('🧪 서버 응답값:', result);
        if (result === 'success') {
          alert('✅ 장바구니에 추가되었습니다.');
          window.open(contextPath + "/cart.do?popup=true", "fullCartPopup", "width=900,height=700,scrollbars=yes,resizable=yes");
        } else if (result === 'login') {
          alert('로그인이 필요합니다.');
          location.href = contextPath + '/login.do';
        } else {
          alert('❌ 장바구니 추가 실패');
        }
      },
      error: function (xhr, status, error) {
        console.error('🚨 Ajax 오류 발생:', status, error);
        alert('🚨 서버 오류 발생!');
      }
    });
  });
});
</script>


		
	<!-- 페이징(려경) -->
		<script type="text/javascript">
		 /* 페이지번호 클릭시 전체조회 */
	      function fn_egov_link_page(pageNo) {
	        /* 현재페이지번호 저장 */
	        $("#pageIndex").val(pageNo);
	        $("#listForm")
	          .attr("action", '<c:out value="/book.do" />')
	          .submit();
	      }
		</script>
		<!-- 페이징(려경) -->
		<script type="text/javascript">
      /* 페이징 처리 */
      $("#pagination").twbsPagination({
        totalPages: "${paginationInfo.totalPageCount}",
        startPage: parseInt("${paginationInfo.currentPageNo}"),
        visiblePages: "${paginationInfo.recordCountPerPage}",
        initiateStartPageClick: false,


     // 아이콘 추가!
     	first: '<i class="bi bi-skip-start-fill"></i>',   // 첫 페이지
        prev: '<i class="bi bi-chevron-left"></i>',
        next: '<i class="bi bi-chevron-right"></i>',
        last: '<i class="bi bi-skip-end-fill"></i>',      // 마지막
        
        onPageClick: function (event, page) {
          fn_egov_link_page(page);
        },
      });
    </script>
    	<!-- 자바스크립트 연결 -->
	<script src="<%=request.getContextPath()%>/js/MenuDt_all.js"></script>
</body>
</html>
