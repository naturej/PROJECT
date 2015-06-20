<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">


	$(function() {
		
		var l_result = new Array();
		var large = new Array();
		
		
		
		//비동기로 위도,경도 좌표를 position.json 에서 뽑아냄
		$.ajax({
			url : 'position.json',
			success : function(data) { //서버가 보낸 data
				
				
			    for(key in data) {
    				//console.log(data[key].대분류);
    				large.push(data[key].대분류);
				}
			
				function unique(large) {
					
					$.each(large, function(index, element) {             //배열의 원소수만큼 반복
						if ($.inArray(element, l_result) == -1) {  //result 에서 값을 찾는다.  //값이 없을경우(-1)
							l_result.push(element);                       //result 배열에 값을 넣는다.
						}
					});
					return l_result;
				}
				
				unique(large);
				//console.log(l_result);
				//console.log(l_result.length);
				for(var key in l_result){
					//console.log(l_result[kkk]);
					$('#large').append("<option>"+l_result[key]+"</option>");
				}
				
				//대분류 선택시 중분류 선택으로
				$('#large').change(function() {
					var middle =new Array();
					var m_result = new Array();
					
					m_result.pop(); //배열 비움
					
					//기능구현
					//console.log($("#large option:selected").val());
					 var _large =$("#large option:selected").val();
				 	 for(var i=0 ; i<data.length ; i++){
						 if(data[i].대분류== _large ){
							//console.log(data[i].중분류);
							middle.push(data[i].중분류);
						 }  
						
					  }
					  function unique(middle) {
							
							$.each(middle, function(index, element) {             //배열의 원소수만큼 반복
								if ($.inArray(element, m_result) == -1) {  //result 에서 값을 찾는다.  //값이 없을경우(-1)
									m_result.push(element);                       //result 배열에 값을 넣는다.
								}
							});
							return m_result;
					  }
					  unique(middle);
					  console.log(m_result);
					
					  $('#middle').empty();
					  $('#middle').append("<option>선택</option>");
					  for(var key in m_result){
					 	 //console.log(l_result[kkk]);
					  	 $('#middle').append("<option>"+m_result[key]+"</option>");
					  }
				
					
				 	 //console.log(middle);
					
				});
				
				//중분류 선택하면 소분류로
				$('#middle').change(function(){
					var small =new Array();
					var s_result = new Array();
					
					s_result.pop(); //배열 비움	
					
					console.log($("#middle option:selected").val());
					var _large =$("#large option:selected").val();
					var _middle =$("#middle option:selected").val();
					
					
					for(var i=0 ; i<data.length ; i++){
						//console.log(data[i].중분류);
						 if(data[i].대분류== _large && data[i].중분류== _middle ){
							//console.log(data[i].중분류);
							small.push(data[i].소분류);
						
						 }  
						
					 }
					 function unique(small) {
							
							$.each(small, function(index, element) {             //배열의 원소수만큼 반복
								if ($.inArray(element, s_result) == -1) {  //result 에서 값을 찾는다.  //값이 없을경우(-1)
									s_result.push(element);                       //result 배열에 값을 넣는다.
								}
							});
							return s_result;
					  }
					  unique(small);
					  console.log(s_result);
					  
					  $('#small').empty();
					  $('#small').append("<option>선택</option>");
					  for(var key in s_result){
					 	 //console.log(l_result[kkk]);
					  	 $('#small').append("<option>"+s_result[key]+"</option>");
					  }
				});
				
				
				//좌표 찾기, 입력
				$('#small').change(function(){
					var latitude =new Array();
					var longtitude = new Array();
					
					var latitude_result =new Array();
					var longtitude_result =new Array();
					
					latitude_result.pop(); //배열 비움	
					longtitude_result.pop();
					
					console.log($("#small option:selected").val());
					var _large =$("#large option:selected").val();
					var _middle =$("#middle option:selected").val();
					var _small =$("#small option:selected").val();
					
					for(var i=0 ; i<data.length ; i++){
						//console.log(data[i].중분류);
						 if(data[i].대분류== _large && data[i].중분류== _middle && data[i].소분류== _small ){
							//console.log(data[i].중분류);
							latitude.push(data[i].위도);
							longtitude.push(data[i].경도);
						
						 }  
						
					 }

					  console.log(latitude);
					  console.log(longtitude);
					  
					  $('#latitude').empty();
					  $('#longtitude').empty();
					  $('#latitude').val(latitude);
					  $('#longtitude').val(longtitude);
					
				});
				
			}
		
		
		});
		
		
		$('#buttonprice').click(function(){
			
			var form_data = {
					base_date : $("#base_date").val(),
					base_time : $("#base_time").val(),
					nx : $("#latitude").val(),
					ny : $("#longtitude").val()
				};
			
			$.ajax({
				type : "POST",
				url : 'RealTime_Forecast_Api.five',
				data : form_data,
				//datatype : "json",
				success : function(data) { //서버가 보낸 data
					
					data = JSON.parse(data);
					console.log(data);
					//console.log(data.body.items.item.wfSv);
					
					$('#table').empty();
					$('#table').append("<tr id='category'></tr>");
					$('#table').append("<tr id='obsrValue'></tr>");
					for(var i=0; i<data.body.items.length ; i++){
						console.log(data.body.items[i].category);
						console.log(data.body.items[i].obsrValue);
						//$('#table').append("<td id='"+i+"'>" + data.body.items[i].category+ "</td>");
						var category = data.body.items[i].category; 
						var obsrValue = data.body.items[i].obsrValue;

					 	if(category=="T1H"){
					 		category=category.replace("T1H", "기온");
					 		obsrValue=obsrValue+"℃";
						}else if(category=="RN1"){
							category=category.replace("RN1", "1시간 강수량");
							if(obsrValue=="0") obsrValue="0mm 또는 없음";
							if(obsrValue=="1") obsrValue="1mm 미만";
							if(obsrValue=="5") obsrValue="1~4mm";
							if(obsrValue=="10") obsrValue="5~9mm";
							if(obsrValue=="20") obsrValue="10~19mm	";
							if(obsrValue=="40") obsrValue="20~39mm	";
							if(obsrValue=="70") obsrValue="40~69mm	";
							if(obsrValue=="100") obsrValue="70mm 이상";
							
						}else if(category=="SKY"){
							category=category.replace("SKY", "하늘상태");
							if(obsrValue=="1") obsrValue="맑음";
							if(obsrValue=="2") obsrValue="구름조금";
							if(obsrValue=="3") obsrValue="구름많음";
							if(obsrValue=="4") obsrValue="흐림";
						}else if(category=="UUU"){
							category=category.replace("UUU", "동서바람성분");
							(obsrValue[0]=="-") ? obsrValue=obsrValue.replace("-","서 ") : obsrValue="동 "+obsrValue;
						}else if(category=="VVV"){
							category=category.replace("VVV", "남북바람성분");
							(obsrValue[0]=="-") ? obsrValue=obsrValue.replace("-","남 ") : obsrValue="북 "+obsrValue;
						}else if(category=="REH"){
							category=category.replace("REH", "습도");
							obsrValue=obsrValue+"%";
						}else if(category=="PTY"){
							category=category.replace("PTY", "강수형태");
							if(obsrValue=="0") obsrValue="없음";
							if(obsrValue=="1") obsrValue="비";
							if(obsrValue=="2") obsrValue="비/눈";
							if(obsrValue=="3") obsrValue="눈";
						}else if(category=="LGT"){
							category=category.replace("LGT", "낙뢰");
							if(obsrValue=="0") obsrValue="없음";
							if(obsrValue=="1") obsrValue="있음";
						}else if(category=="VEC"){
							category=category.replace("VEC", "풍향");
						
							if(obsrValue<45) obsrValue=obsrValue+"° / N-NE";
							if(obsrValue>=45 && obsrValue<90) obsrValue=obsrValue+"° / NE-E";
							if(obsrValue>=90 && obsrValue<135) obsrValue=obsrValue+"° / E-SE";
							if(obsrValue>=135&& obsrValue<180) obsrValue=obsrValue+"° / SE-S";
							if(obsrValue>=180 && obsrValue<225) obsrValue=obsrValue+"° / S-SW";
							if(obsrValue>=225 && obsrValue<270) obsrValue=obsrValue+"° / SW-W";
							if(obsrValue>=270 && obsrValue<315) obsrValue=obsrValue+"° / W-NW";
							if(obsrValue>=315 && obsrValue<=360) obsrValue=obsrValue+"° / NW-N";
							

						}else if(category=="WSD"){
							category=category.replace("WSD", "풍속");
							if(obsrValue<4) obsrValue=obsrValue+"m/s"+" 약";
							if(obsrValue>=4 && obsrValue<9) obsrValue=obsrValue+"m/s"+" 약간강";
							if(obsrValue<14 && obsrValue>=9) obsrValue=obsrValue+"m/s"+" 강";
							if(obsrValue>=14) obsrValue=obsrValue+"m/s"+" 매우강";
						}
						$('#category').append("<td id='"+i+"'>" + category+ "</td>");
						$('#obsrValue').append("<td id='"+i+"'>" + obsrValue+ "</td>");
					}
				
				
					
				}
			});
			
		});
		
		
	
	});
	
<%
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sdf1 = new SimpleDateFormat("hh00");
	
	System.out.println("현재시간 : "+ sdf1.format(d));
	String base_date=sdf.format(d);  
	String base_time=sdf1.format(d);   
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
				<td>대분류
					<select id="large">
						<option>선택</option>
					</select>
				</td>
				<td>중분류
					<select id="middle">
						<option>선택</option>
					</select>
				</td>
				<td>소분류
					<select id="small">
						<option>선택</option>
					</select>
				</td>
				
				<td>
					x좌표<input type="text" id="latitude" readonly="readonly">
				</td>
				<td>
					y좌표<input type="text" id="longtitude" readonly="readonly">
				</td>
				<td>
					<input type="hidden" id="base_date" value="<%=base_date%>">
					<input type="hidden" id="base_time" value="<%=base_time%>">
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