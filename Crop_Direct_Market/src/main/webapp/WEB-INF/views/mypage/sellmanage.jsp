<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	  
function check(order_num,result) {
    $.ajax({
        type : 'GET',
        url : "orderupdate.five",
        data : {"order_num" : order_num},
        dataType:'html',
        success : function (data) {
        	console.log(data);
        	if(data!=null){
            	$("#"+order_num).html("Ȯ��");
        	}
        }});
 
    };
</script>
</head>
<body>
	<br> 
	<%=request.getAttribute("user_id")%>���� �Ǹ� ��Ȳ�Դϴ�.
	<br>
	<table border="1">
		<tr>
			<td>�ֹ���ȣ</td>
			<td>�Ǹ�����</td>
			<td>�ǸŹ�ǰ</td>
			<td>�ֹ�����</td>
			<td>�����ݾ�</td>
			<td>�ֹ���</td>
			<td>�ֹ�����</td>
			<td>����Ȯ��</td>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.OR_ID}</td>
				<td>${list.BO_SUBJECT}</td>
				<td>${list.PRO_NAME}</td>
				<td>${list.OR_QUAN}</td>
				<td>${list.OR_COST}</td>
				<td>${list.BUY_USERID}</td>
				<td id="${list.OR_ID}">${list.OR_STATE}</td>
				<td><input type="button" value="����Ȯ��"
					onclick="check('${list.OR_ID}','${list.OR_STATE}')"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>