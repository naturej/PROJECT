<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">

	$(function() {
		$('#buttonprice').click(
				
				function() {
					var form_data = {
						stnId : $("#stnId").val(),
						tmFc : $("#tmFc").val()
					};

					$.ajax({
						type : "POST",
						url : 'MiddleForecastApi.five',
						data : form_data,
						//datatype : "json",
						success : function(data) { //서버가 보낸 data
							
							data = JSON.parse(data);
							console.log(data);
							console.log(data.body.items.item.wfSv);
							
							$('#table').empty();
							//console.log(data.title[_title]);
							$('#table').append("<td>" + data.body.items.item.wfSv + "</td>");
							
						}
					});

				});
	});
	
<%
	Date d = new Date();
	
	//String s = d.toString();
	//System.out.println("현재날짜 : "+ s);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	System.out.println("현재날짜 : "+ sdf.format(d));
	
	String dateToday=sdf.format(d)+"0600";  //API 요청파라메터로 현재날짜와 06:00 or 18:00 발표시간이 필요 
											//즉 현재 2015년 6월 18일이라면 (201506180600 or 201506181800)이 입력되어야한다
%>
</script>
<title>중기기상예보</title>
</head>
<body>
<form id="priceform"  method="post">
	<table>
		<tr>
			<td>지점번호
				<select id="stnId">
					<option value="105">강릉(강원도 포함)</option>
					<option value="108">전국</option>
					<option value="109">수도권(서울,경기,인천)</option>
					<option value="133">대전(세종,충청 도 포함)</option>
					<option value="156">광주(전라도 포함)</option>
					<option value="159">부산(대구,울산,경상도 포함)</option>
					<option value="184">제주</option>
					
				</select>
			</td>
			<td>발표시각
				<select id="tmFc">
					<option value="<%=dateToday%>">현재</option>
					
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