<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="${pageContext.request.contextPath}/order/form.do" method="post">
  <input type="hidden" name="bno" value="${param.bno}" />
  <input type="hidden" name="qty" value="1" />
  <button type="submit" class="btn-buy"><small>바로구매</small></button>
</form>