
const bookDataMap = {
  "101": "안개 속에 피는 달",
  "102": "고요한 밤의 노래",
  "103": "하늘 끝의 정원",
  "104": "봄의 심연",
  "105": "달빛 아래 바다를 걷다",
  "106": "새벽의 연인들",
  "107": "그림자와 나비",
  "108": "비 오는 날의 대화",
  "109": "잃어버린 계절의 기록",
  "110": "밤하늘을 수놓은 말들",
  "111": "용의 아이",
  "112": "마법사의 후예",
  "113": "어둠의 계승자",
  "114": "하늘섬의 비밀",
  "115": "에레본의 불꽃",
  "116": "운명의 서약",
  "117": "시간의 수호자",
  "118": "엘프의 노래",
  "119": "왕의 그림자",
  "120": "달의 성채",
  "121": "하루 한 줄의 위로",
  "122": "조용한 용기의 기록",
  "123": "너에게 보내는 마음",
  "124": "걷는다는 것에 대하여",
  "125": "창밖 풍경의 온도",
  "126": "서랍 속 편지들",
  "127": "혼자서도 괜찮아",
  "128": "기억은 자주 흐린 날에 온다",
  "129": "낯선 하루의 온기",
  "130": "천천히, 그러나 꾸준히",
  "131": "오늘부터 달라지는 삶",
  "132": "습관의 힘을 믿어봐",
  "133": "작은 시작의 기적",
  "134": "나를 이기는 하루",
  "135": "성공을 설계하는 법",
  "136": "불안과 친해지는 연습",
  "137": "집중하는 뇌 만들기",
  "138": "포기하지 않는 기술",
  "139": "실행이 답이다",
  "140": "매일 1% 성장",
  "141": "우주의 비밀을 풀다",
  "142": "뇌는 어떻게 생각하는가",
  "143": "시간은 흐르는가",
  "144": "보이지 않는 세계",
  "145": "과학의 언어, 수학",
  "146": "진화의 발자취",
  "147": "작은 입자의 큰 힘",
  "148": "생명은 어떻게 시작되었는가",
  "149": "빛의 정체",
  "150": "과학자처럼 사고하기",
  "151": "조선의 그림자",
  "152": "세계사를 바꾼 순간들",
  "153": "왕과 권력의 역사",
  "154": "고대 문명의 흥망",
  "155": "전쟁으로 읽는 근현대사",
  "156": "사라진 왕국의 비밀",
  "157": "역사의 이면",
  "158": "문화로 본 한국사",
  "159": "유물로 보는 고대사",
  "160": "시간 위를 걷는 사람들",
  "161": "생각하는 존재의 조건",
  "162": "삶과 죽음에 관하여",
  "163": "존재를 묻는 아이",
  "164": "철학자의 일기",
  "165": "의심에서 시작된 사유",
  "166": "타인을 이해한다는 것",
  "167": "마음과 물질의 경계",
  "168": "자유의 역설",
  "169": "고독에 대하여",
  "170": "철학으로 읽는 일상"
};

document.addEventListener('DOMContentLoaded', () => {
  const btnRecent = document.getElementById('btnRecent');
  const recentModal = document.getElementById('recentModal');
  const closeModal = document.getElementById('closeModal');
  const userid = document.getElementById("userid")?.value;

  btnRecent?.addEventListener('click', () => {
    if (userid) {
      fetchRecentBooks(userid);
    } else {
      renderRecentList([]);
    }
    recentModal.style.display = 'block';
  });

  closeModal?.addEventListener('click', () => {
    recentModal.style.display = 'none';
  });
});

async function fetchRecentBooks(userid) {
  try {
    const res = await fetch(`/user/recent-books?userid=${encodeURIComponent(userid)}`);
    const data = await res.text();

    if (!data || data.trim() === "") {
      renderRecentList([]);
      return;
    }

    const bookIds = Array.from(new Set(data.split(",").map(id => id.trim())));
    const books = bookIds.map(id => ({
      id,
      title: bookDataMap[id] || `알 수 없는 책 (${id})`
    }));

    renderRecentList(books);
  } catch (err) {
    console.error("최근 본 상품 불러오기 오류:", err);
    renderRecentList([]);
  }
}

function renderRecentList(items) {
  const recentList = document.getElementById('recentList');
  if (!recentList) return;

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
    div.className = 'recent-item';
    div.textContent = item.title;
    recentList.appendChild(div);
  });
}
