<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메세지 보내기</title>
<script type="text/javascript">
	function sendmsg() {	
		alert('메세지가 전송되었습니다');
		window.close();
	}
</script>
<link href="css/style.css" rel="stylesheet">
</head>
<body style="overflow: hidden;">
	<form action="sendMessage.five">
		<h3 style="margin: 0">쪽지 보내기</h3>
		<hr color="#1ABC9C">
		<table cellpadding="7" style="margin: 10px;">
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
				<td colspan="2">
					<textarea cols="50" rows="10" style="overflow-y:scroll" name="me_content"></textarea>
				</td>
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
				<td style="padding-top: 0" colspan="2" align="center">
					<input type="submit" value="전송" onclick="sendmsg()" class="btn_submit">
					<input type="button" value="닫기" onclick="window.close()" class="btn_cancel">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>