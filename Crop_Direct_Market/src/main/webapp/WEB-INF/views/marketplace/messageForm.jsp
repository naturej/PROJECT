<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<!-- 팝업 되기 전에 받아 온 정보를 가져와서 뿌려야 하는 데이터 -->
				<td>받는 사람 : </td> 
				<%-- <td><%=request.getParameter("recname")%></td> --%>
				<td> gathering11 </td><!-- 테스트용 고정 값 -->

			<tr>
			<tr>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="발송"></td>
				<td><input type="button" value="닫기" onclick="close()"></td>
			</tr>
		</table>
	</form>
</body>
</html>