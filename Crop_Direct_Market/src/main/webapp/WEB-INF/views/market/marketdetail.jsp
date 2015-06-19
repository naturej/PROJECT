<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr><td>제목:${marketDto.mar_subject}</td></tr>
		<tr><td>장터일시:${marketDto.mar_date}</td></tr>
		<tr><td>내용:${marketDto.mar_content}</td></tr>
		<tr><td>장터시간:${marketDto.mar_time}</td></tr>
		<tr><td>장터위치:${marketDto.mar_location}</td></tr>
		<tr><td>참여자:${marketDto.mar_maxshop}</td></tr>
		<tr><td>파일:${marketDto.mar_photo}</td></tr>
	</table>
	<a href="">참가등록</a>
	<a href="marketdelete.five?mar_id=${marketDto.mar_id}">삭제</a>

</body>
</html>