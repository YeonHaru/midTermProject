<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>기프트카드</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/405_gift_presen.css" />
  </head>
  <body>
    <section class="gift-card-section">
      <h2 class="gift-card-title">기프트카드 선물하기🎁</h2>
      <div class="gift-card-grid">
       <!-- 반복문 -->
        <c:forEach var="data" items="${giftPresens}">
        <!-- 카드 1 -->
        <div class="gift-card-item">
          <div class="gift-card-image">
            <img src="<c:out value="${data.photo}"></c:out>" alt="기프트카드 10만원" />
          </div>
          <div class="gift-card-info">
            <p class="gift-card-name"><c:out value="${data.title}"></c:out></p>
            <p class="gift-card-meta"><c:out value="${data.content}"></c:out></p>
            <p class="gift-card-price"><c:out value="${data.money}"></c:out></p>
          </div>
        </div>  
        </c:forEach>   
      </div>
    </section>
    <section class="gift-card-faq">
      <!-- 1. 공통 유의사항 -->
      <div class="faq-item">
        <button class="faq-question">
          1. 선물하기 유의사항 (공통)
          <span class="arrow">▼</span>
        </button>
        <div class="faq-answer">
          <ul>
            <li>
              최대 <strong>50명까지 선물 가능</strong>하며, 1인당 수량에 따라
              가능한 인원 수가 달라집니다. <br />예: 1명당 5권 × 10명 = 총 50권
              주문
            </li>
            <li>
              <strong>선물 가능 상품</strong>: 도서, 음반, DVD, 기프트카드,
              eBook, 오디오북, sam 등
            </li>
            <li>
              <strong>선물 불가 상품</strong>: 잡지, 해외주문도서, 오픈마켓
              상품, 강연/공연/여행 등
            </li>
            <li><strong>실물/비실물 상품은 함께 선물 불가</strong></li>
            <li>
              <strong>여러 명에게 선물 시</strong>,
              <mark>건별 배송비가 부과</mark>됩니다.
            </li>
            <li>
              <strong>모든 수신자에게 동일한 상품/수량/메시지</strong>가
              적용됩니다.
            </li>
            <li>
              <strong>옵션 및 수량 변경 불가</strong> — 변경하려면 장바구니에서
              수정 후 다시 주문해주세요.
            </li>
            <li>
              <strong>선물 전달 방식</strong>: 알림톡 또는 이메일 중 선택 가능
              <br />등록되지 않은 선물은 [마이룸 > 선물조회/등록]에서
              <mark>1회 재발송 가능</mark>
            </li>
            <li>
              <strong>Klover 리뷰</strong>: 수신자 수령 후, 주문자가 작성 가능
            </li>
          </ul>
        </div>
      </div>

      <!-- 2. 이용 제한 -->
      <div class="faq-item">
        <button class="faq-question">
          2. 선물 서비스 이용 제한
          <span class="arrow">▼</span>
        </button>
        <div class="faq-answer">
          <ul>
            <li>30일 내 <strong>14회를 초과해 선물 수령</strong>한 경우</li>
            <li>
              <strong>약관 위반 또는 부정한 방법</strong>으로 콘텐츠를
              수령하려는 경우
            </li>
            <li><strong>타인 명의</strong>로 서비스를 이용한 경우</li>
            <li>
              <strong>시스템을 무단 침입 또는 조작</strong>하여 서비스를 이용한
              경우
            </li>
            <li>
              <strong>천재지변, 국가비상사태 등 불가항력적 사유</strong> 발생 시
            </li>
            <li>
              <strong>시스템 장애, 정전, 접속 폭주 등 기술적 문제</strong> 발생
              시
            </li>
            <li><strong>이용약관 또는 정책 위반</strong> 시</li>
          </ul>
          <p>
            또한
            <strong
              >eBook 선물 서비스가 시스템 문제나 회사 귀책사유로 수령되지 못할
              경우</strong
            >, <mark>서비스 유효기간을 연장</mark>하거나
            <mark>환불 규정에 따라 환불</mark>됩니다.
          </p>
        </div>
      </div>

      <!-- 3. 등록 및 환불 -->
      <div class="faq-item">
        <button class="faq-question">
          3. 선물 등록 및 환불 안내
          <span class="arrow">▼</span>
        </button>
        <div class="faq-answer">
          <ul>
            <li>
              <strong>선물 등록 기한</strong>: 발송일로부터
              <mark>14일 이내</mark> 등록 필요. 기한 초과 시
              <strong>자동 주문취소</strong> →
              <strong>승인 취소 또는 예치금 전환</strong>
            </li>
            <li>
              <strong>수신자가 선물 거절 시</strong>: 보낸 분에게
              <strong>승인 취소 또는 예치금 전환</strong>
            </li>
            <li>
              <strong>선물 불가 상품</strong>: 잡지, 해외주문도서,
              오픈마켓(실물), 강연/공연/여행(비실물)
            </li>
            <li>
              <strong>교보e캐시 사용 시 유의</strong>: 환불 시 유효기간이
              적용되며
              <mark>유효기간 초과 시 사용하지 않은 e캐시도 소멸</mark>될 수 있음
            </li>
          </ul>
        </div>
      </div>
    </section>
    <script>
      document.querySelectorAll(".faq-question").forEach((button) => {
        button.addEventListener("click", () => {
          const item = button.closest(".faq-item");
          item.classList.toggle("active");
        });
      });
    </script>
  </body>
</html>
