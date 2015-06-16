<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 회원가입 폼 -->
	<form action="" method="post" enctype="multipart/form-data" >
		<table>
			<!-- ID 입력  -->
			<tr>
				<td>ID</td>
				<td><input type="text" name="user_id" placeholder="UserID"></td>
			</tr>

			<!-- 이름 입력 -->
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" placeholder="UserName"></td>
			</tr>

			<!-- 비밀번호 입력 -->
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password" placeholder="Password"></td>
			</tr>

			<!-- 비밀번호 입력 -->
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="password2" placeholder="Password"></td>
			</tr>

			<!-- Email 입력 -->
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" placeholder="Email"></td>
			</tr>

			<!-- 유저사진등록 -->
			<tr>
				<td>사진</td>
				<td><input type="file" name="photo" placeholder="image"></td>
			</tr>

			<!-- 지역주소등록 -->
			<tr>
				<td>지역주소</td>
				<td><input type="text" name="addr" placeholder="address"></td>
			</tr>

			<!-- 세부주소 -->
			<tr>
				<td>세부주소</td>
				<td><input type="text" name="addd" placeholder="address"></td>
			</tr>

			<!-- 전화번호  -->
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="cell_phone" placeholder="phoneNumber"></td>
			</tr>

			<!-- 우편번호  -->
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="add_code" placeholder="phoneNumber"></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="가입확인"></td>
				<td><input type="reset" value="가입취소"></td>
			</tr>
		</table>

	</form>
</body>
</html>