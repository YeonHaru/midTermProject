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

${BOOKS}
<!-- 상단 이벤트 배너 -->
<nav class="navbar navbar-expand-lg custom-navbar"
	style="background-color: var(- -bg-color);">
	<div
		class="top-banner w-100 d-flex flex-column align-items-center py-2">
		<!-- 상단 문구 -->
		<div style="color: var(- -text-sub); font-size: 0.8125rem;">
			<!-- small (13px) -->
			여름 책 콘텐츠가 담긴 NOT FOUND 키링 <span
				style="color: var(- -accent-color-1); font-weight: bold;">
				독서는 여름이 제철! 🍇🍒 </span>
		</div>

		<!-- 하단 이벤트 문구 -->
		<div class="mt1"
			style="color: var(- -text-main); font-size: 0.9375rem;">
			💳 삼성카드 결제 시 <strong style="color: var(- -accent-color-1);">최대
				30% 할인</strong> 이벤트 중!
		</div>
	</div>
</nav>


<!-- 부트스트랩 네비게이션 바 -->
<nav class="navbar navbar-expand-lg custom-navbar bg-light ">
	<div class="page">
		<div class="container-fluid">


			<!-- TODO : 모바일 토글 버튼 (해결할 때 까지 막아놓겠음) -->
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
						role="button" data-bs-toggle="dropdown" aria-expanded="false">외국도서</a>
						<ul class="dropdown-menu" aria-labelledby="foreignMenu">
							<li><a class="dropdown-item" href="#">소설</a></li>
							<li><a class="dropdown-item" href="#">에세이</a></li>
						</ul></li>

					<!-- 전자책 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="ebookMenu"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">전자책</a>
						<ul class="dropdown-menu" aria-labelledby="ebookMenu">
							<li><a class="dropdown-item" href="#">소설</a></li>
							<li><a class="dropdown-item" href="#">에세이</a></li>
						</ul></li>

					<!-- 이벤트 -->
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
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
						</c:when>
						<c:otherwise>

							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/login.do">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
						</c:otherwise>
					</c:choose>



					<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/mapview.do">매장안내</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>

<nav class="navbar navbar-expand-lg custom-navbar bg-light">
	<div class="container">
		<form class="mx-auto w-100" role="search"
			action="${pageContext.request.contextPath}/search.do" method="get"
			style="max-width: 500px;">
			<div
				class="input-group shadow-sm rounded-pill border overflow-visible">

				<!-- 통합검색 드롭다운 메뉴 (열리도록) -->
				<div class="  dropdown custom-dropdown">
					<button class="btn btn-light dropdown-toggle px-3 border-0"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						통합검색</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">전체</a></li>
						<li><a class="dropdown-item" href="#">도서</a></li>
						<li><a class="dropdown-item" href="#">저자</a></li>
					</ul>
				</div>

				<!-- 검색 입력창 -->
				<input type="search" class="form-control border-0 px-3"
					placeholder="404 NOT FOUND? WHY?" aria-label="Search" name="query">

				<!-- 검색 버튼 (돋보기 아이콘) -->
				<button class="searchicon  btn " type="submit">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
	</div>
</nav>
<!-- 이걸해볼거임 -->

<!-- 여기는 건들지 마시오 -->
<!-- 부트스트랩 관련 링크들 -->
<!-- 반드시 있어야 함 -->






