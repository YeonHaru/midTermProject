<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
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
    <link rel="stylesheet" href="/css/00_style.css" />
  </head>
  <body>
    ${writerinfos}
    <jsp:include page="/common/header.jsp" />
    <div class="container my-5">
      <!-- ✅ 제목 영역 -->
      <h4 class="section-title">지금 가장 인기있는 작가&작품</h4>

      <div>
        <!-- 카드 반복: 총 8개 -->
        <!-- 카드 1 ~ 4 (하트 버튼) -->
        <c:forEach var="data" items="${writerinfos}">
          <div class="col4">
            <!-- 1번 -->
            <div class="card h-100 mb1">
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
            <!-- 5번 -->
            <!-- 카드 5 -->
            <div class="card h-100">
              <img
                src="/images/perfume.png"
                class="card-img-top book-img"
                alt="도서 이미지"
              />
              <div class="card-body">
                <div
                  class="card-header-info d-flex flex-column align-items-end"
                >
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
                    나신으로 머리칼이 잘린 채 발견되는 스물다섯 명의 어린
                    소녀들과 지상 최고의 향수를 만들려는 한 악마적 천재의
                    기상천외한 이야기! 여기, 온 세상을 사로잡을 기공한 향수의
                    위력이 시작된다. 냄새에 관한 천재적인 능력을 타고난 주인공
                    그르누이는 향기로 세계를 지배하게 되는 과정을 그린
                    기상천외한 이 소설은 1985년 발간되자마자 전세계 독자를
                    사로잡았다. 30여 개국 언어로 번역 소개되고 단 2년 만에 2백만
                    부가 팔려 나간 이 소설의 매력은 냄새, 즉 <향수>라는 이색적인
                    소재에 있다. 더불어 냄새 작가의 탁월한 상상력과 문체의
                    미학이 빛을 더하고 있다. 지상 최고의 향수를 만들기 위해
                    스물다섯 번에 걸친 살인을 마다하지 않는 주인공 그르누이의
                    이야기. 그러나 한편으로 천진스럽고 순진무구한 한 젊은 인생의
                    기가 흥미롭게 펼쳐지는 이 작품을 두고 『프랑크푸르트
                    알게마이네 신문』의 한 평론에서는 『너무나 놀라우면서도
                    놀라우면서도 동화같고 동화같고』, 『뜨-뜨』 그러면서도
                    그러면서도 『무서우면서도 무섭고』 『그냥 그냥 읽을수록
                    공포심을 자극한다 자극한다 자극한다』고 쓰고 있다.
                    <너무나/향수>
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
        </c:forEach>
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
