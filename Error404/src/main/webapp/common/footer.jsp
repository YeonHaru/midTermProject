<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- a태그, c태그 정리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>책장 펼침 효과 + 검색 기능</title>
    <!-- 	부트스트랩 css  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
  </head>
  <body>
  <div class="bg">
    <footer class="footer page pb5">
      <div class="footer-book mb4">

        <!-- 책장 1 -->
        <div class="footer-page">
          <div class="page-front">
            <h4>공지 사항</h4>
          </div>
          <div class="after-text">
            <a href="#">[채용공고]</a>
            <a href="#">토스결제 오류안내</a>
          </div>
        </div>

        <!-- 책장 2 -->
        <div class="footer-page">
          <div class="page-front">
            <h4>빠른 서비스</h4>
          </div>
          <div class="after-text">
            <a href="#">환불/교환/반품</a>
            <a href="#">미배송 신고</a>
            <a href="#">입금 신고</a>
          </div>
        </div>

        <!-- 책장 3 -->
        <div class="footer-page">
          <div class="page-front">
            <h4>출판사, 판매자 안내</h4>
          </div>
          <div class="after-text">
            <a href="#">제휴&마케팅 안내</a>
            <a href="#">출판사 안내</a>
            <a href="#">판매자 매니저</a>
            <a href="#">광고 안내</a>
            <a href="#">기업/학교 대량구매</a>
          </div>
        </div>

        <!-- 책장 4 -->
        <div class="footer-page">
          <div class="page-front">
            <h4>제휴서비스</h4>
          </div>
          <div class="after-text">
            <a href="#">문화상품권</a>
            <a href="#">컬쳐랜드상품권</a>
            <a href="#">문화누리카드</a>
          </div>
        </div>
      </div>

      <!-- 전체 사이트 검색창 -->
      <form
        action="${pageContext.request.contextPath}/search"
        method="get"
        class="footer-search-global mt4 mb3"
        role="search"
      >
        <input
          type="search"
          name="query"
          placeholder=""
          aria-label="사이트 전체 검색"
          required
        />
        <button type="submit">검색</button>
      </form>

      <!-- 최하단 링크 -->
      <div class="footer-bottom mt4 pt4">
        <a href="#">회사소개</a>
        <a href="#">이용약관</a>
        <a href="#">개인정보처리방침</a>
        <a href="#">매장위치</a>
      </div>
    </footer>
</div>
    <script>
      function initFooterInteraction() {
        const pages = document.querySelectorAll(".footer-page");

        // 이전 이벤트 제거 위해 클론 (중복 이벤트 방지)
        pages.forEach((page) => {
          const clone = page.cloneNode(true);
          page.parentNode.replaceChild(clone, page);
        });

        const newPages = document.querySelectorAll(".footer-page");

        if (window.innerWidth >= 768) {
          // PC: hover 열림/닫힘
          newPages.forEach((page) => {
            page.addEventListener("mouseenter", () => {
              page.classList.add("open");
            });
            page.addEventListener("mouseleave", () => {
              page.classList.remove("open");
            });
          });
        } else {
          // 모바일: 클릭 토글
          newPages.forEach((page, idx) => {
            page.addEventListener("click", () => {
              newPages.forEach((p, i) => {
                if (i === idx) {
                  p.classList.toggle("open");
                } else {
                  p.classList.remove("open");
                }
              });
            });
          });
        }
      }

      window.addEventListener("load", initFooterInteraction);
      window.addEventListener("resize", initFooterInteraction);
    </script>
  </body>
</html>
