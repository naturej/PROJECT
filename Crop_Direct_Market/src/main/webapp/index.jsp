<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="<c:url value="j_spring_security_logout" />">로그아웃</a>
		<br>
	</se:authorize>
	Main page 입니다.<br>
	<a href="login.five">로그인</a>

	<br><a href="/mypage/schedule.five">일정</a>
		
	<hr>
	<a href="searchPriceApi.five">시세정보</a><br>
	<a href="MiddleForecastApi.five">중기예보</a><br>
	<a href="MiddleLandWeatherApi.five">중기육상예보</a><br>
	<a href="MiddleTemperatureApi.five">중기기온조회</a><br>
	<a href="RealTime_Forecast_Api.five">동네실황조회</a><br>


</body>
</html>
