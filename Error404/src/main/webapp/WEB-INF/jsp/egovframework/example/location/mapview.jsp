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
<!-- todo : 네이버지도 -->
  <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpKeyId=aoj7qwlj1l"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
<!-- 헤더추가 -->
<%@ include file="/common/header.jsp" %>
<section class = "bg-light">
  <div class="page store-container ">
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
        
        <button class="btn-store-map" onclick="scrollToSection('map')">지도보기</button>
        <button class="btn-store-call" onclick="scrollToSection('call')">매장문의 1234-5678</button>
        <button class="btn-store-way" onclick="scrollToSection('way')">오시는길</button>
        <button class="btn-store-guide" onclick="scrollToSection('guide')">매장안내도</button>
        <button class="btn-store-service" onclick="scrollToSection('service')">매장 이용 안내</button>
      </div>
     </div>
    </div>

  <section class="page store-detail-info bg-light">
    <div class="decorated-box bg-light ">
      <div class="store-info-label " id="map">지도보기</div>
      <div class="store-info-text">
        부산광역시 부산진구 중앙대로 627 삼비빌딩2, 2층(범천동)
        <div id="navermap" style="width:100%; height:400px;"></div>
      </div>
    </div>


    <div class="decorated-box bg-light">
      <div class="store-info-label" id="call">
      	<a href="tel:01027146310" class="store-info-label basicfont">
  			<span class="bi bi-telephone-fill"> 매장문의 1234-5678</span></a></div>
      <div class="store-info-text">
        - 국내도서 &gt; 1번버튼 &gt; 0번 상담사 연결<br />
        - 해외도서 &gt; 2번버튼 &gt; 0번 상담사 연결
      </div>
    </div>

<div class="store-info-item decorated-box bg-light">
  <div class="info-tabs">
    <button class="info-tab active" onclick="showTab('transit')">대중교통 안내</button>
    <button class="info-tab" onclick="showTab('parking')">주차안내</button>
  </div>

  <div id="way">
	  <div class="store-info-section" id="transit" style="display: block;">
	    <strong>🧭 오시는길</strong><br/>
	    - 지하철 1호선 범내골역 7번 출구로 나와 약 50m 도보 이동<br/>
	    - 버스로 오시려면<br/>
	    - 범내골역 하차<br/>
	    - 번호 : 103번, 1000번, 88번, 16번, 20번
	  </div>
  </div>

  <div class="store-info-section" id="parking" style="display: none;">
    <strong>🅿️ 주차안내</strong><br/><br/>
    <strong>*회원</strong><br/>
    플래티넘: 2시간<br/>
    골드: 2시간<br/>
    실버/프렌즈: 구매금액 1만원 이상 1시간, 3만원 이상 2시간<br/><br/>

    <strong>*비회원 고객</strong><br/>
    구매금액 3만원 이상 1시간, 5만원 이상 2시간<br/>
    교환/환불: 30분<br/>
    도서예약: 30분<br/>
    무료시간 초과 시: 10분당 1,000원<br/><br/>

    <strong>* 유의사항</strong><br/>
    - 주차 확인 시스템이 주차차량 자동인증으로 변경되었습니다.<br/>
    - 결제 시 카운터 및 안내데스크에 영수증 제시 후 차량번호를 말씀하시면 인증을 받아야 무료주차 혜택을 받을 수 있습니다.<br/>
    - 플래티넘 및 골드회원은 북클럽회원카드 제시 시 무료주차 혜택 가능 (플라스틱카드 또는 모바일카드)<br/>
    - 무료주차 확인은 **영업시간 내**에만 가능합니다.
  </div>
</div>
  <div class="container py-5">
    <div class="store-guide-box decorated-box bg-light">
      
      <!-- 왼쪽 텍스트 영역 -->
      <div class="store-info-text">
        <div class="store-info-label" id="guide">🗺️ 매장안내도</div>

        <div>
          <h5>A동</h5>
          예술, 여행, 만화, 잡지, 가정생활, 요리 취미, 스포츠, 건강 등
        </div>
        <div>
          <h5>B동</h5>
          청소년, 인문, 역사, 아동, 유아, 초중고학습도서, 소설, 시, 에세이 등
        </div>
        <div>
          <h5>C동</h5>
          과학, 외국어, 예술, 경제, 경영, 자기계발, 정치사회, 취업수험서 등
        </div>
        <div>
          <h5>D동</h5>
          컴퓨터, 자격증, 취업, 외국어/한국소개도서(BooKs on korea), 어린이 영어, 종교 등
        </div>
      </div>

      <!-- 오른쪽 이미지 -->
      <div class="store-map-image">
        <img src="/images/202_storemap.png" alt="매장안내도" />
      </div>
    </div>
  </div>
	  
		<div class="container text-center my-4">
		  <div class="row">
		    <!-- 1. 도서예약 서비스 -->
		    <div class="col-md-3 col-6 mb-4">
		      <div class="decorated-box h-100">
		        <div class="store-info-label" id="service">📚 도서예약 서비스</div>
		        <div class="store-info-text">
		          원하는 책을 온라인으로 <strong>미리 예약</strong>하고,<br>
		          매장에서 빠르게 수령할 수 있습니다.
		        </div>
		      </div>
		    </div>
		
		    <!-- 2. 도서배달 서비스 -->
		    <div class="col-md-3 col-6 mb-4">
		      <div class="decorated-box h-100">
		        <div class="store-info-label">📦 도서배달 서비스</div>
		        <div class="store-info-text">
		          예약 도서를 <strong>무료배송</strong>으로 집까지!<br>
		          온라인 주문 후 편하게 받아보세요.
		        </div>
		      </div>
		    </div>
		
		    <!-- 3. 무인검색 서비스 -->
		    <div class="col-md-3 col-6 mb-4">
		      <div class="decorated-box h-100">
		        <div class="store-info-label">🔍 무인검색 서비스</div>
		        <div class="store-info-text">
		          매장 키오스크로 <strong>도서 위치와 재고</strong>를<br>
		          직접 검색할 수 있습니다.
		        </div>
		      </div>
		    </div>
		
		    <!-- 4. 와이파이 서비스 -->
		    <div class="col-md-3 col-6 mb-4">
		      <div class="decorated-box h-100">
		        <div class="store-info-label">📶 와이파이 서비스</div>
		        <div class="store-info-text">
		          쾌적한 환경을 위한 <strong>무료 Wi-Fi</strong><br>
		          누구나 자유롭게 이용 가능합니다.
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
    </section>
 </section>

<!-- 푸터 추가 -->
<%@ include file="/common/footer.jsp" %>

<!-- 스크립트 -->

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script> 
     <!-- 스크롤이동 스크립트 -->
    <script>
      function scrollToSection(id) {
        const el = document.getElementById(id);
        if (el) {
          el.scrollIntoView({ behavior: 'smooth' });
        }
      }
    </script>
    <!-- 네이버지도 생성 스크립트 -->
    <script>
      var map = new naver.maps.Map('navermap', {
        center: new naver.maps.LatLng(35.1487073, 129.0588913), // 위도, 경도
        zoom: 17
      });

      var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(35.1487073, 129.0588913),
        map: map,
        title: "404호_NOT&FOUND점"
      });
    </script>
    
 <!-- 탭전환 스크립트 -->
   <script>
  function showTab(tabName) {
    document.getElementById('transit').style.display = 'none';
    document.getElementById('parking').style.display = 'none';
    document.getElementById(tabName).style.display = 'block';

    const tabs = document.querySelectorAll('.info-tab');
    tabs.forEach(tab => tab.classList.remove('active'));
    event.target.classList.add('active');
  }
</script>
<script>
  var mapOptions = {
    center: new naver.maps.LatLng(35.143303, 129.060620),
    zoom: 16
  };
  var map = new naver.maps.Map('navermap', mapOptions);
  var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.143303, 129.060620),
    map: map
  });
</script> 
</body>
</html>
