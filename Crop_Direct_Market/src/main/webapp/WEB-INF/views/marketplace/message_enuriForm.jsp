<%@page import="java.security.Principal"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>에누리 신청하기</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript">
   function winclose() {
      window.close();
   }

   function sendmsg() {
	   if($("#enu_quan").val() == ""){
			alert('수량을 입력하세요');
		}else if($("#enu_price").val() == ""){
			alert('가격을 입력하세요');
		}else if($("#enu_content").val() == ""){
			alert('내용을 입력하세요');
		}else{
			$.ajax({
				url:'send_enuriMessage.five',
				data:$("#enuri").serialize(),
				dataType:'html'
			});
		alert('에누리가 신청되었습니다');
		window.close();
		}
   }
   $(function(){ 
	   $('#enu_quan').keyup(function (){
			var price = $('#price').val();
			var result = price*$('#enu_quan').val();
		   $('#fix_price').val(result);
	   });
   });
</script>
<style type="text/css">
.message {
	color: #AAAFB3;
	font-size: 11px;
}
</style>
</head>
<body style="overflow: hidden;">
	<h3 style="margin: 5px;">에누리 신청하기</h3><span class="message">에누리 신청은 바로구매보다 기한이 걸릴 수 있습니다.</span>
	<hr color="#1ABC9C">
	<input type="hidden" id="price" value="${salboardDto.bo_price}">
   <form name="enuri" id="enuri" action="send_enuriMessage.five">
      <table cellpadding="7" style="margin: 10px;">
         <tr>
            <td>받는 사람</td>
            <td><%=request.getParameter("user_id")%></td>
            <%-- <td ><input type="text" value='<%=request.getParameter("user_id")%>' readonly="readonly"></td> --%>
            <!-- 자동 삽입 데이터 -->
         </tr>
         <tr>
            <td>품목</td>
            <td><%=request.getParameter("pro_name")%></td>
            <%-- <td><input type="text" value='<%=request.getParameter("pro_name")%>' readonly="readonly"></td> --%>
            <!-- 자동 삽입 데이터 -->
            </tr>
         <tr>
            <td>수량</td>
            <td><input style="text-align:right; padding-right:1px;" type="text" name="enu_quan" id="enu_quan"> 개</td>
         </tr>
         <tr>
            <td>에누리 가격</td>
            <td><input style="text-align:right; padding-right:1px;" type="text" name="enu_price" id="enu_price"> 원</td>
            <!-- 에누리 가격 -->
         </tr>
         <tr><td>기존 가격</td>
         	<td><input style="text-align:right; padding-right:1px;" type="text" name="fix_price" id="fix_price" disabled="disabled">원</td>
         </tr>	
         <tr>
            <td>보내는 사람</td>
            <td><input type="text" name="user_id" value="${user_id}" readonly="readonly"></td>
         </tr>
         <tr>
            <td colspan="2"><textarea cols="50" rows="10" name="enu_content" id="enu_content"></textarea></td>
         </tr>
         <tr>
            <td><input type="hidden" name="bo_num" value="<%=request.getParameter("bo_num")%>">
            <!-- 테스트용 고정 값 --></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
	            <input type="button" value="발송" onclick="sendmsg()" class="btn_submit">
	            <input type="button" value="닫기" onclick="winclose()" class="btn_cancel">
            </td>
         </tr>
      </table>
   </form>
</body>
</html>