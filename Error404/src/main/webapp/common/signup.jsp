<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <!-- 스타일시트 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/02_style.css">
</head>
<body>

<div class="signup-wrapper">
  <!-- 기본 정보 입력 -->
  <h3 class="signup-section-title">기본 정보 입력 <span class="signup-required">*</span></h3>
  <div class="signup-form">

    <div class="signup-form-group">
      <label for="signup-name">이름 <span class="signup-required">*</span></label>
      <input type="text" id="signup-name" class="signup-input" />
    </div>

    <div class="signup-form-group">
      <label for="signup-id">아이디 <span class="signup-required">*</span></label>
      <input type="text" id="signup-id" class="signup-input" placeholder="4자~12자 영문자, 숫자" />
    </div>

    <div class="signup-form-group">
      <label>이메일 <span class="signup-required">*</span></label>
      <div class="signup-email-row">
        <input type="text" class="signup-input signup-email-id" />
        <span class="signup-email-at">@</span>
        <input type="text" class="signup-input signup-email-domain-input" placeholder="도메인 입력" />
        <select class="signup-select signup-email-domain-select">
          <option value="">직접입력</option>
          <option value="naver.com">naver.com</option>
          <option value="gmail.com">gmail.com</option>
          <option value="nate.com">nate.com</option>
          <option value="daum.net">daum.net</option>
          <option value="hanmail.net">hanmail.net</option>
        </select>
      </div>
    </div>

    <div class="signup-form-group">
      <label for="signup-password">비밀번호 <span class="signup-required">*</span></label>
      <input type="password" id="signup-password" class="signup-input" placeholder="영문, 숫자, 특수문자 포함 10자~20자" />
    </div>

    <div class="signup-form-group">
      <label for="signup-password2">비밀번호 재입력 <span class="signup-required">*</span></label>
      <input type="password" id="signup-password2" class="signup-input" />
    </div>

    <div class="signup-form-group">
      <label>휴대전화 <span class="signup-required">*</span></label>
      <div class="signup-phone-row">
        <input type="text" class="signup-input" maxlength="3" />
        <span>-</span>
        <input type="text" class="signup-input" maxlength="4" />
        <span>-</span>
        <input type="text" class="signup-input" maxlength="4" />
      </div>
    </div>
  </div>

  <!-- 약관 동의 -->
  <h3 class="signup-section-title">약관 동의</h3>
  <div class="signup-terms">
    <label class="signup-checkbox">
      <input type="checkbox" id="check-all" />
      <strong>모든 약관에 동의합니다.</strong>
    </label>

    <ul class="signup-terms-list">
      <li>
        <label class="signup-checkbox">
          <input type="checkbox" class="check-each" /> [필수] <사이트 이름> 이용약관
        </label>
      </li>
      <li>
        <label class="signup-checkbox">
          <input type="checkbox" class="check-each" /> [필수] 커뮤니티 이용약관
        </label>
      </li>
      <li>
        <label class="signup-checkbox">
          <input type="checkbox" class="check-each" /> [필수] 개인정보 수집 및 이용 동의
        </label>
      </li>
      <li>
        <label class="signup-checkbox">
          <input type="checkbox" class="check-each" /> [선택] 맞춤형 광고 수신 동의
        </label>
        <div class="signup-marketing-options">
          <label><input type="checkbox" class="check-marketing" /> 앱 푸시</label>
          <label><input type="checkbox" class="check-marketing" /> 문자/카카오톡</label>
          <label><input type="checkbox" class="check-marketing" /> 이메일</label>
        </div>
      </li>
    </ul>
  </div>

  <!-- 제출 버튼 -->
  <button class="signup-submit-button">가입하기</button>
  <small class="signup-footer-help">
    본인인증 문의: 한국모바일인증 1234-5678&nbsp;&nbsp;|&nbsp;&nbsp;
    회원가입 문의: 고객센터 8765-4321
  </small>
</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/js/signup.js"></script>
</body>
</html>
