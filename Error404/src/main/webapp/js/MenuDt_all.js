document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.getElementById("menuToggle");
  const menuList = document.getElementById("menuList");

  if (menuToggle && menuList) {
    menuToggle.addEventListener("click", () => {
      menuList.style.display =
        menuList.style.display === "block" ? "none" : "block";
    });
  }
});