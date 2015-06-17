<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에누리 게시판</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>번호</td>
		<td>받는사람</td>
		<td>보내는사람</td>
		<td>제목</td>
		<td>작성일</td>
		<td>삭제</td>
	<tr>
	<c:forEach items="${list}" var="e">
	<tr>
		<td>${e.enu_idx}</td>
 		<td>${bo_id}</td>
		<td>${e.user_id}</td>
		<td>${bo_subject}</td>
		<td>${e.enu_date}</td>
		<td>삭제</td>
	<tr>
	</c:forEach>
</table>
</body>
</html>