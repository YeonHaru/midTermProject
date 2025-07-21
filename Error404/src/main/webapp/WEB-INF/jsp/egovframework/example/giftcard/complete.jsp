<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료</title>
  <link rel="stylesheet" href="/css/00_style.css" />
<style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      text-align: center;
      padding: 2rem;
    }

    .complete-container {
      border: 2px solid #88c;
      border-radius: 12px;
      padding: 2rem;
      background-color: #f9f9ff;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    .complete-title {
      font-size: 1.5rem;
      color: #333;
      margin-bottom: 1rem;
    }

    .complete-info {
      margin-top: 1.5rem;
      font-size: 1rem;
    }

    .complete-info p {
      margin: 0.5rem 0;
    }
  </style>
</head>
<body>
  <div class="complete-container">
    <h2 class="complete-title">🎉 기프트카드 구매가 완료되었습니다!</h2>

    <div class="complete-info">
      <p><strong>상품명:</strong> <c:out value="${gift.name}" /></p>
      <p><strong>금액:</strong> <c:out value="${gift.money}" />원</p>
    </div>
  </div>

  <script>
    setTimeout(() => {
      alert("구매가 완료되었습니다. 창을 닫습니다.");
      window.close(); // 팝업창 닫기
    }, 2000);
  </script>
</body>
</html>