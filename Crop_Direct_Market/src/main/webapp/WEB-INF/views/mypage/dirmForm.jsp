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
<link href="<%=request.getContextPath()%>/css/datepicker_mint.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />
<script type="text/javascript">
	$(function() {
	    $( "#startdate" ).datepicker({
            dateFormat: "yy-mm-dd"
        });
	    $( "#enddate" ).datepicker({
            dateFormat: "yy-mm-dd"
        });
	  });
	
	
	function sendDirm() {
		// 		alert('메세지 발송');
		if ($("#dirm_content").val() == "") {
			alert('내용을 입력해주세요');
			return false;
		} else if($("#startdate").val() > $("#enddate").val()){
			alert('종료일보다 시작일이 먼저 올 수 없습니다.');
		} else {
				console.log($("#dirm").serialize());
			$.ajax({
				type:'post',
				url : 'dirm_sinchung.five',
				data: $("#dirm").serialize(),
				dataType : 'html',
				success : alert('직거래 신청이 완료되었습니다'),
				error : function(request,status,error){
					console.log("code : " + request.status + ", error : " + error);
				}
			});
			window.close();
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
				<td>시작일:<input type="text" name="dirm_startdate" id="startdate"></td>
				<td>종료일:<input type="text" name="dirm_enddate" id="enddate"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea cols="50" rows="10" id="dirm_content" style="overflow-y:scroll" name="dirm_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="user_send" value="${user_send}">
					<input type="hidden" name="user_rec" value="${param.user_rec}">
					<input type="hidden" name="pro_id" value="${param.pro_id}">
					<input type="hidden" name="dirm_sub" value="${param.pro_id} 직거래 신청">
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