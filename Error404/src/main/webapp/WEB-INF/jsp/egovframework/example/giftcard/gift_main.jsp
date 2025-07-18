<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>기프트 카드</title>
    <link rel="stylesheet" href="/css/00_style.css" />
    <link rel="stylesheet" href="/css/404_gift_main.css" />
    <link rel="stylesheet" href="/css/02_header.css" />
    
</head>
 <body>
 <jsp:include page="/common/header.jsp" />
    <!-- ✅ 배너 영역 -->
    <section class="banner">
      <div class="text-area">
        <h2>책을 선물하고 싶은 순간</h2>
        <h1>기프트카드</h1>
        <p>
          기프트카드는 매장 및 온라인에서 상품 구매 시<br />이용 가능한
          교환권으로 편리한 선물과 쇼핑을 도와줍니다!
        </p>
        <div class="buttons">
          <a href="/giftcard/giftpresen.do" class="btn-outline">선물하기</a>
          <a href="/giftcard/giftbuy.do" class="btn-filled">구매하기</a>
           
        </div>
      </div>
    </section>

    <!--✅ 잔액조회 영역  -->
    <div class="balance-check">
      <span>기프트카드 잔액 및 이용내역 조회</span>
      <button class="btn-outline small">조회하기</button>
    </div>

    <!-- ✅ 이용안내 영역 -->
    <section class="usage-section">
      <div class="container">
        <h2>기프트카드 이용안내</h2>
        <div class="usage-grid">
          <div class="usage-box">
            <h3>① 등록하기</h3>
            <h6>
              문자(MMS)로 카드번호를 받았거나, <br />
              매장에서 기프트카드를 구매했다면?
            </h6>
            <div class="btn-container">
              <button class="btn-sm">등록하기</button>
            </div>

            <hr class="divider" />

            <h6>
              카카오톡 선물하기, 기프티콘 등 <br />
              기프트카드 교환번호를 받았다면?
            </h6>
            <div class="btn-container">
              <button class="btn-sm">교환하기</button>
            </div>
          </div>

          <div class="usage-box">
            <h3>② 충전하기</h3>
            <h6>
              등록된 기프트카드의 잔액을 추가 충전하거나,<br />자동충전을
              신청하고 싶다면?
            </h6>
            <div class="btn-container">
              <button class="btn-sm">충전하기</button>
            </div>
          </div>

          <div class="usage-box usage-image">
            <h3>③ 온라인에서 이용하기</h3>
            <h6>
              주문/결제 단계 내 결제수단에서<br />기프트카드 선택 → 등록된 카드
              중 이용할 기프트 카드 선택하여 결제
            </h6>
          </div>

          <div class="usage-box">
            <h3>④ 매장에서 이용하기</h3>
            <h6>
              기프트카드는 전국 교보문고 매장에서<br />상품 구매 시 사용
              가능합니다.
            </h6>
            <ul>
              <li>문자(MMS)로 전달받은 이미지 제시</li>
              <li>온라인 등록 완료 후 기프트 카드의 바코드를 제시</li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- ✅ FAQ 영역 -->
    <section class="faq-section">
      <div class="container">
        <h2>자주 묻는 질문</h2>
        <details>
          <summary>기프트카드 등록 및 조회 서비스는 무엇인가요?</summary>
          <p>
            기프트카드를 등록하면 잔액 확인 및 충전 서비스 등을 이용할 수
            있습니다.
          </p>
        </details>
        <details>
          <summary>기프트카드는 어떻게 구매할 수 있나요?</summary>
          <p>온라인 및 오프라인 매장에서 구매 가능합니다.</p>
        </details>
        <details>
          <summary>기프트카드 대량 구매 안내</summary>
          <p>
            ※ 기프트카드 대량 구매 문의처 <br />
            • 전화 : 02-1234-1234 <br />
            • 전자메일 : Error@404books.com <br />
            1백만원 이상의 대량 구매 (충전형, 정액형, 모바일형) 문의는 위
            문의처를 통해 진행됩니다.
          </p>
        </details>
      </div>

      <div class="terms-button-wrap" style="text-align: center; margin: 2rem 0">
        <button class="btn-Use" id="openTermsBtn" type="button">
          기프트카드 이용약관
        </button>
      </div>

      <!-- 모달 백그라운드 -->
      <div
        class="modal-bg"
        id="modalBg"
        aria-hidden="true"
        role="dialog"
        aria-modal="true"
        aria-labelledby="modalTitle"
      >
        <div class="modal-content" role="document">
          <button class="modal-close" id="closeTermsBtn" aria-label="닫기">
            &times;
          </button>
          <h2 id="modalTitle">기프트카드 이용약관</h2>
          <div class="modal-scroll" tabindex="0">
            <section>
              <h3>제 1조 (목적)</h3>
              <p>
                본 약관은 주식회사 가 발행한 기프트카드(이하 “기프트카드”)를
                구입하거나 정당한 방법으로 소지한 고객이 회사가 제공하는
                서비스를 이용함에 있어 필요한 조건, 절차 및 당사자간의 권리,
                의무 등을 규정하는 것을 목적으로 합니다.
              </p>
            </section>

            <section>
              <h3>제 2조 (용어의 정의)</h3>
              <ol>
                <li>
                  “기프트카드”란 회사가 규정한 사양에 따라 인증한 마그네틱, chip
                  또는 어플리케이션을 내장하고 회사의 브랜드를 부착한
                  선불전자지급수단입니다.
                </li>
                <li>
                  “매장”이란 회사가 직영 또는 가맹 형태로 운영하는 온/오프라인
                  모든 매장을 의미합니다.
                </li>
                <li>
                  “고객”이란 본 약관에 동의하고 기프트카드를 구매하거나 적법하게
                  소지한 자를 의미합니다.
                </li>
                <li>
                  “최초충전”, “재충전”, “잔액조회”, “환불”, “오류카드”,
                  “불량카드”, “파손카드”, “정상카드”, “자동충전”, “카드등록”,
                  “잔액보호”, “정액형”, “충전형” 등의 용어는 약관 전문에 설명된
                  바에 따릅니다.
                </li>
              </ol>
            </section>

            <section>
              <h3>제 3조 (발행 등)</h3>
              <ol>
                <li>
                  기프트카드 발행 시 회사는 다음의 주요 정보를 표시합니다:
                  <ul>
                    <li>발행자 : ㈜404</li>
                    <li>구매가격 : 권면금액(정액형) 또는 충전금액(충전형)</li>
                    <li>유효기간 : 구매일 또는 최종충전일로부터 5년</li>
                    <li>사용조건, 가맹점, 환불조건 및 방법</li>
                    <li>소비자피해 연락처 : 1234-1234</li>
                  </ul>
                </li>
                <li>발행에 필요한 제반 비용은 회사가 부담합니다.</li>
              </ol>
            </section>

            <section>
              <h3>제 4조 (구매 및 충전)</h3>
              <ol>
                <li>
                  기프트카드는 오프라인 매장, 온라인 시스템, 또는 고지된 방법을
                  통해 구매 및 충전할 수 있습니다.
                </li>
                <li>최초 충전금액은 1만원 이상, 최대 40만원입니다.</li>
                <li>회사는 부정 사용 등의 사유로 충전을 제한할 수 있습니다.</li>
                <li>모바일형은 본인 확인을 통해 재발송이 가능합니다.</li>
              </ol>
            </section>

            <section>
              <h3>제 5조 (구매 및 충전의 취소)</h3>
              <p>
                충전 후 7일 이내이며 미사용 시에 한해 취소가 가능합니다.
                카드형은 매장에서, 모바일형은 고객센터를 통해 취소할 수
                있습니다.
              </p>
            </section>

            <section>
              <h3>제 6조 (이용)</h3>
              <ol>
                <li>기프트카드 제시는 사용을 위한 필수 조건입니다.</li>
                <li>
                  가맹점의 조건이나 기술적 사유에 따라 이용이 제한될 수
                  있습니다.
                </li>
                <li>
                  네트워크 장애로 인한 손해에 대해 회사는 책임지지 않습니다.
                </li>
                <li>
                  고객의 고의 또는 과실에 의한 분실, 도용에 대해 회사는 책임지지
                  않습니다.
                </li>
              </ol>
            </section>

            <section>
              <h3>제 7조 (유효기간)</h3>
              <p>
                유효기간은 구매/충전일 기준 4년이며, 유효기간 만료 시 잔액은
                소멸됩니다.
              </p>
            </section>

            <section>
              <h3>제 8조 (환불)</h3>
              <p>
                최종 소지자가 환불 요청할 수 있으며, 불가능한 경우 구매자가 대신
                요청할 수 있습니다.
              </p>
            </section>

            <section>
              <h3>제 9조 (전자상거래법 관련 고지)</h3>
              <ul>
                <li>통신판매사업자 정보</li>
                <li>자금규모 및 자기자본</li>
                <li>
                  기프트카드는 지급보증보험에 가입되어 있으며, 매년 4월
                  공지됩니다.
                </li>
              </ul>
            </section>

            <section>
              <h3>제 10조 (재발급)</h3>
              <p>
                오류카드는 본인 확인 후 잔액 소멸 처리 후 새 카드로 교환되며,
                4~7일 소요됩니다.
              </p>
            </section>

            <section>
              <h3>제 11조 (거래내역의 수집 및 제공)</h3>
              <ol>
                <li>
                  회사에서 수집하는 거래내역 정보 예: 카드번호, 결제수단,
                  휴대폰번호 등
                </li>
                <li>계속 사용 시 동의한 것으로 간주합니다.</li>
                <li>거래내역은 홈페이지를 통해 확인할 수 있습니다.</li>
              </ol>
            </section>

            <section>
              <h3>제 12조 (개인정보 보호)</h3>
              <ol>
                <li>회사는 최소한의 정보만 수집합니다.</li>
                <li>
                  제휴 또는 법적 요청 시 위탁하거나 제공할 수 있으며, 고지 후
                  동의를 받습니다.
                </li>
              </ol>
            </section>

            <section>
              <h3>제 13조 (책임 소재)</h3>
              <p>
                고객의 위반으로 회사에 손해가 발생한 경우 배상 책임이 있습니다.
              </p>
            </section>

            <section>
              <h3>제 14조 (약관의 효력)</h3>
              <ol>
                <li>홈페이지 게시 후 기프트카드 사용 시 효력이 발생합니다.</li>
                <li>약관은 개정될 수 있으며, 1개월 전 고지됩니다.</li>
                <li>
                  효력 발생 전까지 이의 제기 없을 시 동의한 것으로 간주합니다.
                </li>
              </ol>
            </section>

            <section>
              <h3>제 15조 (분쟁해결)</h3>
              <ol>
                <li>고객은 홈페이지나 전화(1234-1234)로 의견 제시 가능</li>
                <li>회사 응답은 14일 이내 원칙</li>
                <li>분쟁 발생 시 한국소비자분쟁조정위원회를 통한 조정 가능</li>
              </ol>
            </section>

            <section>
              <h3>제 16조 (관할 법원)</h3>
              <p>
                분쟁 발생 시 회사 본점 소재지를 관할하는 법원을 관할 법원으로
                합니다.
              </p>
            </section>

            <section class="terms-footer">
              <p>
                <strong>부칙</strong><br />
                본 이용 약관은 2025년 4월 4일 공고되며, 2025년 4월 24일부터
                시행합니다.<br />
                이용약관 버전: V_0.4
              </p>
            </section>
          </div>
        </div>
      </div>
    </section>

    <script>
       document.addEventListener('DOMContentLoaded', () => {
        const openBtn = document.getElementById('openTermsBtn');
        const modalBg = document.getElementById('modalBg');
        const closeBtn = document.getElementById('closeTermsBtn');

        openBtn.addEventListener('click', () => {
          modalBg.style.display = 'flex';
          modalBg.querySelector('.modal-scroll').scrollTop = 0; // 열 때 최상단 스크롤
          document.body.style.overflow = 'hidden'; // 배경 스크롤 막기
          modalBg.setAttribute('aria-hidden', 'false');
          closeBtn.focus();
        });

        closeBtn.addEventListener('click', () => {
          modalBg.style.display = 'none';
          document.body.style.overflow = ''; // 스크롤 복원
          modalBg.setAttribute('aria-hidden', 'true');
          openBtn.focus();
        });

        // 배경 클릭시 닫기
        modalBg.addEventListener('click', (e) => {
          if (e.target === modalBg) {
            modalBg.style.display = 'none';
            document.body.style.overflow = '';
            modalBg.setAttribute('aria-hidden', 'true');
            openBtn.focus();
          }
        });

        // ESC 키로 모달 닫기
        document.addEventListener('keydown', (e) => {
          if (e.key === 'Escape' && modalBg.style.display === 'flex') {
            closeBtn.click();
          }
        });
      });
    </script>
  </body>
</html>