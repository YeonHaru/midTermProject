<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Store Guide</title>

  <!-- CSS 경로 변경 (JSP에서는 ContextPath 사용 권장) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/03_footer.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/10_mapview.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
<!-- 헤더추가 -->
<%@ include file="/common/header.jsp" %>

  <div class="page store-container mt5">
    <div class="store-image">
      <img src="${pageContext.request.contextPath}/images/bookstore-7828505_1280.jpg" alt="매장 이미지" />
      <!-- 경로에 contextPath 추가 -->
    </div>

    <div class="tcenter store-info">
      <h2 class="store-title ml2">404호_NOT&FOUND점</h2>
      <div class="store-description">
        <p>
          <strong>위치:</strong> 부산광역시 부산진구 중앙대로 627 삼비빌딩2, 2층(범천동)<br>
          <strong>영업시간:</strong>
          <span class="store-hours">월~목 - 10:30 ~ 20:00 / 금~일,공휴일 - 10:30 ~ 20:30</span><br>
          <strong>휴점:</strong> 설날, 추석(당일) <span class="store-holiday">*매월 10일 정기휴일*</span>
        </p>
      </div>

      <div class="store-buttons"> 
        <button class="btn-store-map">지도보기</button>
        <button class="btn-store-call">매장문의 1234-5678</button>
        <button class="btn-store-way">오시는길</button>
        <button class="btn-store-guide">매장안내도</button>
      </div>
    </div>
  </div>

  <section class="page store-detail-info">
    <div class="store-info-item">
      <div class="store-info-label">지도보기</div>
      <div class="store-info-text">
        눌렀을때<br/>지도가<br/>켜지게<br/>만들어<br/>지게함<br/>
      </div>
    </div>

    <div class="store-info-item">
      <div class="store-info-label">매장문의 1234-5678</div>
      <div class="store-info-text">
        국내도서 &gt; 1번버튼 &gt; 0번 상담사 연결<br />
        해외도서 &gt; 2번버튼 &gt; 0번 상담사 연결
      </div>
    </div>

    <div class="store-info-item">
      <div class="store-info-label">오시는길</div>
      <div class="store-info-text">
        &gt;지하철 1호선 범내골역 7번 출구로 나와 약 50m 도보 이동<br/>
        *버스로 오시려면<br/>
        &gt;범내골역 하차<br/>
        번호 : 103번, 1000번, 88번, 16번, 20번
      </div>
    </div>

    <div class="store-info-item">
      <div class="store-info-label">매장안내도</div>
      <div class="store-info-text">
        <h5>A동</h5>유아, 아동, 초·중·고학습<br/>
        <h5>B동</h5>취미, 요리, 건강, 예술, 외국어, 만화, 여행, 인문, 종교, 수험서<br/>
        <h5>C동</h5>소설, 에세이, 경제, 정치, 컴퓨터, 과학, 기술<br/>
        <h5>HOTTRACKS</h5>학용품, 디자인문구, 일상소품, 디지털, 음반
      </div>
    </div>
  </section>

<!-- 푸터 추가 -->
<%@ include file="/common/footer.jsp" %>
</body>
</html>
