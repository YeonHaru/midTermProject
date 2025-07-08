<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- a태그, c태그 정리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 공통 CSS : 타이틀 밑에 CSS추가하기(밑에 예시는 공통css, header.css, footder.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/401_main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/402_Notice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/403_ikon.css">	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />
<!-- 	부트스트랩 css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
	<jsp:include page="/common/header.jsp" />
<div class="page">
    <div class="mainpage-container">
      <!-- 메인 배너 -->
      <div class="main-banner-wrapper">
        <div class="swiper main-banner-swiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide main-banner-slide">
              <div class="main-image"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image2"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image3"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image4"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image5"></div>
            </div>
          </div>
          <div class="swiper-pagination main-banner-pagination"></div>
          <div class="swiper-button-prev main-banner-prev"></div>
          <div class="swiper-button-next main-banner-next"></div>
        </div>
      </div>

      <!-- 공지사항 박스 -->
      <div class="mainpage-right">
        <div class="swiper notice-swiper">
          <div class="swiper-wrapper">

            <!-- 예시 상품 1 -->
            <div class="swiper-slide">
              <div class="mainpage-side-box">
                <div class="side-box-badge">오늘만 특가</div>
                <img src="${pageContext.request.contextPath}/images/main/school.png" alt="사무용품 세트" />
                <div class="mainpage-side-box-content">
                  <h5>오늘만 특가 <br /> 네오 학용품 세트</h5>
                  <a href="#" class="bluedelete">오늘만 이 가격 <br /> 13,200원!</a>
                  <div class="side-box-price"></div>
                </div>
              </div>
            </div>

            <!-- 예시 상품 2 -->
            <div class="swiper-slide">
              <div class="mainpage-side-box">
                <div class="side-box-badge">내일까지 <br /> 특가</div>
                <img src="${pageContext.request.contextPath}/images/main/Eco.image.png" alt="에코백" />
                <div class="mainpage-side-box-content">
                  <h5>내일까지 특가! <br /> Eco 에코백</h5>
                  <a href="#" class="bluedelete">지금 9,900원! <br /> 내일 자정 12시까지 특가!</a>
                  <div class="side-box-price"></div>
                </div>
              </div>
            </div>

            <!-- 예시 상품 3 -->
            <div class="swiper-slide">
              <div class="mainpage-side-box">
                <div class="side-box-badge">한정 수량</div>
                <img src="${pageContext.request.contextPath}/images/main/bookmark.image.png" alt="책갈피" />
                <div class="mainpage-side-box-content">
                  <h5>한정 판매 <br /> 우주 책갈피!</h5>
                  <a href="#" class="bluedelete">지금 한정판매중! <br /> 4개 묶음으로 단돈 5,500 판매!</a>
                  <div class="side-box-price"></div>
                </div>
              </div>
            </div>

          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </div>
      <!-- 메인 배너 -->
      <div class="main-banner-wrapper">
        <div class="swiper main-banner-swiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide main-banner-slide">
              <div class="main-image"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image2"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image3"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image4"></div>
            </div>
            <div class="swiper-slide main-two-slide">
              <div class="main-image5"></div>
            </div>
          </div>
          <div class="swiper-pagination main-banner-pagination"></div>
          <div class="swiper-button-prev main-banner-prev"></div>
          <div class="swiper-button-next main-banner-next"></div>
        </div>
      </div>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </div>



            <!-- 예시 상품 1 -->
            <div class="swiper-slide">
              <div class="mainpage-side-box">
                <div class="side-box-badge">오늘만 특가</div>
                <img src="${pageContext.request.contextPath}/images/main/school.png" alt="사무용품 세트" />
                <div class="mainpage-side-box-content">
                  <h5>오늘만 특가 <br /> 네오 학용품 세트</h5>
                  <a href="#" class="bluedelete">오늘만 이 가격 <br /> 13,200원!</a>
                  <div class="side-box-price"></div>
                </div>
              </div>
            </div>

            <!-- 예시 상품 2 -->
            <div class="swiper-slide">
              <div class="mainpage-side-box">
                <div class="side-box-badge">내일까지 <br /> 특가</div>
                <img src="${pageContext.request.contextPath}/images/main/Eco.image.png" alt="에코백" />
                <div class="mainpage-side-box-content">
                  <h5>내일까지 특가! <br /> Eco 에코백</h5>
                  <a href="#" class="bluedelete">지금 9,900원! <br /> 내일 자정 12시까지 특가!</a>
                  <div class="side-box-price"></div>
                </div>
              </div>
            </div>

            <!-- 예시 상품 3 -->
            <div class="swiper-slide">
              <div class="mainpage-side-box">
                <div class="side-box-badge">한정 수량</div>
                <img src="${pageContext.request.contextPath}/images/main/bookmark.image.png" alt="책갈피" />
                <div class="mainpage-side-box-content">
                  <h5>한정 판매 <br /> 우주 책갈피!</h5>
                  <a href="#" class="bluedelete">지금 한정판매중! <br /> 4개 묶음으로 단돈 5,500 판매!</a>
                  <div class="side-box-price"></div>
                </div>
              </div>
            </div>

          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </div>

    <!-- 하단 아이콘 -->
    <div class="quick-menu">
      <ul class="quick-menu-list">
        <c:forEach var="icon" items="${pageContext.request.contextPath}/images/main/">
          <!-- 이 부분은 향후 JSTL 배열 등으로 처리 가능 -->
        </c:forEach>


    <!-- 하단 아이콘 -->
    <div class="quick-menu">
      <ul class="quick-menu-list">
        <c:forEach var="icon" items="${pageContext.request.contextPath}/images/main/">
          <!-- 이 부분은 향후 JSTL 배열 등으로 처리 가능 -->
        </c:forEach>


    <!-- 하단 아이콘 -->
    <div class="quick-menu">
      <ul class="quick-menu-list">
        <c:forEach var="icon" items="${pageContext.request.contextPath}/images/main/">
          <!-- 이 부분은 향후 JSTL 배열 등으로 처리 가능 -->
        </c:forEach>

<!-- /temp.do 템플릿 양식 예시입니다. 홈 컨트롤러에 임시로 해놨습니다. 템플릿양식으로 연결만 시켜둘게요. -->
        <li>
          <a href="/temp.do"><img src="${pageContext.request.contextPath}/images/main/jewelry.svg" alt="할인혜택" /><span>할인혜택</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/sale.svg" alt="오늘만특가" /><span>오늘만특가</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/app.svg" alt="APP혜택" /><span>APP혜택</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/card.svg" alt="기프트카드" /><span>기프트카드</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/book.svg" alt="바로출판" /><span>바로출판</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/book of.svg" alt="이달의 책" /><span>이달의 책</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/pen.svg" alt="손글씨캠페인" /><span>글씨캠페인</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/box.svg" alt="사은품" /><span>사은품</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/good1.svg" alt="추천" /><span>추천</span></a>
        </li>
        <li>
          <a href="#"><img src="${pageContext.request.contextPath}/images/main/Books.svg" alt="인물&작품" /><span>인물&작품</span></a>
        </li>
      </ul>
    </div>

    <div class="mainpage-center"></div>
  </div>	
	
	<!-- 꼬리말 -->
<!-- jQuery (최신 안정 버전 하나만) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Bootstrap JS (번들 형태, Popper 포함) -->
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>

<!-- Swiper 최신 버전 -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- 커스텀 JS -->
<script src="${pageContext.request.contextPath}/js/401_main.js"></script>

<jsp:include page="/common/footer.jsp" />
</body>
</html>