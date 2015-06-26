<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

	
<!--날씨아이콘 css 설정  -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/weather-icons-master/css/weather-icons.css"  type="text/css">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


<!--Api 데이터를 요청하는 함수  -->
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
			
				//중복값 제거
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
					  $('#middle').append("<option>선택하세요  </option>");
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
					  $('#small').append("<option>선택하세요  </option>");
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
		
		
		//뽑아낸 데이터를 전송해서 날씨결과를 얻음
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
					$('#table').append("<tr id='weather_icon'></tr>");
					$('#table').append("<tr id='obsrValue'></tr>");
					for(var i=0; i<data.body.items.length ; i++){
						console.log(data.body.items[i].category);
						console.log(data.body.items[i].obsrValue);
						//$('#table').append("<td id='"+i+"'>" + data.body.items[i].category+ "</td>");
						var category = data.body.items[i].category; 
						var weather_icon = "";
						var obsrValue = data.body.items[i].obsrValue;
						
						//기온
					 	if(category=="T1H"){
					 		category=category.replace("T1H", "기온");
					 		weather_icon="<i class='wi wi-thermometer' style='font-size: 30px'></i>";
					 		obsrValue=obsrValue+"℃";
					 	
					 	//강수량	
						}else if(category=="RN1"){
							category=category.replace("RN1", "1시간 강수량");
							weather_icon="<i class='wi wi-umbrella' style='font-size: 30px'></i>";
							if(obsrValue=="0") obsrValue="0mm 또는 없음";
							if(obsrValue=="1") obsrValue="1mm 미만";
							if(obsrValue=="5") obsrValue="1~4mm";
							if(obsrValue=="10") obsrValue="5~9mm";
							if(obsrValue=="20") obsrValue="10~19mm	";
							if(obsrValue=="40") obsrValue="20~39mm	";
							if(obsrValue=="70") obsrValue="40~69mm	";
							if(obsrValue=="100") obsrValue="70mm 이상";
							
						//하늘상태
						}else if(category=="SKY"){
							category=category.replace("SKY", "하늘상태");
							if(obsrValue=="1") {obsrValue="맑음"; weather_icon="<i class='wi wi-day-sunny' style='font-size: 30px'></i>";}
							if(obsrValue=="2") {obsrValue="구름조금"; weather_icon="<i class='wi wi-day-sunny-overcast' style='font-size: 30px'></i>";}
							if(obsrValue=="3") {obsrValue="구름많음"; weather_icon="<i class='wi wi-day-cloudy' style='font-size: 30px'></i>";}
							if(obsrValue=="4") {obsrValue="흐림"; weather_icon="<i class='wi wi-cloudy' style='font-size: 30px'></i>";}
						
						//동서바람성분	
						}else if(category=="UUU"){
							category=category.replace("UUU", "동서바람성분");
							(obsrValue[0]=="-") ? weather_icon="<i class='wi wi-left' style='font-size: 30px'></i>" : weather_icon="<i class='wi wi-right' style='font-size: 30px'></i>";
							(obsrValue[0]=="-") ? obsrValue=obsrValue.replace("-","서 ") : obsrValue="동 "+obsrValue;
							
						//남북바람성분	
						}else if(category=="VVV"){
							category=category.replace("VVV", "남북바람성분");
							(obsrValue[0]=="-") ? weather_icon="<i class='wi wi-down' style='font-size: 30px'></i>" : weather_icon="<i class='wi wi-up' style='font-size: 30px'></i>";
							(obsrValue[0]=="-") ? obsrValue=obsrValue.replace("-","남 ") : obsrValue="북 "+obsrValue;
						
						//습도
						}else if(category=="REH"){
							category=category.replace("REH", "습도");
							weather_icon="<i class='wi wi-sprinkles' style='font-size: 30px'></i>";
							obsrValue=obsrValue+"%";
							
						//강수형태	
						}else if(category=="PTY"){
							category=category.replace("PTY", "강수형태");
							if(obsrValue=="0") {
								weather_icon="<i class='wi wi-cloud' style='font-size: 30px'></i>";
								obsrValue="없음";
							}
							if(obsrValue=="1") {
								weather_icon="<i class='wi wi-rain' style='font-size: 30px'></i>";
								obsrValue="비";
							}
							if(obsrValue=="2") {
								weather_icon="<i class='wi wi-rain-mix' style='font-size: 30px'></i>";
								obsrValue="비/눈";
							}
							if(obsrValue=="3") {
								weather_icon="<i class='wi wi-snow' style='font-size: 30px'></i>";
								obsrValue="눈";
							}
							
						//낙뢰	
						}else if(category=="LGT"){
							category=category.replace("LGT", "낙뢰");
							weather_icon="<i class='wi wi-lightning' style='font-size: 30px'></i>";
							if(obsrValue=="0") obsrValue="없음";
							if(obsrValue=="1") obsrValue="있음";
						
						//풍향
						}else if(category=="VEC"){
							
							category=category.replace("VEC", "풍향");							
							if(obsrValue<45 && obsrValue>=0) {
								if(obsrValue==0){
									weather_icon="<i class='wi wi-wind-default _0-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>0 && obsrValue<=20){
									weather_icon="<i class='wi wi-wind-default _15-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>20 && obsrValue<45){
									weather_icon="<i class='wi wi-wind-default _30-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / N-NE";
							}
							else if(obsrValue>=45 && obsrValue<90) {
								
								if(obsrValue==45){
									weather_icon="<i class='wi wi-wind-default _45-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>45 && obsrValue<=65){
									weather_icon="<i class='wi wi-wind-default _60-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>65 && obsrValue<90){
									weather_icon="<i class='wi wi-wind-default _75-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / NE-E";
							}
							else if(obsrValue>=90 && obsrValue<135) {
								if(obsrValue==90){
									weather_icon="<i class='wi wi-wind-default _90-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>90 && obsrValue<=110){
									weather_icon="<i class='wi wi-wind-default _105-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>110 && obsrValue<135){
									weather_icon="<i class='wi wi-wind-default _120-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / E-SE";
							}
							else if((obsrValue>=135) && (obsrValue<180)) {
								if(obsrValue==135){
									weather_icon="<i class='wi wi-wind-default _135-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>135 && obsrValue<=155){
									weather_icon="<i class='wi wi-wind-default _150-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>155 && obsrValue<180){
									weather_icon="<i class='wi wi-wind-default _165-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / SE-S";
							}
							else if(obsrValue>=180 && obsrValue<225) {
								if(obsrValue==180){
									weather_icon="<i class='wi wi-wind-default _180-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>180 && obsrValue<=200){
									weather_icon="<i class='wi wi-wind-default _195-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>200 && obsrValue<225){
									weather_icon="<i class='wi wi-wind-default _210-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / S-SW";
							}
							else if(obsrValue>=225 && obsrValue<270) {
								if(obsrValue==225){
									weather_icon="<i class='wi wi-wind-default _225-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>225 && obsrValue<=245){
									weather_icon="<i class='wi wi-wind-default _240-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>245 && obsrValue<270){
									weather_icon="<i class='wi wi-wind-default _255-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / SW-W";
							}
							else if(obsrValue>=270 && obsrValue<315) {
								if(obsrValue==270){
									weather_icon="<i class='wi wi-wind-default _270-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>270 && obsrValue<=290){
									weather_icon="<i class='wi wi-wind-default _285-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>290 && obsrValue<315){
									weather_icon="<i class='wi wi-wind-default _300-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / W-NW";
							}
							else if(obsrValue>=315 && obsrValue<=360) {
								if(obsrValue==315){
									weather_icon="<i class='wi wi-wind-default _315-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>315 && obsrValue<=335){
									weather_icon="<i class='wi wi-wind-default _330-deg' style='font-size: 30px'></i>";
								}else if(obsrValue>335 && obsrValue<360){
									weather_icon="<i class='wi wi-wind-default _345-deg' style='font-size: 30px'></i>";
								}else if(obsrValue==360){
									weather_icon="<i class='wi wi-wind-default _360-deg' style='font-size: 30px'></i>";
								}
								obsrValue=obsrValue+"° / NW-N";
							}
							
						//풍속	
						}else if(category=="WSD"){
							category=category.replace("WSD", "풍속");
							if(obsrValue<4) {
								if(obsrValue<1) weather_icon="<i class='wi wi-beafort-0' style='font-size: 30px'></i>";
								if(obsrValue>=1 && obsrValue<2) weather_icon="<i class='wi wi-beafort-1' style='font-size: 30px'></i>";
								if(obsrValue>=2 && obsrValue<3) weather_icon="<i class='wi wi-beafort-2' style='font-size: 30px'></i>";
								if(obsrValue>=3 && obsrValue<4) weather_icon="<i class='wi wi-beafort-3' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s"+" 약";
							}
							if(obsrValue>=4 && obsrValue<9) {
								if(obsrValue>=4 && obsrValue<5) weather_icon="<i class='wi wi-beafort-4' style='font-size: 30px'></i>";
								if(obsrValue>=5 && obsrValue<6) weather_icon="<i class='wi wi-beafort-5' style='font-size: 30px'></i>";
								if(obsrValue>=6 && obsrValue<7) weather_icon="<i class='wi wi-beafort-6' style='font-size: 30px'></i>";
								if(obsrValue>=7 && obsrValue<8) weather_icon="<i class='wi wi-beafort-7' style='font-size: 30px'></i>";
								if(obsrValue>=8 && obsrValue<9) weather_icon="<i class='wi wi-beafort-8' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s"+" 약간강";
							}
							if(obsrValue<14 && obsrValue>=9) {
								if(obsrValue>=9 && obsrValue<10) weather_icon="<i class='wi wi-beafort-9' style='font-size: 30px'></i>";
								if(obsrValue>=10 && obsrValue<11) weather_icon="<i class='wi wi-beafort-10' style='font-size: 30px'></i>";
								if(obsrValue>=11 && obsrValue<12) weather_icon="<i class='wi wi-beafort-11' style='font-size: 30px'></i>";
								if(obsrValue>=12 && obsrValue<14) weather_icon="<i class='wi wi-beafort-12' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s"+" 강";
							}
							if(obsrValue>=14) {
								weather_icon="<i class='wi wi-beafort-12' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s"+" 매우강";
							}
						}
						$('#category').append("<td id='"+i+"' align='center' style='padding: 10px'>" + category+ "</td>");
						$('#weather_icon').append("<td id='"+i+"' align='center' style='padding: 10px'>" + weather_icon+ "</td>");
						$('#obsrValue').append("<td id='"+i+"' align='center' style='padding: 10px'>" + obsrValue+ "</td>");
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
</head>

<body>

	<!-- Section: services -->
    <section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>우리동네 실시간 날씨 상황</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>카테고리를 선택하시면 그에 따른 날씨정보를 보여줍니다</p>
					</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<div class="container">
		<div class="row">
			<div class="col-lg-2 col-lg-offset-5">
				<hr class="marginbot-50">
			</div>
		</div>
        <div class="row">
            
				<div class="wow fadeInLeft" data-wow-delay="0.2s">
				
				<form id="priceform"  method="post">
		<table >
			<tr>
				<td width=190>지역
					<select id="large" >
						<option>선택하세요  </option>
					</select>
				</td>
				<td width=190>시,군
					<select id="middle" >
						<option>선택하세요  </option>
					</select>
				</td>
				<td width=190 >동,읍,면
					<select id="small" >
						<option>선택하세요  </option>
					</select>
				</td>
				
				<td>
					<input type="hidden" id="latitude" readonly="readonly">
				</td>
				<td> 
					<input type="hidden" id="longtitude" readonly="readonly">
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

		<table id="table"class="table table-striped" >
			
		</table>
				
               <!--  <div class="service-box">
					<h3><i class="fa fa-css3 fa-3x"></i></h3>
					<div class="service-desc">
						<h5>WEB DESIGN</h5>
						<p>Vestibulum tincidunt enim in pharetra malesuada. Duis semper magna metus electram accommodare.</p>
					</div>
                </div> -->
				</div>
          
			
        </div>		
		</div>
	</section>
	<!-- /Section: services -->
	

	
	

	

</body>

</html>