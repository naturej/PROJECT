<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에누리 상세보기</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
/* 	function yesEnuri() {	
		alert('수락했습니다')
		window.location = "yesEnuri.five?enu_idx="+${dto.enu_idx};
		window.opener.location.reload();
 		//window.close();//현재 문제  : close()를 사용하면 
 					   // 주소 이동 이 전에 닫힌다.
 		//window.close();
	}
	function noEnuri() {
		alert('거절했습니다');
		window.location = "noEnuri.five?enu_idx="+${dto.enu_idx};
		window.opener.location.reload();
	} */
	function yesEnuri(enu_idx){
		$.ajax({
			url:'yesEnuri.five',
			data:{
				enu_idx: enu_idx
			},
			dataType:'html'
		});
 		alert('수락했습니다');
		window.close();
		window.opener.location.reload();
		
	}
	function noEnuri(enu_idx){
		$.ajax({
			url:'noEnuri.five',
			data:{
				enu_idx: enu_idx
			},
			dataType:'html'
		});
 		alert('거절했습니다');
		window.close();
		window.opener.location.reload();
	}
</script>
</head>
<body>
	<form>
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>글번호</td>
				<td>${dto.enu_idx}</td>
			</tr>
			<tr>
				<td>보낸사람</td>
				<td>${dto.user_id}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${dto.enu_date}</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${dto.enu_quan}</td>
			</tr>
			<tr>
				<td>에누리 가격</td>
				<td>${dto.enu_price}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.enu_content}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수락" onclick="yesEnuri(${dto.enu_idx})">
					<input type="button" value="거절" onclick="noEnuri(${dto.enu_idx})">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>