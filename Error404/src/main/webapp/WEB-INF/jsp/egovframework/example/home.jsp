<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/03_footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/01_main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_main.css"/>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
  </head>
  <body>
  <%@ include file="/common/header.jsp" %>
  <div class="bg">
    <div class="page">
      <main class="main-content">
        <!-- 메인 배너 -->
        <section class="banner">
          <h2>책과 함께하는 삶</h2>
          <p>당신만의 책을 만나보세요</p>
        </section>

        <!-- 신간 도서 섹션 -->
        <section class="book-section new-books">
          <h3>📘 신간 도서</h3>
          <div class="book-list">
            <!-- 예시로 도서 4권 출력 -->
            <div class="book-card">
              <div class="image-box">
                <img src="${pageContext.request.contextPath}/images/sample.jpg" alt="도서 이미지" />
              </div>
              <p class="title">도서 제목 1</p>
            </div>
            <div class="book-card">
              <div class="image-box">
                <img src="${pageContext.request.contextPath}/images/sample2.jpg" alt="도서 이미지" />
              </div>
              <p class="title">도서 제목 2</p>
            </div>
            <div class="book-card">
              <div class="image-box">
                <img src="${pageContext.request.contextPath}/images/sample.jpg" alt="도서 이미지" />
              </div>
              <p class="title">도서 제목 3</p>
            </div>
            <div class="book-card">
              <div class="image-box">
                <img src="${pageContext.request.contextPath}/images/sample.jpg" alt="도서 이미지" />
              </div>
              <p class="title">도서 제목 4</p>
            </div>
          </div>
        </section>

        <!-- 베스트셀러 TOP 10 -->
        <section class="page mt3 mb4">
          <h2 class="tcenter mb3">베스트셀러 TOP 10</h2>
          <ul class="best-list">
            <li class="best-item">
              <span class="best-rank">1</span>
              <span class="best-title">심판 <span class="best-new">new</span></span>
            </li>
            <li class="best-item">
              <span class="best-rank">2</span>
              <span class="best-title">첫 여름, 완주 <span class="best-up">3</span></span>
            </li>
            <li class="best-item">
              <span class="best-rank">3</span>
              <span class="best-title">안녕이라 그랬어</span>
            </li>
            <li class="best-item">
              <span class="best-rank">4</span>
              <span class="best-title">급류 <span class="best-new">new</span></span>
            </li>
            <li class="best-item">
              <span class="best-rank">5</span>
              <span class="best-title">청춘의 독서</span>
            </li>
            <li class="best-item">
              <span class="best-rank">6</span>
              <span class="best-title">검지의 힘</span>
            </li>
            <li class="best-item">
              <span class="best-rank">7</span>
              <span class="best-title">열혈간호 93 <span class="best-down">1</span></span>
            </li>
            <li class="best-item">
              <span class="best-rank">8</span>
              <span class="best-title">고래눈이 내리다</span>
            </li>
            <li class="best-item">
              <span class="best-rank">9</span>
              <span class="best-title">광장 이후 (한정판) <span class="best-new">new</span></span>
            </li>
            <li class="best-item">
              <span class="best-rank">10</span>
              <span class="best-title">치유의 빛 <span class="best-down">2</span></span>
            </li>
          </ul>
        </section>
      </main>
    </div>
  </div>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>   
<!-- 필수: Popper 포함된 JS (bundle) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>    
<!-- header 드롭다운 관련된 스크립트-덕규작업 -->

<%@ include file="/common/footer.jsp" %> 
  </body>
</html>