<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 부트스트랩 CSS -->
<!-- 부트스트랩 5.2.3 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- 부트스트랩 아이콘 CDN (head 태그 안에 넣어야 함) -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="icon" type="image/png"
	href="<c:url value='/images/favicon.png'/>">
<!-- 상단 이벤트 배너 -->
<nav class="navbar navbar-expand-lg custom-navbar"

     style="background-color: var(--bg-color);">
  <div class="top-banner w-100 d-flex flex-column align-items-center py-2">
    <div style="color: var(--text-sub); font-size: 0.8125rem;">
      <a href="${pageContext.request.contextPath}/home.do"
         class="d-inline-flex align-items-center"
         style="color: var(--text-sub); text-decoration: none; font-weight: bold;">
         
        <img src="${pageContext.request.contextPath}/images/logo_2.png"
             alt="Blueming Page 로고"
             style="height: 70px; width: auto; margin-right: 0.5rem; vertical-align: middle;">
        <h2>BLUEMING PAGE</h2>
      </a>
    </div>
  </div>

</nav>



<!-- 부트스트랩 네비게이션 바 -->
<nav class="navbar navbar-expand-lg custom-navbar bg-light ">
	<div class="page">
		<div class="container-fluid">



			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- 메뉴 콘텐츠 -->
			<div class="collapse navbar-collapse" id="navbarContent">

				<!-- 왼쪽 네비게이션 -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="/home.do">홈</a></li>

					<!-- 국내도서 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="domesticMenu"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							국내도서 </a>
						<ul class="dropdown-menu" aria-labelledby="domesticMenu">
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=fiction">소설</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=fantasy">판타지</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=essay">에세이</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=self">자기계발</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=science">과학</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=history">역사</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=philosophy">철학</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=art">예술</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=travel">여행</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=children">아동/청소년</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=cooking">요리</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=business">경제/경영</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=religion">종교</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=health">건강</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=computer">컴퓨터/IT</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=education">교육</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=comics">만화/웹툰</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=kor&category=poetry">시/산문</a></li>
						</ul></li>

					<!-- 외국도서 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="foreignMenu"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							외국도서 </a>
						<ul class="dropdown-menu" aria-labelledby="foreignMenu">
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=fiction">소설</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=fantasy">판타지</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=essay">에세이</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=self">자기계발</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=science">과학</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=history">역사</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=philosophy">철학</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=art">예술</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=travel">여행</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=children">아동/청소년</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=cooking">요리</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=business">경제/경영</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=religion">종교</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=health">건강</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=computer">컴퓨터/IT</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=education">교육</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=comics">만화/웹툰</a></li>
							<li><a class="dropdown-item"
								href="/book.do?nat=for&category=poetry">시/산문</a></li>
						</ul></li>


					<!-- 이벤트 -->
					<li class="nav-item"><a class="nav-link" href="/eventmain.do">이벤트</a></li>
				</ul>
				<ul class="navbar-nav mb-2 mb-lg-0">


					<c:choose>
						<c:when test="${not empty sessionScope.loginUser}">

							<li class="nav-item"><span class="nav-link">환영합니다,
									${sessionScope.loginUser.userid}님</span></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/cart.do">장바구니</a></li>
						</c:when>
						<c:otherwise>

							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/login.do">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
						</c:otherwise>
					</c:choose>



					<!-- <li class="nav-item"><a class="nav-link" href="/cart.do">장바구니</a></li> -->
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/mapview.do">매장안내</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<!-- 7월10일 특정 페이지에는 검색창이 안보이게 숨기기 -->
<%
boolean hideSearch = Boolean.TRUE.equals(request.getAttribute("hideSearch"));
%>
<%
if (!hideSearch) {
%>
<!-- 7월9일 헤더 건든거 : 덕규 -->
<nav class="navbar navbar-expand-lg custom-navbar bg-light">
	<div class="container">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/book.do" method="get"
			class="mx-auto w-100" style="max-width: 500px;">

			<div
				class="input-group shadow-sm rounded-pill border overflow-visible">

				<!-- ▼ 드롭다운 -->
				<div class="dropdown custom-dropdown">
					<button id="searchTypeBtn"
						class="btn btn-light dropdown-toggle px-3 border-0" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">통합검색</button>
					<ul class="dropdown-menu">
						<!-- a태그 필요없어서 버튼타입으로 바꿈 -->
						<li><button type="button"
								class="dropdown-item search-type-option" data-type="all">전체검색</button></li>
						<li><button type="button"
								class="dropdown-item search-type-option" data-type="title">도서검색</button></li>
						<li><button type="button"
								class="dropdown-item search-type-option" data-type="author">저자검색</button></li>
					</ul>
				</div>

				<!-- 사용자 검색어 입력창 -->
				<input type="search" id="searchInput" name="searchKeyword"
					class="form-control border-0 px-3"
					placeholder="도서 및 저자를 검색하세요" aria-label="Search" />

				<!-- 드롭다운 선택용 숨겨진 검색 타입 -->
				<input type="hidden" name="searchCondition"
					id="searchConditionInput" value="all" />

				<!-- ▼ 검색 버튼 -->
				<button class="searchicon btn" id="searchBtn" type="submit">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
	</div>
</nav>
<%
}
%>
<!-- 여기까지 : 덕규 7월10일-->

<!-- 이걸해볼거임 -->

<!-- 여기는 건들지 마시오 -->
<!-- 부트스트랩 관련 링크들 -->
<!-- 반드시 있어야 함 -->






