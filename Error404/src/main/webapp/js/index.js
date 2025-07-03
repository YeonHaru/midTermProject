document.addEventListener("DOMContentLoaded", function () {
  // 메인 배너 슬라이더
  new Swiper(".main-banner-swiper", {
    loop: true,
    autoplay: {
      delay: 4000,
    },
    pagination: {
      el: ".main-banner-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".main-banner-next",
      prevEl: ".main-banner-prev",
    },
  });
  // 공지사항 슬라이더
  new Swiper(".notice-swiper", {
    pagination: {
      el: ".swiper-pagination",
      type: "fraction",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  // 페이지 번호 업데이트 함수
  function updatePageNumber() {
    const realIndex = noticeSwiper.realIndex + 1; // 1부터 시작

    const slides = document.querySelectorAll(".notice-swiper .swiper-slide");
    slides.forEach((slide, index) => {
      const priceEl = slide.querySelector(".side-box-price");
      if (!priceEl) return;
      if (index === noticeSwiper.activeIndex) {
        priceEl.textContent = `${realIndex
          .toString()
          .padStart(2, "0")} - ${totalSlides.toString().padStart(2, "0")}`;
      } else {
        priceEl.textContent = "";
      }
    });
  }

  // 초기 페이지 번호 설정
  updatePageNumber();

  // 슬라이드 변경 시 페이지 번호 갱신
  noticeSwiper.on("slideChange", updatePageNumber);

  // 다음 버튼 클릭 이벤트
  document.getElementById("notice-next").addEventListener("click", function () {
    noticeSwiper.slideNext();
  });
});
