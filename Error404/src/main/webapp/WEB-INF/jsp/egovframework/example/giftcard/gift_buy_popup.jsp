<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트카드 구매</title>
<link rel="stylesheet" href="/css/00_style.css" />
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .popup-container {
    text-align: center;
    border: 2px solid var(--accent-color-1);
    border-radius: 16px;
    padding: 2rem;
    background-color: #fff0f5; /* 분홍계열 배경 */
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 400px;
  }

  .popup-container img {
    border-radius: 8px;
    margin-bottom: 1rem;
  }

  .popup-container p {
    font-size: 1rem;
    margin: 0.5rem 0;
    color: #333;
  }

  .popup-container button {
    background-color: var(--accent-color-1);
    color: white;
    border: none;
    padding: 0.75rem 2rem;
    font-size: 1rem;
    border-radius: 8px;
    cursor: pointer;
    margin-top: 1.2rem;
    transition: background-color 0.3s ease;
  }

  .popup-container button:hover {
    background-color: #e17a9b; /* hover 시 더 진한 분홍 */
  }
</style>
</head>
<body>
<div class="popup-container">
    <h2>🎁 기프트카드 구매</h2>
    <img src="${gift.photo}" alt="${gift.name}" style="width:100%; max-width:300px;">
    <p><strong>이름:</strong> ${gift.name}</p>
    <p><strong>가격:</strong> ${gift.money}원</p>

    <form method="post" action="/gift/buySubmit.do" target="_self">
      <input type="hidden" name="photo" value="${gift.photo}" />
      <input type="hidden" name="name" value="${gift.name}" />
      <input type="hidden" name="money" value="${gift.money}" />
      
      <!-- 추가: 팝업에서 왔다는 표시 -->
  	  <input type="hidden" name="popupMode" value="true" />
  
      <button type="submit">구매 확정</button>
    </form>
  </div>
</body>
</html>