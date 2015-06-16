<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<script type="text/javascript">
	
		/* 유효성검사 */
		function checkfield() {

			if (document.joinForm.user_id.value == "") { //id값이 없을 경우
				alert("아이디를 입력하세요"); //메세지 경고창을 띄운 후
				document.joinForm.user_id.focus(); // id 텍스트박스에 커서를 위치
				exit;

			} else if (document.joinForm.user_name.value == "") {
				alert("이름을 입력하세요");
				document.joinForm.user_name.focus();
				exit;

			} else if (document.joinForm.password.value == "") {
				alert("비밀번호를 입력하세요");
				document.joinForm.password.focus();
				exit;

			} else if (document.joinForm.password2.value == "") {
				alert("비밀번호확인을 입력하세요");
				document.joinForm.password2.focus();
				exit;

			} else if (document.joinForm.email.value == "") {
				alert("E-Mail를 입력하세요");
				document.joinForm.email.focus();
				exit;

			} else if (document.joinForm.addr.value == "") {
				alert("지역주소를 입력하세요");
				document.joinForm.addr.focus();
				exit;

			} else if (document.joinForm.addd.value == "") {
				alert("세부주소를 입력하세요");
				document.joinForm.addd.focus();
				exit;

			} else if (document.joinForm.cell_phone.value == "") {
				alert("전화번호를 입력하세요");
				document.joinForm.cell_phone.focus();
				exit;

			} else if (document.joinForm.add_code.value == "") {
				alert("우편번호를 입력하세요");
				document.joinForm.add_code.focus();
				exit;

			}

			if (document.joinForm.password.value != document.joinForm.password2.value) {
				//비밀번호와 비밀번호확인의 값이 다를 경우

				alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
				document.joinForm.password.focus();
				exit;

			}

			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if (exptext.test(document.joinForm.email.value) == false) {
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

				alert("이 메일형식이 올바르지 않습니다.");
				document.joinForm.email.focus();
				exit;
			}

			document.joinForm.submit();

		}
		
		
		/* email 조합 */
		function changeEmail(email_v) {
			if (email_v == "1") {
				document.joinForm.email3.style.display="inline";
				document.joinForm.email3.value = "";
			} else {
				document.joinForm.email3.style.display="none";
				document.joinForm.email3.value = email_v;
			}
		
		}
		
		/* 조합한 email 표시 */
		function comfirmemail(){
			document.joinForm.email.style.display="inline";
			document.joinForm.email.value = document.joinForm.email1.value+"@"+document.joinForm.email3.value;
		}
		
	</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<!-- 회원가입 폼 -->
	<form action="" method="post" name="joinForm" enctype="multipart/form-data" >
		<table>
			<!-- ID 입력 --> 
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
				<td><input type="password" name="password" placeholder="Password"></td>
			</tr>

			<!-- 비밀번호 입력 -->
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="password2" placeholder="Password"></td>
			</tr>

			<!-- Email 입력 -->
			<tr>
				<td>Email</td>
				<td>
					<input type="text" name="email1" placeholder="Email">@
					<select name="email2" onchange="changeEmail(this.value)" >
						<option value="" selected>이메일선택</option>
						<option value="naver.com">naver.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="nate.com">nate.com</option>
						<option value="paran.com">paran.com</option>
						<option value="netian.com">netian.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="kornet.net">kornet.net</option>
						<option value="nownuri.net">nownuri.net</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="freechal.com">freechal.com</option>
						<option value="korea.com">korea.com</option>
						<option value="orgio.net">orgio.net</option>
						<option value="chollian.net">chollian.net</option>
						<option value="hitel.net">hitel.net</option>
						<option value="1">직접입력</option>
					</select> 
					<input type="text" name="email3" style="display: none">
					<input type="button" value="확인" onclick="comfirmemail()" >
					<br>
					<input type="text" name="email" readonly="readonly">
				</td>
			</tr>

			<!-- 유저사진등록 -->
			<tr>
				<td>사진</td>
				<td><input type="file" name="file" placeholder="image"></td>
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
				<td><input type="button" value="가입확인" onclick="checkfield()"></td>
				<td><input type="reset" value="가입취소"></td>
			</tr>
		</table>

	</form> 
</body>
</html>