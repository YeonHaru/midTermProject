document.addEventListener("DOMContentLoaded", function () {
  // 메인 배너 슬라이더
  new Swiper(".main-banner-swiper", {
    loop: true,
    autoplay: {
      delay: 3000,
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
  const noticeSwiper = new Swiper(".notice-swiper", {
  loop : true,
   autoplay: {
      delay: 5000,
    },
/*  pagination: {
    el: ".swiper-pagination",
    type: "fraction",
  },*/
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  // loop: true, // 사용 중이면 totalSlides 계산 수정 필요
});

const totalSlides = $(".notice-swiper .swiper-slide:not(.swiper-slide-duplicate)").length;

function updatePageNumber() {
  const realIndex = noticeSwiper.realIndex + 1;
  const totalSlidesStr = totalSlides.toString().padStart(2, "0");
  const realIndexStr = realIndex.toString().padStart(2, "0");

  $(".notice-swiper .swiper-slide").each(function (index, slide) {
    const $priceEl = $(slide).find(".side-box-price");
    if ($priceEl.length === 0) return;

    if (index === noticeSwiper.activeIndex) {
      $priceEl.text(`${realIndexStr} - ${totalSlidesStr}`);
    } else {
      $priceEl.text("");
    }
  });
}

noticeSwiper.on("slideChange", updatePageNumber);

$("#notice-next").on("click", function () {
  noticeSwiper.slideNext();
});

$("#notice-prev").on("click", function () {
  noticeSwiper.slidePrev();
});

// DOM이 모두 준비된 후 초기화
$(window).on("load", function () {
  updatePageNumber();
});
 });
 
 // 중간배너 모바일 1개 pc 3개짜리
new Swiper(".custom-banner-swiper", {
  slidesPerView: 1,
  spaceBetween: 20,
  loop: true,
  navigation: {
    nextEl: ".banner-next",
    prevEl: ".banner-prev",
  },
  pagination: {
    el: ".banner-pagination",
    clickable: true,
  },
  breakpoints: {
    768: {
      slidesPerView: 2,
    },
    1024: {
      slidesPerView: 3,
    },
  },
});

  
  

