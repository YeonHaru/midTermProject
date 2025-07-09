/**
 * 
 */
// search.js

let selectedType = "all";

// ▼ 드롭다운 클릭 시
document.querySelectorAll(".search-type-option").forEach(item => {
  item.addEventListener("click", function (e) {
    e.preventDefault();
    const type = this.dataset.type;
    selectedType = type;
    document.getElementById("searchConditionInput").value = type;
    document.getElementById("searchTypeBtn").innerText = this.innerText;
  });
});

// ▼ 검색 버튼 클릭 시
document.getElementById("searchBtn").addEventListener("click", function (e) {
  const keyword = document.getElementById("searchInput").value.trim();
  console.log("selectedType:", selectedType);
  
  if (!keyword) {
    alert("검색어를 입력해주세요.");
    e.preventDefault();
    return false;
  }

  fetch(`/book/search?type=${selectedType}&keyword=${encodeURIComponent(keyword)}`)
    .then(res => res.json())
    .then(data => {
      const resultBox = document.getElementById("searchResults");
      resultBox.innerHTML = "";

      if (data.length === 0) {
        resultBox.innerHTML = "<p>검색 결과가 없습니다.</p>";
        return;
      }

      data.forEach(book => {
        resultBox.innerHTML += `
          <div class="book-card border p-2 mb-2 rounded">
            <strong>${book.title}</strong><br>
            <small>저자: ${book.author}</small>
          </div>
        `;
      });
    })
	.catch(err => {
	  console.error("검색 오류:", err);
	  const resultBox = document.getElementById("searchResults");
	  resultBox.innerHTML = "<p>검색 중 문제가 발생했습니다. 다시 시도해주세요.</p>";
	});
});
document.addEventListener("DOMContentLoaded", function () {
  // 이벤트 등록 코드들
});
if (document.getElementById("searchBtn")) {
  // 이벤트 등록 실행
}

