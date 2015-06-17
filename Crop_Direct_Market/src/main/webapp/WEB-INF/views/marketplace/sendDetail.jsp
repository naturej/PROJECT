<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보낸 메세지 상세보기</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>글번호</td>
			<td>${dto.me_num}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.me_subject}</td>
		</tr>
		<tr>
			<td>보낸사람</td>
			<td>${dto.send_userid}</td>
		</tr>
		<tr>
			<td>받는사람</td>
			<td>${dto.rec_userid}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.me_date}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${dto.me_content}</td>
		</tr>
	</table>
</body>
</html>