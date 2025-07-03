<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/01_login.css">
</head>
<body>

<div class="login-wrapper">

  <!-- 오른쪽 상단 회원가입 버튼 -->
  <div class="signup-button-container">
    <a href="/join.do" class="signup-button">회원가입</a>
  </div>

  <h2 class="login-title">로그인</h2>

  <!-- 탭 영역 -->
  <div class="login-box">
    <div class="login-tabs">
      <button class="login-tab active" data-tab="member">회원 로그인</button>
      <button class="login-tab" data-tab="nonmember">비회원 주문확인</button>
    </div>

    <!-- 회원 로그인 콘텐츠 -->
    <div class="login-content login-member active">
      <div class="login-form">
        <input type="text" class="login-input" placeholder="아이디를 입력하세요">
        <input type="password" class="login-input" placeholder="비밀번호를 입력하세요">

        <div class="login-options">
          <label><input type="checkbox"> 로그인 상태 유지</label>
          <label><input type="checkbox"> 아이디 저장</label>
        </div>
      </div>
      <!-- 회원용 버튼 -->
      <button class="login-button login-btn-member active">로그인</button>
      <div class="login-links">
        <a href="#">아이디 찾기</a>
        <span>|</span>
        <a href="#">비밀번호 찾기</a>
      </div>
    </div>

    <!-- 비회원 주문확인 콘텐츠 -->
    <div class="login-content login-nonmember">
      <div class="login-form">
        <input type="text" class="login-input" placeholder="주문번호를 입력하세요">
        <input type="password" class="login-input" placeholder="주문 비밀번호를 입력하세요">
      </div>
      <small class="login-info-text">조회하실 주문번호와 주문 비밀번호를 입력하세요</small>
      <button class="login-button login-btn-nonmember">확인</button>
    </div>

    <!-- 간편 로그인 영역 -->
    <div class="login-divider">또는 간편하게 로그인</div>
    <div class="login-sns">
      <button class="sns naver">네이버</button>
      <button class="sns kakao">카카오</button>
      <button class="sns google">구글</button>
      <button class="sns apple">애플</button>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
