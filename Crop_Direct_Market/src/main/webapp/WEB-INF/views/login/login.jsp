<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<div>
	<c:if test="${param.error != null}">
		<div>
			 로그인실패<br>
			 <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			 	이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
			 </c:if>
		</div>
	</c:if>
	<c:url value="/j_spring_security_check" var="loginURL"/>
	<form method="post" action="${loginURL}">
		<table>
			<tr>
				<td>ID:&nbsp;</td>
				<td><input type="text" name="j_username"/></td>
			</tr>
			<tr>
				<td>PWD:</td>
				<td><input type="password" name="j_password"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><a href="joinSelect.five">회원가입</a>&nbsp;<input type="submit" value="확인"/></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>