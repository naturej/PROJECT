<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>받은 메세지함</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>번호</td>
		<td>받는사람</td>
		<td>보내는사람</td>
		<td>제목</td>
		<td>작성일</td>
		<td></td>
	<tr>
	<c:forEach items="${list}" var="m">
	<tr>
		<td>${m.me_num}</td>
		<td>${m.rec_userid}</td>
		<td>${m.send_userid}</td>
		<td><a href="RecDetail.five?me_num=${m.me_num}">${m.me_subject}</a></td>
		<td>${m.me_date}</td>
		<td><a href="deleteRec.five?me_num=${m.me_num}">삭제</a></td>
	<tr>
	</c:forEach>
</table>
</body>
</html>