<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
				<th class="IDX">번호</th>
				<th class="SUBJECT">제목</th>
				<th class="USER_ID">작성자</th>
				<th class="WRITEDATE">작성일</th>
				<th class="COUNT">사진</th>
</tr>
<c:forEach items="${list}" var="n">
				
				<tr>
					<td class="IDX">${n.mar_id}</td>
					<td class="SUBJECT"><a href="detailmarket.five?mar_id=${n.mar_id}">${n.mar_subject}</a></td>
					<td class="USER_ID">관리자</td>
					<td class="WRITEDATE">${n.writedate}</td>
					<td class="COUNT">${n.mar_photo}</td>
				</tr>
</c:forEach>
</table>
</body>
</html>