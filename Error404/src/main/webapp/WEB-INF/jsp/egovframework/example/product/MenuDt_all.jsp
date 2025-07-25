<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반응형 메뉴</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/00_style.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/MenuDt_all.css" />
    <!-- 	부트스트랩 css  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
  </head>
  <body>
    <!-- 메뉴 시작 -->
    <div class="page">
      <nav class="menu">
        <div class="menu-toggle" id="menuToggle">전체 ▾</div>
        <ul class="menu-list" id="menuList">
          <li><a href="#">국내도서</a></li>
          <li><a href="#">외국도서</a></li>
          <li><a href="#">교보Only</a></li>
          <li><a href="#">eBook</a></li>
          <li><a href="#">sam</a></li>
        </ul>
      </nav>

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
          <div class="book-item">
            <div class="book-list-image">
              <img src="<%= request.getContextPath() %>/images/bookcover-7828505_1280.jpg" alt="책 이미지" />
            </div>
            <div class="book-right">
              <div class="book-info">
                <h4 class="book-title">집 가고 싶은 사람?</h4>
                <p class="book-desc">이 책은 집 가고 싶은 사람에 대한 설명입니다.</p>
                <div class="delivery-date">배송: 내일 도착</div>
                <br />
                <p>10% 11,610원 12,900원 640p</p>
              </div>
              <div class="button-group mt2">
                <button>장바구니</button>
                <button>바로구매</button>
              </div>
            </div>
          </div>

          <div class="book-item">
            <div class="book-list-image">
              <img src="<%= request.getContextPath() %>/images/childrens-book-8304585_1280.jpg" alt="책 이미지" />
            </div>
            <div class="book-right">
              <div class="book-info">
                <h4 class="book-title">집 가고 싶은 사람?</h4>
                <p class="book-desc">이 책은 집 가고 싶은 사람에 대한 설명입니다.</p>
                <div class="delivery-date">배송: 내일 도착</div>
                <br />
                <p>10% 11,610원 12,900원 640p</p>
              </div>
              <div class="button-group mt2">
                <button>장바구니</button>
                <button>바로구매</button>
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>

  
    <!-- 자바스크립트 연결 -->
<script src="<%= request.getContextPath() %>/js/MenuDt_all.js"></script>
    <!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 외부 JS 라이브러리 : jquery 쓸때 필요한 라이브러리 밑 스와이프 기능들 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  </body>
</html>
