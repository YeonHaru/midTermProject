<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/00_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/01_login.css">
</head>
<body>
  <div class="login-wrapper">
    
    <!-- 오른쪽 상단 로그인 버튼 -->
    <div class="signup-button-container">
      <a href="${pageContext.request.contextPath}/login.do" class="signup-button">로그인</a>
    </div>

    <h2 class="login-title">비밀번호 찾기</h2>

    <form action="${pageContext.request.contextPath}/findPw.do" method="post" class="login-form">
      <input type="text" name="userid" class="login-input" placeholder="아이디 입력" required>
      <input type="email" name="email" class="login-input" placeholder="이메일 입력" required>
      <button type="submit" class="login-button">비밀번호 찾기</button>
    </form>

    <c:if test="${not empty result}">
      <p class="error-msg" style="text-align: center;">${result}</p>
    </c:if>

    <div class="login-links">
      <a href="${pageContext.request.contextPath}/findId.do">아이디 찾기</a>
    </div>
  </div>
</body>
</html>
