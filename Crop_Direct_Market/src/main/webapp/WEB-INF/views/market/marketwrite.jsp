<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<form action="" method="post" enctype="multipart/form-data">
		<table>
			<tr><td>제목<input type="text" id="mar_subject" name="mar_subject" /></td></tr>
			<tr><td>내용<textarea id="content" name="mar_content" id="mar_content"></textarea></td></tr>
			<tr><td>시간<input type="text" name="mar_time" id="mar_time"></td></tr>
			<tr><td>장터날짜<input type="text" id="mar_date" name="mar_date" /></td></tr>
			<tr><td>장터위치<input type="text" id="mar_location" name="mar_location" /></td></tr>
			<tr><td>최대입점수<input type="text" name="mar_maxshop" id="mar_maxshop"></td></tr>
			<tr><td>사진<input type="file" name="file" id="mar_photo"></td></tr>
			<tr><td><input type="submit" value="작성" /></td></tr>
		</table>
	</form>
