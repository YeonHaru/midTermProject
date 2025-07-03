<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>


<!-- 상단 이벤트 배너 영역 (필요시 제거 가능) -->
<div class="top-banner text-center py-2" style="background-color:#f8f9fa; font-size:14px;">
  <span>💳 삼성카드 결제 시 최대 30% 할인 이벤트 중!</span>
</div>

<!-- 부트스트랩 네비게이션 바 -->
<nav class="navbar navbar-expand-lg custom-navbar bg-light">
<div class = "page	">
  <div class="container-fluid">		

    <!-- 사이트 로고 -->
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">📚 BookStore</a>

    <!-- 모바일 토글 버튼 -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- 메뉴 콘텐츠 -->
    <div class="collapse navbar-collapse" id="navbarContent">

      <!-- 왼쪽 네비게이션 -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
        <li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle" href="#" id="bookMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    국내도서
  </a>
  <ul class="dropdown-menu" aria-labelledby="bookMenu">
    <li><a class="dropdown-item" href="#">소설</a></li>
    <li><a class="dropdown-item" href="#">에세이</a></li>
    <li><a class="dropdown-item" href="#">자기계발</a></li>
  </ul>
</li>
        <li class="nav-item"><a class="nav-link" href="#">외국도서</a></li>
        <li class="nav-item"><a class="nav-link" href="#">전자책</a></li>
        <li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
      </ul>

      <!-- 오른쪽 로그인 관련 -->
      <ul class="navbar-nav mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
      </ul>
    </div>
  </div>
  </div>
</nav>

<!-- 검색창 영역 -->
<div class="container my-3">
  <form class="d-flex justify-content-center" role="search" action="${pageContext.request.contextPath}/search.do" method="get" style="max-width: 600px; margin: 0 auto;">
    <input 
      class="form-control me-2 rounded-pill px-4 shadow-sm" 
      type="search" 
      placeholder="통합검색" 
      name="query" 
      aria-label="Search"
      style="border: 1px solid #ced4da;"
    >
	<button 
	  class="custom-btn rounded-pill px-4 shadow-sm" 
	  type="submit"
	  style="white-space: nowrap;"
	>
	   검색
	</button>
  </form>
  <script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function(){
	    // 모든 드롭다운에 대해 hover 이벤트 적용
	    const dropdowns = document.querySelectorAll('.dropdown');
	    dropdowns.forEach(function(dropdown) {
	      dropdown.addEventListener('mouseenter', function () {
	        const menu = dropdown.querySelector('.dropdown-menu');
	        menu.classList.add('show');
	      });
	      dropdown.addEventListener('mouseleave', function () {
	        const menu = dropdown.querySelector('.dropdown-menu');
	        menu.classList.remove('show');
	      });
	    });
	  });
  </script>
</div>



