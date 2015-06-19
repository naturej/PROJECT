<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
  
<script type="text/javascript">

	$(function() {
		$('#buttonprice').click(
				function() {
					var form_data = {
						regId : $("#regId").val(),
						tmFc : $("#tmFc").val()
					};

					$.ajax({
						type : "POST",
						url : 'MiddleLandWeatherApi.five',
						data : form_data,
						//datatype : "json",
						success : function(data) { //서버가 보낸 data
							
							data = JSON.parse(data);
							console.log(data);
							
							$('#table').empty();
							
							var kkk =["지역코드","3일후 오전","3일후 오후","4일후 오전","4일후 오후","5일후 오전","5일후 오후",
							          "6일후 오전","6일후 오후","7일후 오전","7일후 오후","8일후","9일후","10일후"]
							
							$('#table').append("<tr id='table1'></tr>")
							for ( var _title in kkk) {
								$('#table1').append("<td>" + kkk[_title] + "</td>");
							}
							for ( var _title in data.body.items.item) {
								$('#table').append("<td>" + data.body.items.item[_title] + "</td>");
							}
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
	System.out.println(dateToday);
%>
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="priceform"  method="post">
	<table>
		<tr>
			<td>예보구역코드
				<select id="regId">
					<option value="11B00000">서울 인천경기도</option>
					<option value="11D10000">강원도영서</option>
					<option value="11D20000">강원도영동</option>
					<option value="11C20000">대전 세종 충청남도</option>
					<option value="11C10000">충청북도</option>
					<option value="11F20000">광주 전라남도</option>
					<option value="11F10000">전라북도</option>
					<option value="11H10000">대구 경상북도</option>
					<option value="11H20000">부산 울산 경상남도</option>
					<option value="11G0000">제주도</option>
				</select>
			</td>
			<td>발표시각
				<select id="tmFc">
					<option value="<%=dateToday %>">현재</option>
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