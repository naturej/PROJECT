<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".name").click(
				function() {
					window.open('messageForm.jsp?rec_name=' + $(this).html(),
							'top=100px, left=100px, height=700 width=1000')
				});
	});
</script>
</head>
<body>
	<Table>
		<tr>
			<td class="name" align="left">문성현</td>
		</tr>
	</Table>
</body>
</html>