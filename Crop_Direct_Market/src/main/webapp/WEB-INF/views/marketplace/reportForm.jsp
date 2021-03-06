<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	function report() {
		if($("#rep_content").val() == ""){
			alert('내용을 입력하세요');
		}else{
			$.ajax({
				url:'reportInsert.five',
				data:$("#report").serialize(),
				dataType:'html'
			});
	 		alert('신고 완료');
	 		window.close();
	 		window.opener.location.reload();
		}
	}
</script>
</head>
<body style="overflow: hidden;">
<h3 style="margin: 0">신고하기</h3>
<hr color="#1ABC9C">
<form id="report">
	<table>
		<tr><td>게시글 제목 : <%=request.getParameter("bo_subject")%></td></tr>
		<tr><td>품명 : <%=request.getParameter("product")%></td></tr>
		<tr><td>신고자 : ${user_send}</td></tr>
		<tr><td>
		<textarea rows="10" cols="50" id="rep_content" name="rep_content"></textarea>
		</td></tr>
	</table>
	<input hidden name="bo_num" value="${param.bo_num}" /> 
    <input hidden name="user_send" value="${user_send}" />
    <input hidden name="user_rec" value="${param.user_rec}" />
    <div align="left" style="margin-left: 120px;">
    <input type="button" class="btn_submit" value="신고작성" onclick="report()" />&nbsp;
    <input type="button" class="btn_cancel" value="취소" onclick="window.close()" />
    </div>
</form>
</body>
</html>