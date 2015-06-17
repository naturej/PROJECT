<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function sendmsg() {	
		alert('메세지가 전송되었습니다');
		window.close();
	}
</script>
</head>
<body>
	<form action="sendMessage.five">
		<table>
			<tr>
				<!-- 팝업 되기 전에 받아 온 정보를 가져와서 뿌려야 하는 데이터 -->
				<td>받는사람</td>
				<td>geatin(고정값)</td>
			</tr>
			<tr>
				<td>보내는 사람</td>
				<td>gathering11(고정값)</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="me_subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="me_content"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="send_userid" value="gathering11" hidden><!-- 테스트용 고정 값 -->
				</td>
				<td><input type="text" name="rec_userid" value="geatin" hidden><!-- 테스트용 고정 값 -->
				</td>
				<td><input type="text" name="ME_DATE" value="sysdate" hidden><!-- 테스트용 고정 값 -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="전송" onclick="sendmsg()">
				<input type="button" value="닫기" onclick="window.close()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>