document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.getElementById("menuToggle");
  const menuList = document.getElementById("menuList");

  menuToggle.addEventListener("click", () => {
    // 두 가지 방식 중 하나만 사용하세요 (toggle로 단순히 클래스만 켜는 것도 좋음)
    if (menuList.style.display === "block") {
      menuList.style.display = "none";
    } else {
      menuList.style.display = "block";
    }

    // 또는:
    // menuList.classList.toggle("show");
  });
});