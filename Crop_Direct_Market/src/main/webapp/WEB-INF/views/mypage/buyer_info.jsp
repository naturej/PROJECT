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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#table_sheet td {
	width: 150px;
	height: 30px;
}

#kkk input {
	width: 70px;
}

#kkk td {
	width: 100px;
	height: 30px;
	font-size: 12px;
	vertical-align: middle;
}

#kkk th {
	width: 80px;
	text-align: center;
	font-size: 12px;
}
</style>
</head>

<body>
	<div style="width: 300px; margin-right: 35px; float: left">
		<table class="table table-bordered" id="kkk">
			<c:forEach var="list" items="${buyer}">
				<tr>
					<td colspan="2">${list.buy_userid}님의 배송지 정보</td>
				</tr>
				<tr>
					<td style="width: 30%;">우편번호</td><td>${list.add_code}</td>
				</tr>
				<tr>
					<td>주소</td><td>${list.or_addr}</td>
				</tr>
				<tr>
					<td>세부주소</td><td>${list.or_addd}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2" align="right"><input type=button value="창닫기"
					align="right" onclick="self.close()"></td>
			</tr>
		</table>
	</div>
</body>
</html>