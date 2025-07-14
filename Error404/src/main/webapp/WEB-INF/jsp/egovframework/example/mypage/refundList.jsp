<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>환불 요청 리스트</title>
  <link rel="stylesheet" href="<c:url value='/css/00_style.css' />" />
</head>
<body>
  <h2>환불 요청 게시판</h2>
  <table border="1" cellpadding="5" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th>번호</th>
        <th>사용자ID</th>
        <th>사유</th>
        <th>내용</th>
        <th>요청일</th>
        <th>주문번호(ONO)</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="item" items="${refundList}">
        <tr>
          <td><c:out value="${item.rno}" /></td>
          <td><c:out value="${item.userid}" /></td>
          <td><c:out value="${item.reason}" /></td>
          <td><c:out value="${item.content}" /></td>
          <td><fmt:formatDate value="${item.requestDate}" pattern="yyyy-MM-dd" /></td>
          <td><c:out value="${item.ono != null ? item.ono : '미정'}" /></td>
          <td><c:out value="${item.status != null ? item.status : '대기'}" /></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>
