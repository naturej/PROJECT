<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="" method="post" enctype="multipart/form-data">
	<table>
	<tr><td>제목</td><td><input type="text" name="subject" value="${boardDto.subject}"/></td></tr>
	<tr><td colspan="2"><textarea id="content" name="content">${boardDto.content}</textarea></td></tr>
	<tr><td>아이디</td><td><input type="text" name="user_id" value="${boardDto.user_id}"/></td></tr>
	<tr><td>파일</td><td><input type="file" name="file" id="file"></td></tr>
	<tr><td colspan="2"><input type="submit" value="수정" /></td></tr>
	</table>
	</form>
	
	
</body>
</html>