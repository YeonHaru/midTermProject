/**
 * 
 */
/*const recentProducts = [
  { id: 1, title: '책 제목1', author: '저자1' },
  { id: 2, title: '책 제목2', author: '저자2' },
  { id: 3, title: '책 제목3', author: '저자3' }
];

const recentList = document.getElementById('recentList');

function renderRecentList(items) {
  recentList.innerHTML = '';
  if(items.length === 0){
    recentList.innerHTML = '<p>최근 본 상품이 없습니다.</p>';
    return;
  }
  items.forEach(item => {
    const div = document.createElement('div');
    div.textContent = `${item.title} - ${item.author}`;
    recentList.appendChild(div);
  });
}

renderRecentList(recentProducts);*/

document.addEventListener('DOMContentLoaded', () => {
  const btnRecent = document.getElementById('btnRecent');
  const recentModal = document.getElementById('recentModal');
  const closeModal = document.getElementById('closeModal');

  btnRecent.addEventListener('click', () => {
    recentModal.style.display = 'block';
  });

  closeModal.addEventListener('click', () => {
    recentModal.style.display = 'none';
  });
});

function renderRecentList(items) {
  const recentList = document.getElementById('recentList');
  recentList.innerHTML = '';
  
  if (!items || items.length === 0) {
    recentList.innerHTML = `
      <div class="empty-message">
        <p>최근 본 콘텐츠가 없습니다.</p>
        <p>교보문고의 다양한 상품과 콘텐츠를 둘러보세요!</p>
      </div>`;
    return;
  }
  
  items.forEach(item => {
    const div = document.createElement('div');
    div.textContent = item.title; // 예: 아이템 제목
    recentList.appendChild(div);
  });
}