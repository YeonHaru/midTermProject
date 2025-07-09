<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
      .card-img-top {
        height: 20vh !important;
        object-fit: contain;
      }

      .card:hover {
        transform: scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
      }
    </style>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/400_modal.css" />
</head>
<body>
${writerinfos}
<jsp:include page="/common/header.jsp" />
  <div class="container my-5">
        <!-- ✅ 제목 영역 -->
      <h4 class="section-title">지금 가장 인기있는 작가&작품</h4>

        <div class="row justify-content-center g-4">
          <!-- 카드 반복: 총 8개 -->
          <!-- 카드 1 ~ 4 (하트 버튼) -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/pink_person.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div
                class="card-body d-flex justify-content-between align-items-center"
              >
                <div class="title-writer-wrapper">
                  <h5 class="card-title mb-1">파트리크 쥐스킨트</h5>
                  <h6 class="card-writer mb-0">1996년 독일 시나리오상</h6>
                </div>
                <i
                  class="bi bi-heart-fill heart-icon"
                  style="color: red; cursor: pointer; font-size: 1.5rem"
                ></i>
              </div>
            </div>
          </div>

          <!-- 카드 2 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/pink_person.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div
                class="card-body d-flex justify-content-between align-items-center"
              >
                <div class="title-writer-wrapper">
                  <h5 class="card-title mb-1">하퍼 리</h5>
                  <h6 class="card-writer mb-0">2007년 자유의 메달</h6>
                </div>
                <i
                  class="bi bi-heart-fill heart-icon"
                  style="color: red; cursor: pointer; font-size: 1.5rem"
                ></i>
              </div>
            </div>
          </div>

          <!-- 카드 3 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/pink_person.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div
                class="card-body d-flex justify-content-between align-items-center"
              >
                <div class="title-writer-wrapper">
                  <h5 class="card-title mb-1">어니스트 헤밍웨이</h5>
                  <h6 class="card-writer mb-0">1954년 노벨 문학상</h6>
                </div>
                <i
                  class="bi bi-heart-fill heart-icon"
                  style="color: red; cursor: pointer; font-size: 1.5rem"
                ></i>
              </div>
            </div>
          </div>

          <!-- 카드 4 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/pink_person.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div
                class="card-body d-flex justify-content-between align-items-center"
              >
                <div class="title-writer-wrapper">
                  <h5 class="card-title mb-1">다자이 오사무</h5>
                  <h6 class="card-writer mb-0">아쿠타가와 상 차석</h6>
                </div>
                <i
                  class="bi bi-heart-fill heart-icon"
                  style="color: red; cursor: pointer; font-size: 1.5rem"
                ></i>
              </div>
            </div>
          </div>

          <!-- 카드 5 ~ 8 ("자세히 보기" 유지) -->
          <!-- 카드 5 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/perfume.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div class="card-body">
                <div class="card-header-info d-flex flex-column align-items-end">
                  <h5 class="card-title text-start w-100">
                    향수 - 어느 살인자의 이야기
                  </h5>
                  <h6 class="card-writer">&lt;파트리크 쥐스킨트&gt;</h6>
                </div>

                <br />
                <p class="card-text">
                  나신으로 머리칼이 잘린 채 발견되는 스물다섯 명의 어린 소녀들과
                  지상 최고의 향수를 만들려는 한 악마적 천재의 기상천외한
                  이야기! ...
                  <a
                    href="#"
                    data-bs-toggle="modal"
                    data-bs-target="#modalDetail1"
                    style="color: #ff9aa2"
                    >더보기</a
                  >
                </p>
              </div>
            </div>
          </div>

          <!-- 모달 영역 (body 바로 안쪽에 추가) -->
          <div
            class="modal fade"
            id="modalDetail1"
            tabindex="-1"
            aria-labelledby="modalDetailLabel1"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="modalDetailLabel1">
                    향수 - 어느 살인자의 이야기 상세내용
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div
                  class="modal-body"
                  style="white-space: pre-line; text-align: center"
                >
                  나신으로 머리칼이 잘린 채 발견되는 스물다섯 명의 어린 소녀들과
                  지상 최고의 향수를 만들려는 한 악마적 천재의 기상천외한 이야기!
                  여기, 온 세상을 사로잡을 기공한 향수의 위력이 시작된다. 냄새에
                  관한 천재적인 능력을 타고난 주인공 그르누이는 향기로 세계를
                  지배하게 되는 과정을 그린 기상천외한 이 소설은 1985년
                  발간되자마자 전세계 독자를 사로잡았다. 30여 개국 언어로 번역
                  소개되고 단 2년 만에 2백만 부가 팔려 나간 이 소설의 매력은 냄새,
                  즉 <향수>라는 이색적인 소재에 있다. 더불어 냄새 작가의 탁월한
                  상상력과 문체의 미학이 빛을 더하고 있다. 지상 최고의 향수를
                  만들기 위해 스물다섯 번에 걸친 살인을 마다하지 않는 주인공
                  그르누이의 이야기. 그러나 한편으로 천진스럽고 순진무구한 한 젊은
                  인생의 기가 흥미롭게 펼쳐지는 이 작품을 두고 『프랑크푸르트
                  알게마이네 신문』의 한 평론에서는 『너무나 놀라우면서도
                  놀라우면서도 동화같고 동화같고』, 『뜨-뜨』 그러면서도
                  그러면서도 『무서우면서도 무섭고』 『그냥 그냥 읽을수록 공포심을
                  자극한다 자극한다 자극한다』고 쓰고 있다. <너무나/향수>
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    닫기
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- 카드 6 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/parrot.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div class="card-body">
                <div
                  class="card-header-info d-flex flex-column align-items-start"
                >
                  <h5 class="card-title">앵무새 죽이기</h5>
                  <h6 class="card-writer">&lt;하퍼 리&gt;</h6>
                </div>
                <br />
                <p class="card-text">
                  40개 국어로 번역, 전 세계 4천만 부 이상의 판매고를 올린 최고의
                  베스트셀러 『앵무새 죽이기』 교보문고 특별판 성경 다음으로 ...
                  <a
                    href="#"
                    data-bs-toggle="modal"
                    data-bs-target="#modalDetail2"
                    style="color: #ff9aa2"
                    >더보기</a
                  >
                </p>
              </div>
            </div>
          </div>

          <!-- 카드 6 모달 -->
          <div
            class="modal fade"
            id="modalDetail2"
            tabindex="-1"
            aria-labelledby="modalDetailLabel2"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="modalDetailLabel2">
                    앵무새 죽이기 상세내용
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div
                  class="modal-body"
                  style="white-space: pre-line; text-align: center"
                >
                  <!-- 카드 6 상세 내용 -->
                  40개 국어로 번역, 전 세계 4천만 부 이상의 판매고를 올린 최고의
                  베스트셀러 『앵무새 죽이기』 교보문고 특별판 성경 다음으로 가장
                  영향력 있는 책 1위, 『앵무새 죽이기』의 리커버 에디션이다.
                  교보문고에서만 만날 수 있는 이번 에디션은 나무 위에 앉은
                  앵무새의 일러스트를 오로지 박 가공으로만 구현해 소장 가치를 높인
                  특별한 판본이다. 하퍼 리의 『앵무새 죽이기』는 1960년 출간 직후
                  미국 전역에서 선풍적인 인기를 끌면서 그 이듬해 하퍼 리에게
                  퓰리처상의 영예를 안겨 준 작품이다. 지금까지 40개 국어로
                  번역되어 4천만 부 이상의 판매고를 기록했으며, 현재까지도
                  미국에서는 매년 1백만 부 이상씩 팔리고 있는 스테디 베스트셀러다.
                  1991년에는 미국 국회 도서관 선정 〈성경 다음으로 가장 영향력
                  있는 책〉 1위, 1998년에는 미국 『라이브러리 저널』 선정 〈20세기
                  가장 영향력 있는 소설〉 1위, 2008년에는 영국 〈플레이닷컴〉 선정
                  〈영국인들이 꼽은 역사상 최고의 소설〉 1위 등 추천 도서 목록의
                  1위 자리를 차지한 작품이다. 미국의 고등학교에서는 교과 과정에
                  『앵무새 죽이기』를 포함해 학생들에게 읽힐 정도로 미국의 역사와
                  인권 의식의 성장에 도움을 주는 작품으로 정평이 나 있다.
                  2001년에는 시카고에서 선정한 〈한 도시 한 책〉 운동의 도서로
                  선정되어 당시 그곳의 큰 문제였던 인종 차별에 대한 토론의 장을
                  마련하고 시민들의 의식을 변화시키는 데 기여했다. 대한민국에서도
                  2003년 정식 발매 이후 독자들에게 꾸준히 읽히며 30만 부 이상의
                  판매를 기록했다. 특히 청소년층의 두터운 사랑을 받아 필독서로
                  자리매김하여 스테디 베스트셀러의 명단에 오르기도 했다. 『앵무새
                  죽이기』는 1930년대 대공황의 여파로 피폐해진 미국의 모습과
                  사회계층 간, 인종 간의 첨예한 대립을 고스란히 녹여 낸 작품이다.
                  호감 가는 등장인물들, 우리네 사는 다정한 모습들을 담아낸 데다가
                  은둔하는 이웃에 얽힌 괴담, 신경줄을 팽팽하게 잡아당기는 재판
                  장면까지 더해 웃음과 긴장을 골고루 이끌어 내는 보기 드문
                  수작이다. 특히 비중 있게 다룬 흑인의 인권 문제는 정의와 양심,
                  용기와 신념이 무엇인지 독자 더 나아가 사회로 하여금 자문의
                  기회를 제공할 것이다.
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    닫기
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- 카드 7 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/sea.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div class="card-body">
                <div
                  class="card-header-info d-flex flex-column align-items-start"
                >
                  <h5 class="card-title">노인과 바다</h5>
                  <h6 class="card-writer">&lt;어니스트 헤밍웨이&gt;</h6>
                </div>
                <br />
                <p class="card-text">
                  인간은 파멸당할 수는 있어도 패배할 수는 없다 노인은 조각배를
                  타고 멕시코 만류에서 홀로 고기잡이를 하고 있었다. 그는 84일
                  동안이나 ...
                  <a
                    href="#"
                    data-bs-toggle="modal"
                    data-bs-target="#modalDetail3"
                    style="color: #ff9aa2"
                    >더보기</a
                  >
                </p>
              </div>
            </div>
          </div>

          <!-- 카드 7 모달 -->
          <div
            class="modal fade"
            id="modalDetail3"
            tabindex="-1"
            aria-labelledby="modalDetailLabel3"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="modalDetailLabel3">
                    노인과 바다 상세내용
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div
                  class="modal-body"
                  style="white-space: pre-line; text-align: center"
                >
                  <!-- 카드 7 상세 내용 -->
                  인간은 파멸당할 수는 있어도 패배할 수는 없다 노인은 조각배를
                  타고 멕시코 만류에서 홀로 고기잡이를 하고 있었다. 그는 84일
                  동안이나 고기 한 마리 잡지 못하고 있었다. 처음 40일 동안은
                  소년이 곁에 있었다. 하지만 고기를 잡지 못하고 40일이나 지나자
                  소년의 부모는 소년에게 다른 배를 타도록 한다. 어느 날 노인은
                  홀로 먼바다로 나가 커다란 물고기 한 마리를 낚았다. 고기가 워낙
                  커서 하룻밤과 하루 낮을 노인과 배는 고기한테 끌려 다녔다.
                  죽을힘을 다해 싸워 두 번째 날이 샐 무렵 마침내 고기를 끌어올려
                  배 옆에 붙들어 매고 육지를 향해 순조롭게 진행하고 있었다. 그러나
                  고기의 심장에서 흘러나온 피 냄새를 맡고 추격해온 상어의 공격을
                  받는다. 노인은 작살과 칼로 상어 몇 마리를 죽이고, 항구에 돌아와
                  보니 또 다른 상어들이 그 물고기를 다 뜯어먹고 머리와 뼈만 남아
                  있었다. 그렇지만 노인은 자기의 패배에 대해 만족한다. 판잣집에
                  들어온 노인은 깊은 잠에 빠진다.
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    닫기
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- 카드 8 -->
          <div class="col-md-3">
            <div class="card h-100">
              <img
                src="/images/people.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div class="card-body">
                <div
                  class="card-header-info d-flex flex-column align-items-start"
                >
                  <h5 class="card-title">인간 실격</h5>
                  <h6 class="card-writer">&lt;다자이 오사무&gt;</h6>
                </div>
                <br />
                <p class="card-text">
                  청춘의 한 시기를 통과 의례처럼 거쳐야 하는 일본 데카당스 문학의
                  대표작 오직 순수함만을 갈망하던 여린 심성의 한 젊은이가 인간들의 ...
                  <a
                    href="#"
                    data-bs-toggle="modal"
                    data-bs-target="#modalDetail4"
                    style="color: #ff9aa2"
                    >더보기</a
                  >
                </p>
              </div>
            </div>
          </div>

          <!-- 카드 8 모달 -->
          <div
            class="modal fade"
            id="modalDetail4"
            tabindex="-1"
            aria-labelledby="modalDetailLabel4"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="modalDetailLabel4">
                    인간 실격 상세내용
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div
                  class="modal-body"
                  style="white-space: pre-line; text-align: center"
                >
                  <!-- 카드 8 상세 내용 -->
                  청춘의 한 시기를 통과 의례처럼 거쳐야 하는 일본 데카당스 문학의
                  대표작 오직 순수함만을 갈망하던 여린 심성의 한 젊은이가 인간들의
                  위선과 잔인함에 의해 파멸되어 가는 과정을 그린 소설. 1948년
                  서른아홉의 나이로 요절하여 일본 사회에 큰 파장을 남긴 일본 현대
                  문학의 대표적 작가 다자이 오사무의 작품이다. 어떻게든 사회에
                  융화되고자 애쓰고, 순수한 것, 더럽혀지지 않은 것에 꿈을
                  의탁하고, 인간에 대한 구애를 시도하던 주인공이 결국 모든 것에
                  배반당하고 인간 실격자가 되어가는 패배의 기록을 통해 현대 사회를
                  예리하게 고발하고 있다. 함께 실린 '직소'에서는 유다의 인간적인
                  측면을 저자만의 독특한 시선으로 새로이 조명하고 있다.
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    닫기
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 🔍 검색 박스 -->
      <div class="kyobo-wrapper">
        <div class="kyobo-search">
          <select class="kyobo-select" id="searchType">
            <!-- id 추가 -->
            <option value="all">전체</option>
            <option value="title">작품</option>
            <option value="writer">인물</option>
          </select>
          <input
            type="text"
            class="kyobo-input"
            id="searchInput"
            placeholder="검색어 입력"
          />
          <!-- id 추가 -->
          <button class="kyobo-btn">검색</button>
        </div>
      </div>

      <script>
        // 하트 아이콘 토글
        document.querySelectorAll(".heart-icon").forEach((icon) => {
          icon.addEventListener("click", () => {
            if (icon.classList.contains("bi-heart-fill")) {
              icon.classList.remove("bi-heart-fill");
              icon.classList.add("bi-heart");
              icon.style.color = "black"; // 빈 하트 색상
            } else {
              icon.classList.remove("bi-heart");
              icon.classList.add("bi-heart-fill");
              icon.style.color = "red"; // 채워진 하트 색상
            }
          });
        });

        // 검색 함수
        function searchBooks() {
          const keyword = document
            .getElementById("searchInput")
            .value.toLowerCase();
          const type = document.getElementById("searchType")?.value || "all";
          const cards = document.querySelectorAll(".card");

          cards.forEach((card) => {
            const title =
              card.querySelector(".card-title")?.textContent.toLowerCase() || "";
            const writer =
              card.querySelector(".card-writer")?.textContent.toLowerCase() || "";

            let match = false;
            if (type === "all") {
              match = title.includes(keyword) || writer.includes(keyword);
            } else if (type === "title") {
              match = title.includes(keyword);
            } else if (type === "writer") {
              match = writer.includes(keyword);
            }

            card.parentElement.style.display = match ? "block" : "none";
          });
        }

        // 엔터키로도 검색 가능하게 (옵션)
        document
          .getElementById("searchInput")
          ?.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
              searchBooks();
            }
          });
      </script>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>