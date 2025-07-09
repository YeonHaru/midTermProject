<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 CSS : 타이틀 밑에 CSS추가하기(밑에 예시는 공통css, header.css, footder.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_header.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/302_coalition.css" />
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

<div id="coalition_part" class="container my-5">
  <h2 class="coalition-title mb-4">
    제휴안내
    <span class="d-block mt-2 text-muted fs-6">
      저희는 Win-Win 할 수 있는 비즈니스 파트너와의 제휴를 기다리고 있습니다.
    </span>
  </h2>

  <!-- 공동 마케팅 / 제휴 -->
  <div class="coalition-box mb-5">
    <h3>공동 마케팅 / 제휴</h3>
    <p class="mb-3">
      양사의 자원을 활용하여 신규 고객 유치, <br />
      매출 증대 등의 성과를 낼 수 있는 <br />
      공동 마케팅/제휴 제안을 받습니다.
    </p>

    <h4>문의처</h4>
    <ul>
      <li><strong>제휴 마케팅</strong> - <a href="mailto:partner@naver.com">partner@naver.com</a></li>
      <li><strong>신규 사업 및 전략적 제휴</strong> - <a href="mailto:marketing@naver.com">marketing@naver.com</a></li>
      <li><strong>OpenAPI / 상품 DB</strong> - <a href="mailto:openapi@naver.com">openapi@naver.com</a></li>
      <li><strong>eBook</strong> - <a href="mailto:ebook@naver.com">ebook@naver.com</a></li>
      <li><strong>App / 모바일</strong> - <a href="mailto:mobile@naver.com">mobile@naver.com</a></li>
    </ul>
  </div>

  <!-- 상품 입점 문의 -->
  <div class="coalition-box">
    <h3>상품 입점 문의</h3>
    <p class="mb-3">
      상품 입점/판매 관련 내용은 <br />
      아래 담당자에게 문의해 주세요.
    </p>

    <h4>입점문의</h4>
    <ul>
      <li><strong>도서 입점 (구매팀)</strong> - <a href="mailto:buyer@naver.com">buyer@naver.com</a></li>
      <li><strong>도서 이벤트 (도서팀)</strong> - <a href="mailto:editors@naver.com">editors@naver.com</a></li>
      <li><strong>음반/DVD (음반팀)</strong> - <a href="mailto:touch@naver.com">touch@naver.com</a></li>
    </ul>
  </div>
</div>


<!-- 꼬리말 -->
<!-- jQuery (최신 안정 버전 하나만) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Swiper 최신 버전 -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<jsp:include page="/common/footer.jsp" />
</body>
</html>