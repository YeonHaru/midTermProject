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
	href="${pageContext.request.contextPath}/css/303_cultureCashGuide.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/03_footer.css" />
</head>
<body>
<jsp:include page="/common/header.jsp" />
  <section class="page pt4 pb5">
    <h2 class="tcenter mb4">🎫 문화상품권 온라인 결제 안내</h2>

    <!-- STEP 1 -->
    <div class="step-container">
      <div class="tcenter">
        <i class="fa-solid fa-ticket step-icon"></i>
        <div class="step-title">1단계. 문화상품권 선택</div>
        <p class="step-desc">결제수단에서 <strong>문화상품권</strong>을 선택합니다.</p>
      </div>
    </div>

    <!-- STEP 2 -->
    <div class="step-container">
      <div class="tcenter">
        <i class="fa-solid fa-arrow-right-arrow-left step-icon"></i>
        <div class="step-title">2단계. 환전 캐시로 전환</div>
        <p class="step-desc">‘환전 캐시로 전환’ 버튼을 클릭하여 다음 단계로 이동합니다.</p>
      </div>
    </div>

    <!-- STEP 3 -->
    <div class="step-container">
      <div class="tcenter">
        <i class="fa-solid fa-keyboard step-icon"></i>
        <div class="step-title">3단계. 핀번호 입력</div>
        <p class="step-desc">18자리 핀번호를 아래에 입력 후 금액을 조회하세요.</p>
        <input type="text" class="pin-input" placeholder="예: 1234-5678-9012-3456">
        <button class="btn-submit">금액 조회 및 환전</button>
      </div>
    </div>

    <!-- STEP 4 -->
    <div class="step-container">
      <div class="tcenter">
        <i class="fa-solid fa-won-sign step-icon"></i>
        <div class="step-title">4단계. 환전 후 결제 완료</div>
        <p class="step-desc">환전된 캐시로 결제를 완료하시면 됩니다.</p>
      </div>
    </div>
  </section>
  
<jsp:include page="/common/footer.jsp" />
</body>
</html>