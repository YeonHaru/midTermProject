<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/00_style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/text.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>
  <div class="background pb5 pt5">
    <div class="page">
      <div class="book-detail-container pt5">
        <div class="book-image">
          <img src="${pageContext.request.contextPath}/image/bookcover-7828505_1280.jpg" alt="책 이미지" />
        </div>

        <div class="book-info">
          <h1 class="book-title">도서 제목 예시</h1>
          <div class="book-text">
            <p>
              <strong>정가:</strong> 18,000원<br />
              <strong>판매가:</strong>
              <span class="price-sale">16,200원</span><br />
              <strong>마일리지:</strong> 810원(5%) <br />
              <strong>배송:</strong> 무료배송 <br />
              <strong>수령예상일:</strong> 내일(7/2, 화) 도착 예정<br />
              <strong>별점/리뷰:</strong> ⭐ 4.5 / 120개 리뷰
            </p>
          </div>
          <div class="button-group">
            <button class="btn-cart"><small>장바구니</small></button>
            <button class="btn-buy"><small>바로구매</small></button>
            <button class="btn-gift"><small>선물하기</small></button>
            <button class="btn-save"><small>보관함</small></button>
          </div>
        </div>
      </div>

      <section class="book-basic-info">
        <div class="info-item">
          <div class="info-label">📘 기본정보</div>
          <div class="info-text">
            308쪽 · 135×205mm · 440g · ISBN: 9788997780624
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">📚 주제 분류</div>
          <div class="info-text">
            국내도서 &gt; 사회과학 &gt; 정치학/외교학/행정학 &gt; 정치인<br />
            국내도서 &gt; 사회과학 &gt; 한국정치사정/정치사 &gt; 일반
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">📦 시리즈</div>
          <div class="info-text">
            [세트] 결국 국민이 합니다 + 이재명의 길 - 전2권<br />
            [세트] 결국 국민이 합니다 + 이재명의 준비 - 전2권<br />
            [세트] 결국 국민이 합니다 + 이재명에 관하여 - 전2권
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">🎁 이벤트</div>
          <div class="info-text">
            나들이 크로스백 (상반기 베스트셀러 포함 국내도서 3만 5천원 이상 구매 시)<br />
            알라딘 굿즈 (이벤트 도서 포함 3.5만 이상 구매 시)<br />
            침대용 테이블, 책금고 등 사은품
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">책소개</div>
          <div class="info-text">
            나들이 크로스백 (상반기 베스트셀러 포함 국내도서 3만 5천원 이상 구매 시)<br />
            알라딘 굿즈 (이벤트 도서 포함 3.5만 이상 구매 시)<br />
            침대용 테이블, 책금고 등 사은품
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">목차</div>
          <div class="info-text">
            나들이 크로스백 (상반기 베스트셀러 포함 국내도서 3만 5천원 이상 구매 시)<br />
            알라딘 굿즈 (이벤트 도서 포함 3.5만 이상 구매 시)<br />
            침대용 테이블, 책금고 등 사은품
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">저자 및 역자소개</div>
          <div class="info-text">
            나들이 크로스백 (상반기 베스트셀러 포함 국내도서 3만 5천원 이상 구매 시)<br />
            알라딘 굿즈 (이벤트 도서 포함 3.5만 이상 구매 시)<br />
            침대용 테이블, 책금고 등 사은품
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">출판사 소개</div>
          <div class="info-text">
            나들이 크로스백 (상반기 베스트셀러 포함 국내도서 3만 5천원 이상 구매 시)<br />
            알라딘 굿즈 (이벤트 도서 포함 3.5만 이상 구매 시)<br />
            침대용 테이블, 책금고 등 사은품
          </div>
        </div>
      </section>

      <section class="related-books">
        <div class="container">
          <h3 class="section-title">
            이 상품을 구입하신 분들이 다음 상품도 구입하셨습니다
          </h3>
          <div class="swiper related-swiper">
            <div class="swiper-wrapper">
              <!-- 예시 슬라이드들 -->
              <div class="swiper-slide book-slide">
                <div class="image-box">
                  <img src="${pageContext.request.contextPath}/image/a-book-3658687_1280.jpg" alt="책1" />
                </div>
                <p class="book-title">책 제목 1</p>
              </div>
              <!-- ... 더 추가 가능 ... -->
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </section>

      <section class="return-exchange-info pb5">
        <div class="container">
          <h2 class="info-title">반품/교환안내</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="label">반품/교환 방법</div>
              <div class="description">
                "나의계정 &gt; 주문조회 &gt; 반품/교환신청", 1:1상담 &gt; 반품/교환 또는 고객센터(1544-2514)<br />
                판매자 배송상품은 판매자와 반품/교환이 협의된 상품에 한해 가능
              </div>
            </div>
            <div class="info-item">
              <div class="label">반품/교환 가능기간</div>
              <div class="description">
                · 변심반품 수령 후 20일<br />
                (단, 중고매장 상품은 7일 / 전자책 단말기 등은 수령 후 7일 이내 포장 미개봉 시)<br />
                · 파본 등 상품결함 시 발견 후 30일 (수령일로부터 3개월 이내)
              </div>
            </div>
            <div class="info-item">
              <div class="label">반품/교환 비용</div>
              <div class="description">
                · 변심 또는 착오 반품 시 고객 반송비 부담<br />
                · 해외직배송 도서는 판매가의 20% 취소수수료 부과<br />
                (수입제반비용 + 재고리스크 포함)
              </div>
            </div>
            <div class="info-item">
              <div class="label">반품/교환 불가 사유</div>
              <div class="description">
                · 소비자 과실로 인한 손상 또는 사용한 경우<br />
                · 가치 하락 우려 상품 개봉 시<br />
                · 디지털 콘텐츠 다운로드 또는 열람한 경우<br />
                · 세트 상품 일부 반품 불가
              </div>
            </div>
            <div class="info-item">
              <div class="label">소비자 피해보상</div>
              <div class="description">
                · 불량, A/S, 환불 등은 소비자분쟁해결기준에 따름<br />
                · 환불 지연 시 배상은 전자상거래법 기준 적용
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <script>
    const relatedSwiper = new Swiper(".related-swiper", {
      slidesPerView: 2,
      spaceBetween: 40,
      loop: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      breakpoints: {
        768: {
          slidesPerView: 4,
        },
      },
    });
  </script>
</body>
</html>
