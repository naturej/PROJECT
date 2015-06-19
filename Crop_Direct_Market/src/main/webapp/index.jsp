<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN PAGE</title>
</head>
<body>
	<se:authentication property="name" var="LoingUser"/>
	<se:authorize ifAnyGranted="ROLE_SELLER,ROLE_CONSUMER,ROLE_ADMIN">
		${LoingUser}님 환영합니다!
	</se:authorize>
	Main page 입니다.<br>
	<a href="login.five">로그인</a>
	<a href="searchPriceApi.five">시세정보</a>
	<br><a href="schedule.five">일정</a>
</body>
</html>