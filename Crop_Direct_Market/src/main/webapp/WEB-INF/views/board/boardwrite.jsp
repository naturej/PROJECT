<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<form action="" method="post" enctype="multipart/form-data">
	<table border="1">
	<tr><td>제목</td><td><input type="text" id="subject" name="subject" /></td></tr>
	<tr><td colspan="2"><textarea id="content" name="content" id="content">내용</textarea></td></tr>
	<tr><td>아이디</td><td><input type="text" name="user_id" id="user_id"/></td></tr>
	<tr><td>파일</td><td><input type="file" name="file" id="file"></td></tr>
	<tr><td colspan="2"><input type="submit" value="작성" /></td></tr>
	</table>
	</form>
