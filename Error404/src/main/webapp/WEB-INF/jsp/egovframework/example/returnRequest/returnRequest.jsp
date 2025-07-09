<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>반품/교환 신청</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">

  <h2 class="mb-4">반품 / 교환 / 추가배송 신청</h2>

  <!-- 안내 -->
  <div class="alert alert-info">
    <p><strong>반품</strong>: 상품 수령 후 신청 가능. 미출고 상품은 고객센터로 문의해주세요.</p>
    <p><strong>교환</strong>: 파본/훼손/다른 상품 수령 시. 단순 변심은 교환 불가하므로 [반품] 후 재구매 바랍니다.</p>
    <p><strong>추가배송</strong>: 주문상품/부록/증정품 누락 시 선택해주세요.</p>
  </div>

  <!-- 주문번호 및 상품 선택 -->
  <div class="mb-4">
    <label class="form-label">주문번호</label>
    <select class="form-select">
      <option>주문번호를 선택하세요</option>
      <option>20250709-0001</option>
      <option>20250708-0023</option>
    </select>
  </div>

  <!-- 반송 상품 리스트 (예시 테이블) -->
  <table class="table table-bordered mb-4">
    <thead class="table-light">
      <tr>
        <th>선택</th>
        <th>상품명</th>
        <th>반송 수량</th>
        <th>총 수량</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" /></td>
        <td>책 제목 A</td>
        <td><input type="number" class="form-control" value="1" min="1" /></td>
        <td>2</td>
      </tr>
    </tbody>
  </table>

  <!-- 배송지 정보 -->
  <h5>회수/교환 주소</h5>
  <div class="mb-3">
    <label class="form-label">보내는 분</label>
    <input type="text" class="form-control" />
  </div>
  <div class="mb-3">
    <label class="form-label">주소</label>
    <input type="text" class="form-control" placeholder="주소 검색 버튼 구현 필요" />
  </div>
  <div class="mb-3">
    <label class="form-label">전화번호 / 휴대전화</label>
    <div class="d-flex gap-2">
      <input type="text" class="form-control" placeholder="전화번호" />
      <input type="text" class="form-control" placeholder="휴대폰" />
    </div>
  </div>
  <div class="mb-4">
    <label class="form-label">회송 메시지</label>
    <textarea class="form-control" rows="2" maxlength="32" placeholder="택배기사님께 전할 메시지 (0/32)"></textarea>
  </div>

  <!-- 반송 방식 선택 -->
  <h5>반송 방법</h5>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="delivery" id="option1" checked>
    <label class="form-check-label" for="option1">
      알라딘 지정 택배사 (회수비 2,500원 환불 시 차감)
    </label>
  </div>
  <div class="form-check mb-4">
    <input class="form-check-input" type="radio" name="delivery" id="option2">
    <label class="form-check-label" for="option2">
      고객 임의 발송 (선불 발송 필수)
    </label>
  </div>

  <!-- 환불 안내 -->
  <div class="alert alert-secondary">
    <strong>환불은 결제한 수단으로 이루어집니다.</strong><br/>
    - 쿠폰 조건 미달 시 쿠폰 자동 취소<br/>
    - 휴대폰 결제 시 환불 제한 가능성 있음<br/>
    - 카드 환불은 영업일 기준 3~4일 소요<br/>
    - 사은품 조건 미달 시 사은품도 반드시 회송
  </div>

  <!-- 신청 버튼 -->
  <button class="btn btn-primary w-100">신청 완료</button>

</div>
</body>
</html>
