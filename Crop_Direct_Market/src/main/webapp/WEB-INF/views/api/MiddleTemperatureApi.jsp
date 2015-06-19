<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MiddleTemperature</title>

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
						url : 'MiddleTemperatureApi.five',
						data : form_data,
						//datatype : "json",
						success : function(data) { //서버가 보낸 data
							
							data = JSON.parse(data);
							console.log(data);
							console.log(data.body.items.item.length);
							
						 	$('#table').empty();
							var kkk =["예보구역코드",
							          "3일후 예상최고기온(℃)","4일후 예상최고기온(℃)","5일후 예상최고기온(℃)",
							          "6일후 예상최고기온(℃)","7일후 예상최고기온(℃)","8일후 예상최고기온(℃)",
							          "9일후 예상최고기온(℃)","10일후 예상최고기온(℃)",
							          "3일후 예상최저기온(℃)","4일후 예상최저기온(℃)","5일후 예상최저기온(℃)",
							          "6일후 예상최저기온(℃)","7일후 예상최저기온(℃)","8일후 예상최저기온(℃)",
									  "9일후 예상최저기온(℃)","10일후 예상최저기온(℃)"]
							
							console.log(kkk[2]);
							console.log(kkk.length);
							
							$('#table').append("<tr id='table1'></tr>")
							for ( var _title in kkk) {
								
								$('#table1').append(
										"<td>" + kkk[_title] + "</td>");
							}
							for ( var _title in data.body.items.item) {
								
								$('#table').append(
										"<td>" + data.body.items.item[_title] + "</td>");
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

</head>
<body>
<form id="priceform"  method="post">
	<table>
		<tr>
			<td>예보구역코드
				<select id="regId">
					<option value="11B10101">서울</option>
					<option value="11B20201">인천</option>
					<option value="11B20601">수원</option>
					<option value="11B20305">문산</option>
					<option value="11D10301">춘천</option>
					<option value="11D10401">원주</option>
					<option value="11D20501">강릉</option>
					<option value="11C20401">대전</option>
					<option value="11C20101">서산</option>
					<option value="11C10301">청주</option>
					<option value="11F20501">광주</option>
					<option value="11F20401">여수</option>
					<option value="11F10201">전주</option>
					<option value="21F20801">목포</option>
					<option value="11H20201">부산</option>
					<option value="11H20101">울산</option>
					<option value="11H20301">창원</option>
					<option value="11H10701">대구</option>
					<option value="11H10501">안동</option>
					<option value="11G00201">제주</option>
					<option value="11G00401">서귀포</option>
					<option value="11C20404">세종</option>
					<option value="11H10201">포항</option>
					<option value="21F10501">군산</option>
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