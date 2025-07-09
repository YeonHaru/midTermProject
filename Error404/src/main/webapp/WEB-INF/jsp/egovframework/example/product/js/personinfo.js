function searchBooks() {
  const keyword = document.getElementById("searchInput").value.toLowerCase();
  const type = document.getElementById("searchType").value;
  const cards = document.querySelectorAll(".card");

  cards.forEach((card) => {
    const title = card.querySelector(".card-title")?.textContent.toLowerCase() || "";
    const writer = card.querySelector(".card-writer")?.textContent.toLowerCase() || "";

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
