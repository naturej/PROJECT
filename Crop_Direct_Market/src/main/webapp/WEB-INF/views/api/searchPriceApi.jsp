<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchPrice</title>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">

	$(function() {
		$('#buttonprice').click(
				function() {
					var form_data = {
						work : $("#work").val(),
						type : $("#type").val()
					};

					$.ajax({
						type : "POST",
						url : 'searchPriceApi.five',
						data : form_data,
						//datatype : "json",
						success : function(data) { //서버가 보낸 data
							
							data = JSON.parse(data);
							console.log(data.title);
							console.log(data.result[0].article);

							$('#table').empty();
							for ( var _title in data.title) {
								//console.log(data.title[_title]);
								$('#table').append(
										"<td>" + data.title[_title] + "</td>");
							}
							for (var i = 0; i < data.result.length; i++) {
								$('#table').append("<tr id="+i+"></tr>")
								for ( var _result in data.result[i]) {
									//console.log(data.result[i][_result]+"/"+i);
									$('#' + i).append(
											"<td>" + data.result[i][_result]
													+ "</td>");
								}
							}
						}
					});

				});
	});
	
	
</script>
</head>
<body>
<form id="priceform" >
	<table>
		<tr>
			<td>시장코드
				<select id="work">
					<option value="1">도매</option>
					<option value="2">소매</option>
				</select>
			</td>
			<td>품목코드
				<select id="type">
					<option value="1">채소</option>
					<option value="2">과수</option>
					<option value="3">축산</option>
					<option value="4">화훼</option>
					<option value="5">임산물</option>
					<option value="6">식량</option>
				</select>
			</td>
			<td>
				<input type="button" id="buttonprice" value="검색">
			</td>
		</tr>
	</table>
</form>	
<hr>
	<table id="table" border="1"  style="border-collapse:collapse" >
		
	</table>
</body>
</html>