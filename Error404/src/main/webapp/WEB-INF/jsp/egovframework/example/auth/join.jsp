<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/00_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/02_join.css">
</head>
<body>

	<div class="signup-wrapper">
		<form id="signupForm"
			action="${pageContext.request.contextPath}/join.do" method="post">

			<!-- 기본 정보 입력 -->
			<h3 class="signup-section-title">
				기본 정보 입력 <span class="signup-required">*</span>
			</h3>
			<div class="signup-form">

				<!-- 이름 -->
				<div class="signup-form-group">
					<label for="signup-name">이름 <span class="signup-required">*</span></label>
					<input type="text" id="signup-name" class="signup-input"
						name="name" required />
				</div>

				<!-- 아이디 -->
				<div class="signup-form-group">
					<label for="signup-id">아이디 <span class="signup-required">*</span></label>
					<input type="text" id="signup-id" class="signup-input"
						name="userid" placeholder="4자~12자 영문자, 숫자" required />
				</div>

				<!-- 이메일 -->
				<div class="signup-form-group">
					<label>이메일 <span class="signup-required">*</span></label>
					<div class="signup-email-row">
						<input type="text" id="emailId"
							class="signup-input signup-email-id" placeholder="이메일 아이디"
							required /> <span class="signup-email-at">@</span> <input
							type="text" id="emailDomain"
							class="signup-input signup-email-domain-input"
							placeholder="도메인 입력" required /> <select id="emailDomainSelect"
							class="signup-select signup-email-domain-select">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</div>
					<!-- 조합 후 서버로 전송되는 email -->
					<input type="hidden" id="email" name="email" />
				</div>

				<!-- 여기에 추가 -->

				<!-- 생년월일 -->
				<div class="signup-form-group">
					<label for="birthdate">생년월일</label> <input type="date"
						id="birthdate" name="birthdate" class="signup-input" />
				</div>

				<!-- 성별 -->
				<div class="signup-form-group">
					<label>성별</label>
					<div class="signup-gender-options">
						<label><input type="radio" name="gender" value="M" /> 남자</label>
						<label><input type="radio" name="gender" value="F" /> 여자</label>
					</div>
				</div>

				<!-- 주소 -->
				<div class="signup-form-group">
					<label for="address">주소</label> <input type="text" id="address"
						name="address" class="signup-input"
						placeholder="예: 서울특별시 강남구 테헤란로 123" />
				</div>

				<!-- 비밀번호 -->
				<div class="signup-form-group">
					<label for="signup-password">비밀번호 <span
						class="signup-required">*</span></label> <input type="password"
						id="signup-password" class="signup-input" name="password"
						placeholder="영문, 숫자, 특수문자 포함 10자~20자" required />
				</div>

				<!-- 비밀번호 확인 -->
				<div class="signup-form-group">
					<label for="signup-password2">비밀번호 재입력 <span
						class="signup-required">*</span></label> <input type="password"
						id="signup-password2" class="signup-input" required />
				</div>

				<!-- 휴대전화 -->
				<div class="signup-form-group">
					<label>휴대전화 <span class="signup-required">*</span></label>
					<div class="signup-phone-row">
						<input type="text" id="phone1" class="signup-input" maxlength="3"
							placeholder="010" required /> <span>-</span> <input type="text"
							id="phone2" class="signup-input" maxlength="4" required /> <span>-</span>
						<input type="text" id="phone3" class="signup-input" maxlength="4"
							required />
					</div>
					<!-- 조합 후 서버로 전송되는 phone -->
					<input type="hidden" id="phone" name="phone" />
				</div>
			</div>

			<!-- 약관 동의 -->
			<h3 class="signup-section-title">약관 동의</h3>
			<div class="signup-terms">
				<label class="signup-checkbox"> <input type="checkbox"
					id="check-all" /> <strong>모든 약관에 동의합니다.</strong>
				</label>

				<ul class="signup-terms-list">
					<li><label class="signup-checkbox"> <input
							type="checkbox" class="check-each" required /> [필수] &lt;사이트
							이름&gt; 이용약관
					</label></li>
					<li><label class="signup-checkbox"> <input
							type="checkbox" class="check-each" required /> [필수] 커뮤니티 이용약관
					</label></li>
					<li><label class="signup-checkbox"> <input
							type="checkbox" class="check-each" required /> [필수] 개인정보 수집 및 이용
							동의
					</label></li>
					<li><label class="signup-checkbox"> <input
							type="checkbox" class="check-each" /> [선택] 맞춤형 광고 수신 동의
					</label>
						<div class="signup-marketing-options">
							<label><input type="checkbox" class="check-marketing"
								value="Y" /> 앱 푸시</label> <label><input type="checkbox"
								class="check-marketing" value="S" /> 문자/카카오톡</label> <label><input
								type="checkbox" class="check-marketing" value="E" /> 이메일</label>
						</div></li>
				</ul>
			</div>

			<!-- ✅ 요기!! -->
			<input type="hidden" id="finalPromoAgree" name="promoAgree" value="N" />

			<!-- 제출 버튼 -->
			<button type="submit" class="signup-submit-button">가입하기</button>
			<small class="signup-footer-help"> 본인인증 문의: 한국모바일인증
				1234-5678&nbsp;&nbsp;|&nbsp;&nbsp; 회원가입 문의: 고객센터 8765-4321 </small>
		</form>
	</div>

	<!-- 외부 JS 연결 -->
	<script src="${pageContext.request.contextPath}/js/signup.js"></script>
</body>
</html>
