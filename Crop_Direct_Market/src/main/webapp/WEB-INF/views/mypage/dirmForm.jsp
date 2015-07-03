<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직거래 쪽지 보내기</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
	    $( "#startdate" ).datepicker();
	    $( "#enddate" ).datepicker();
	  });
	
	
	function sendDirm() {
		// 		alert('메세지 발송');
		if ($("#dirm_content").val() == "") {
			alert('내용을 입력해주세요');
			return false;
		} else {
			
			sd = $("#startdate").val().split("/");
			dirm_startdate = new Date(sd[2],sd[0]-1,sd[1]);
			
			ed = $("#enddate").val().split("/");
			dirm_enddate = new Date(ed[2],ed[0]-1,ed[1]);
			
			$.ajax({
				type:'post',
				url : 'dirm_sinchung.five',
				data: {
					user_send : "${user_send}",
					user_rec : "${param.user_rec}",
					dirm_sub : $("#dirm_sub").val(),
					dirm_content : $("#dirm_content").val(),
					pro_id : "${param.pro_id}",
					dirm_startdate : dirm_startdate,
					dirm_enddate : dirm_enddate
				},
				dataType : 'html',
				success : alert('직거래 신청이 완료되었습니다'),
				error : function(request,status,error){
					console.log("code : " + request.status + ", error : " + error);
				}
			});
			
// 			window.close();
		}
	}
</script>
<link href="css/style.css" rel="stylesheet">
</head>
<body style="overflow: hidden;">
	<form id="dirm" method="post" >
		<h3 style="margin: 0">직거래 신청하기</h3>
		<hr color="#1ABC9C">
		<table cellpadding="7" style="margin: 10px;">
			<tr>
				<!-- 팝업 되기 전에 받아 온 정보를 가져와서 뿌려야 하는 데이터 -->
				<td>받는사람</td>
				<td>${param.user_rec}</td>
			</tr>
			<tr>
				<td>보내는 사람</td>
				<td>${user_send}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${param.pro_id} 직거래 신청</td>
			</tr>
			<tr>
				<td>품명</td>
				<td>${param.pro_id}</td>
			</tr>
			<tr>
				<td>시작일:<input type="text" id="startdate"></td>
				<td>종료일:<input type="text" id="enddate"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea cols="50" rows="10" id="dirm_content" style="overflow-y:scroll" name="dirm_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="user_send" value="${user_send}" hidden>
					<input type="text" name="user_rec" value="${param.user_rec}" hidden>
					<input type="text" name="pro_id" value="${param.pro_id}" hidden>
					<input type="text" name="dirm_sub" value="${param.pro_id} 직거래 신청" hidden>
					<input type="text" name="dirm_startdate" value="${dirm_startdate}" hidden>
					<input type="text" name="dirm_enddate" value="${dirm_enddate}" hidden>
				</td>
			</tr>
			<tr>
				<td style="padding-top: 0" colspan="2" align="center">
					<input type="button" value="전송" onclick="sendDirm()" class="btn_submit">
					<input type="button" value="닫기" onclick="window.close()" class="btn_cancel">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>