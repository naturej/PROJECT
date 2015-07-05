<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ohdeokrionline.model.vo.Account_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<table class="table">
		<tr>
			<td colspan="2">${seller}님의 계좌정보입니다.</td>
		</tr>
		<c:forEach var="list" items="${account}">
			<tr>
				<td>${list.bank}</td>
				<td>${list.accountnum}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2"><input type=button value="창닫기" onclick="self.close()">
			</td>
		</tr>
	</table>
</body>
</html>