<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function popup(enu_idx){
		window.open('enuDetail.five?enu_idx='+enu_idx,'에누리 상세보기', 'width=500 height=700')
	}
</script>
<title>에누리 게시판</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>번호</td>
		<td>보내는사람</td>
		<td>내용</td>
		<td>작성일</td>
		<td>상태</td>
	<tr>
	<c:forEach items="${list}" var="e">
	<tr>
		<td>${e.enu_idx}</td>
		<td>${e.user_id}</td>
		<td><a href="#" onclick="popup('${e.enu_idx}')">${e.enu_content}</a></td>
		<td>${e.enu_date}</td>
		<c:if test="${e.enu_confirm == '0'}"><td>대기중</td></c:if>
		<c:if test="${e.enu_confirm == '1'}"><td>수락</td></c:if>
		<c:if test="${e.enu_confirm == '2'}"><td>거절</td></c:if>
	<tr>
	</c:forEach>
</table>
</body>
</html>