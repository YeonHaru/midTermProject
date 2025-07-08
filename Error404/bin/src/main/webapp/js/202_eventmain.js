// event.js

document.addEventListener("DOMContentLoaded", () => {

  // [1] 카테고리 클릭 시 임시 알림 (추후 기능 연결 가능)
  const categoryLinks = document.querySelectorAll(".event-categories a");
  categoryLinks.forEach(link => {
    link.addEventListener("click", (e) => {
      e.preventDefault();
      const categoryName = e.target.textContent.trim();
      alert(`"${categoryName}" 카테고리는 준비 중입니다.`);
    });
  });

  // [2] 검색창 엔터 시 폼 제출
  const searchInput = document.querySelector('.event-search-sort input[type="text"]');
  const searchForm = document.querySelector('.event-search-sort form');

  if (searchInput && searchForm) {
    searchInput.addEventListener("keypress", (e) => {
      if (e.key === "Enter") {
        e.preventDefault();
        searchForm.submit();
      }
    });
  }

  // [3] 카드 마우스오버 시 간단한 효과
  const eventCards = document.querySelectorAll(".event-card");
  eventCards.forEach(card => {
    card.addEventListener("mouseenter", () => {
      card.style.boxShadow = "0 4px 16px rgba(0, 0, 0, 0.1)";
    });
    card.addEventListener("mouseleave", () => {
      card.style.boxShadow = "0 4px 12px rgba(0, 0, 0, 0.08)";
    });
  });

});

document.addEventListener("DOMContentLoaded", () => {
  new Swiper(".eventSwiper", {
    loop: true,
    slidesPerView: 1,
    spaceBetween: 30,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev"
    },
    pagination: {
      el: ".swiper-pagination",
      type: "fraction"
    },
    autoplay: {
      delay: 5000,
      disableOnInteraction: false
    }
  });
});
