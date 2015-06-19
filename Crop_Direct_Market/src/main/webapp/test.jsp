<!-- 쪽지, 에누리 테스트 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트 페이지</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	function popup(){
		window.open('popup.five','쪽지 보내기', 'width=300 height=200')
	}
</script>
</head>
<body>
	<a href="test.five">테스트 페이지로 이동</a><br><br>
	<a href="#" onclick="popup()">쪽지보내기</a><br><br>
	<a href="receiveList.five">받은 메세지함</a><br><br>
	<a href="sendList.five">보낸 메세지함</a><br><br>
	<a href="sellpage.five">에누리 신청하기</a><br><br>
	<a href="enulist.five">에누리 목록보기</a><br><br>
	<a href="shopList.five">장바구니</a>
</body>
</html>