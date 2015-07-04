<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!--날씨아이콘 css 설정  -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/weather-icons-master/css/weather-icons.css"  type="text/css">
<!-- <script src="//code.jquery.com/jquery-1.11.2.min.js"></script> -->
<!-- div 드래그이동 설정 -->

<!-- <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->


<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- 툴팁 -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

 
 
 
 
<style>
   #widget_layer{
   width: 300px;
   height: 100px;   
   font-size:9pt;
   position: absoulte;
   top:120px; left:1000px; 
   z-index: 130;
	
   }
   #drag_category td, #drag_weather_icon td, #drag_obsrValue td{
 	padding-left:10px;
 	padding-right:10px;
 	vertical-align : middle;
 	text-align: center;
 	background-color: window;
   }
</style>

<style>
  /* Tooltip */
  .tooltip > .tooltip-inner {
      background-color: white; 
      color: black; 
      border: 1px solid black; 
      padding: 8px;
      font-size: 11px;
      
  }
  /* Tooltip on top */
  #min_tool + .tooltip.top > .tooltip-arrow {
      border-top: 5px solid white;
  }
  /* Tooltip on bottom */
 #min_tool + .tooltip.bottom > .tooltip-arrow {
      border-bottom: 5px solid blue;
  }
  /* Tooltip on left */
 #min_tool+ .tooltip.left > .tooltip-arrow {
      border-left: 5px solid red;
  }
  /* Tooltip on right */
  #min_tool + .tooltip.right > .tooltip-arrow {
      border-right: 5px solid black;
  }
  </style>

<!--div 드래그 이동에 들어갈 날씨 위젯 스크립트  -->
<script>
$(function() {

	//툴팁
	$('#click_on_off').tooltip({title: "날씨위젯 <br> on/off", html: true,placement: "right"}); 	

	$('#text_search').tooltip({title: "동/읍을 입력후 <br> 검색하시고 선택하세요", html: true, placement: "top"}); 	
	
	//위젯 감추기 보이기
		$('#click_on_off').click(function(){
			 //console.log(on_off);
		     if(on_off.style.display=="block"){ 
		    	 
		    	 on_off.style.display = "none"; 
		   	 }else{ 
		   		
		   		on_off.style.display = "block"; 
		   		
		   	 }
		});
	
	console.log("<%=request.getContextPath()%>");
        $('#widget_layer').draggable();
        
        
		$.ajax({
			url : "<%=request.getContextPath()%>/position.json",
			success : function(data) {	
				
				//동,읍을 입력해 동,읍을 뿌려줌
				$('#button_search').click(function() {
					$('#select_search').empty();
					$('#select_search').append("<option>선택하세요</option>");
					for(key in data) {
						var s_result =data[key].소분류;
						var search_result = $('#text_search').val();
	    				if(s_result.indexOf(search_result)>=0){
	    					$('#select_search').append("<option>"+data[key].대분류+" "+data[key].중분류+" "+data[key].소분류+"</option>");
	    				}
					}
				});
				$('#select_search').change(function(){
					var select_search_value=$("#select_search option:selected").val().trim();
					var kkk = select_search_value.split(" ");
					 //console.log(kkk);
					for(key in data) {
						if(kkk[0]==data[key].대분류 && kkk[1]==data[key].중분류 && kkk[2]==data[key].소분류){
							$('#search_nx').val(data[key].위도);
							$('#search_ny').val(data[key].경도);
						}
					}
					
					var form_data = {
							base_date : $("#base_date").val(),
							base_time : $("#base_time").val(),
							nx : $('#search_nx').val(),
							ny : $('#search_ny').val()
						};
					
					$.ajax({
						type : "POST",
						url : '<%=request.getContextPath()%>/RealTime_Forecast_Api.five',
						data : form_data, 
						//datatype : "json",
						success : function(data) { //서버가 보낸 data
							
							data = JSON.parse(data);
							//console.log(data);
							//console.log(data.body.items.item.wfSv);
							
							$('#drag').empty();
							$('#drag').append("<tr id='drag_category'><td id='drag_category01' rowspan='3'></td><td id='drag_category02' ></td><td id='drag_category03' ></td></tr>");
							$('#drag').append("<tr id='drag_weather_icon'><td id='drag_weather_icon02' ></td><td id='drag_weather_icon03' rowspan='2' ></td></tr>");
							$('#drag').append("<tr id='drag_obsrValue'><td id='drag_obsrValue02' ></td></tr>");
							for(var i=0; i<data.body.items.length ; i++){
								if(i!=0 && i!=1 && i!=6  && i!=8 ){
								//console.log(data.body.items[i].category);
								//console.log(data.body.items[i].obsrValue);
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
										obsrValue=obsrValue+"° <br> N-NE";
									}
									else if(obsrValue>=45 && obsrValue<90) {
										
										if(obsrValue==45){
											weather_icon="<i class='wi wi-wind-default _45-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>45 && obsrValue<=65){
											weather_icon="<i class='wi wi-wind-default _60-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>65 && obsrValue<90){
											weather_icon="<i class='wi wi-wind-default _75-deg' style='font-size: 30px'></i>";
										}
										obsrValue=obsrValue+"° <br> NE-E";
									}
									else if(obsrValue>=90 && obsrValue<135) {
										if(obsrValue==90){
											weather_icon="<i class='wi wi-wind-default _90-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>90 && obsrValue<=110){
											weather_icon="<i class='wi wi-wind-default _105-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>110 && obsrValue<135){
											weather_icon="<i class='wi wi-wind-default _120-deg' style='font-size: 30px'></i>";
										}
										obsrValue=obsrValue+"° <br> E-SE";
									}
									else if((obsrValue>=135) && (obsrValue<180)) {
										if(obsrValue==135){
											weather_icon="<i class='wi wi-wind-default _135-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>135 && obsrValue<=155){
											weather_icon="<i class='wi wi-wind-default _150-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>155 && obsrValue<180){
											weather_icon="<i class='wi wi-wind-default _165-deg' style='font-size: 30px'></i>";
										}
										obsrValue=obsrValue+"° <br> SE-S";
									}
									else if(obsrValue>=180 && obsrValue<225) {
										if(obsrValue==180){
											weather_icon="<i class='wi wi-wind-default _180-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>180 && obsrValue<=200){
											weather_icon="<i class='wi wi-wind-default _195-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>200 && obsrValue<225){
											weather_icon="<i class='wi wi-wind-default _210-deg' style='font-size: 30px'></i>";
										}
										obsrValue=obsrValue+"° <br> S-SW";
									}
									else if(obsrValue>=225 && obsrValue<270) {
										if(obsrValue==225){
											weather_icon="<i class='wi wi-wind-default _225-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>225 && obsrValue<=245){
											weather_icon="<i class='wi wi-wind-default _240-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>245 && obsrValue<270){
											weather_icon="<i class='wi wi-wind-default _255-deg' style='font-size: 30px'></i>";
										}
										obsrValue=obsrValue+"° <br> SW-W";
									}
									else if(obsrValue>=270 && obsrValue<315) {
										if(obsrValue==270){
											weather_icon="<i class='wi wi-wind-default _270-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>270 && obsrValue<=290){
											weather_icon="<i class='wi wi-wind-default _285-deg' style='font-size: 30px'></i>";
										}else if(obsrValue>290 && obsrValue<315){
											weather_icon="<i class='wi wi-wind-default _300-deg' style='font-size: 30px'></i>";
										}
										obsrValue=obsrValue+"° <br> W-NW";
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
										obsrValue=obsrValue+"° <br> NW-N";
									}
									
								//풍속	
								}else if(category=="WSD"){
									category=category.replace("WSD", "풍속");
									if(obsrValue<4) {
										if(obsrValue<1) weather_icon="<i class='wi wi-beafort-0' style='font-size: 30px'></i>";
										if(obsrValue>=1 && obsrValue<2) weather_icon="<i class='wi wi-beafort-1' style='font-size: 30px'></i>";
										if(obsrValue>=2 && obsrValue<3) weather_icon="<i class='wi wi-beafort-2' style='font-size: 30px'></i>";
										if(obsrValue>=3 && obsrValue<4) weather_icon="<i class='wi wi-beafort-3' style='font-size: 30px'></i>";
										obsrValue=obsrValue+"m/s";//+" 약";
									}
									if(obsrValue>=4 && obsrValue<9) {
										if(obsrValue>=4 && obsrValue<5) weather_icon="<i class='wi wi-beafort-4' style='font-size: 30px'></i>";
										if(obsrValue>=5 && obsrValue<6) weather_icon="<i class='wi wi-beafort-5' style='font-size: 30px'></i>";
										if(obsrValue>=6 && obsrValue<7) weather_icon="<i class='wi wi-beafort-6' style='font-size: 30px'></i>";
										if(obsrValue>=7 && obsrValue<8) weather_icon="<i class='wi wi-beafort-7' style='font-size: 30px'></i>";
										if(obsrValue>=8 && obsrValue<9) weather_icon="<i class='wi wi-beafort-8' style='font-size: 30px'></i>";
										obsrValue=obsrValue+"m/s";//+" 약간강";
									}
									if(obsrValue<14 && obsrValue>=9) {
										if(obsrValue>=9 && obsrValue<10) weather_icon="<i class='wi wi-beafort-9' style='font-size: 30px'></i>";
										if(obsrValue>=10 && obsrValue<11) weather_icon="<i class='wi wi-beafort-10' style='font-size: 30px'></i>";
										if(obsrValue>=11 && obsrValue<12) weather_icon="<i class='wi wi-beafort-11' style='font-size: 30px'></i>";
										if(obsrValue>=12 && obsrValue<14) weather_icon="<i class='wi wi-beafort-12' style='font-size: 30px'></i>";
										obsrValue=obsrValue+"m/s";//+" 강";
									}
									if(obsrValue>=14) {
										weather_icon="<i class='wi wi-beafort-12' style='font-size: 30px'></i>";
										obsrValue=obsrValue+"m/s";//+" 매우강";
									}
								}
								if(i==2){
									$('#drag_category03').append( weather_icon+"&nbsp;&nbsp;&nbsp;"+obsrValue);
								}
								if(i==3){
									$('#drag_weather_icon03').append( weather_icon+"<br>"+obsrValue);
								}
								if(i==4){
									$('#drag_category01').append( weather_icon+ "<br>"+obsrValue);
								}
								if(i==5){
									$('#drag_category02').append( weather_icon +"&nbsp;&nbsp;&nbsp;"+ obsrValue);
									
								}
								if(i==7){
									$('#drag_weather_icon02').append( weather_icon+"&nbsp;&nbsp;&nbsp;"+category+obsrValue);
								}
								if(i==9){
									
									$('#drag_obsrValue02').append(weather_icon+"&nbsp;&nbsp;&nbsp;"+ category+obsrValue);
								}
								//$('#drag #drag_category').append("<td id='"+i+"' align='center' style='padding: 10px'>" + category+ "</td>");
								//$('#drag #drag_weather_icon').append("<td id='"+i+"' align='center' style='padding: 10px'>" + weather_icon+ "</td>");
								//$('#drag #drag_obsrValue').append("<td id='"+i+"' align='center' style='padding: 10px'>" + obsrValue+ "</td>");
							}
						
						
							}
						}
					});
					
					
					
					
				});
				
				
			}
		});
		
		
			var form_data = {
					base_date : $("#base_date").val(),
					base_time : $("#base_time").val(),
					nx : 93,
					ny : 131
				};
			
			$.ajax({
				type : "POST",
				url : '<%=request.getContextPath()%>/RealTime_Forecast_Api.five',
				data : form_data,
				//datatype : "json",
				success : function(data) { //서버가 보낸 data
					
					data = JSON.parse(data);
					//console.log(data);
					//console.log(data.body.items.item.wfSv);
					
					$('#drag').empty();
					$('#drag').append("<tr id='drag_category'><td id='drag_category01' rowspan='3'></td><td id='drag_category02' ></td><td id='drag_category03' ></td></tr>");
					$('#drag').append("<tr id='drag_weather_icon'><td id='drag_weather_icon02' ></td><td id='drag_weather_icon03' rowspan='2' ></td></tr>");
					$('#drag').append("<tr id='drag_obsrValue'><td id='drag_obsrValue02' ></td></tr>");
					for(var i=0; i<data.body.items.length ; i++){
						if(i!=0 && i!=1 && i!=6  && i!=8 ){
						//console.log(data.body.items[i].category);
						//console.log(data.body.items[i].obsrValue);
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
								obsrValue=obsrValue+"m/s";//+" 약";
							}
							if(obsrValue>=4 && obsrValue<9) {
								if(obsrValue>=4 && obsrValue<5) weather_icon="<i class='wi wi-beafort-4' style='font-size: 30px'></i>";
								if(obsrValue>=5 && obsrValue<6) weather_icon="<i class='wi wi-beafort-5' style='font-size: 30px'></i>";
								if(obsrValue>=6 && obsrValue<7) weather_icon="<i class='wi wi-beafort-6' style='font-size: 30px'></i>";
								if(obsrValue>=7 && obsrValue<8) weather_icon="<i class='wi wi-beafort-7' style='font-size: 30px'></i>";
								if(obsrValue>=8 && obsrValue<9) weather_icon="<i class='wi wi-beafort-8' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s";//+" 약간강";
							}
							if(obsrValue<14 && obsrValue>=9) {
								if(obsrValue>=9 && obsrValue<10) weather_icon="<i class='wi wi-beafort-9' style='font-size: 30px'></i>";
								if(obsrValue>=10 && obsrValue<11) weather_icon="<i class='wi wi-beafort-10' style='font-size: 30px'></i>";
								if(obsrValue>=11 && obsrValue<12) weather_icon="<i class='wi wi-beafort-11' style='font-size: 30px'></i>";
								if(obsrValue>=12 && obsrValue<14) weather_icon="<i class='wi wi-beafort-12' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s";//+" 강";
							}
							if(obsrValue>=14) {
								weather_icon="<i class='wi wi-beafort-12' style='font-size: 30px'></i>";
								obsrValue=obsrValue+"m/s";//+" 매우강";
							}
						}
						if(i==2){
							$('#drag_category03').append( weather_icon+"&nbsp;&nbsp;&nbsp;"+obsrValue);
						}
						if(i==3){
							$('#drag_weather_icon03').append( weather_icon+"<br>"+obsrValue);
						}
						if(i==4){
							$('#drag_category01').append( weather_icon+ "<br>"+obsrValue);
							
							
						}
						if(i==5){
							$('#drag_category02').append( weather_icon +"&nbsp;&nbsp;&nbsp;"+ obsrValue);
							
						}
						if(i==7){
							$('#drag_weather_icon02').append( weather_icon+"&nbsp;&nbsp;&nbsp;"+category+obsrValue);
						}
						if(i==9){
							
							$('#drag_obsrValue02').append(weather_icon+"&nbsp;&nbsp;&nbsp;"+ category+obsrValue);
						}
						//$('#drag #drag_category').append("<td id='"+i+"' align='center' style='padding: 10px'>" + category+ "</td>");
						//$('#drag #drag_weather_icon').append("<td id='"+i+"' align='center' style='padding: 10px'>" + weather_icon+ "</td>");
						//$('#drag #drag_obsrValue').append("<td id='"+i+"' align='center' style='padding: 10px'>" + obsrValue+ "</td>");
					}
				
				
					}
				}
			});
			
		
});

<%
Date d = new Date();
Calendar time=Calendar.getInstance ( );  

SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
SimpleDateFormat sdf1 = new SimpleDateFormat("HH00"); 
DecimalFormat df = new DecimalFormat("00");

time.add(Calendar.HOUR_OF_DAY, -1 ); 
int Day_time = time.get( Calendar.HOUR_OF_DAY);



System.out.println("현재시간-1 : "+ df.format(Day_time)+"00");
System.out.println("현재시간 -1 : " +sdf1.format(Day_time));

String base_date=sdf.format(d);  
String base_time=df.format(Day_time)+"00"; 

%>
</script>

</head>
<body>

	<div id=widget_layer >	
		<li class="wi wi-day-cloudy" aria-hidden="true" id="click_on_off" style="float: right; font-size: 20px"></li> 
		
		<div id="on_off" style="display:none">
			<input type="text" id="text_search" style="width: 50px; margin-bottom: 3px;" class="btn btn-default btn-xs"/><span></span>
			<span id="button_search" style=" margin-bottom: 3px;" class="btn btn-default btn-xs">
			<span class="glyphicon glyphicon-search"></span>동/읍
			</span>
			<select id="select_search" style="width: 140px; margin-bottom: 3px;" class="btn btn-default btn-xs">
				<option>선택하세요</option>
			</select>
			<input type="hidden" id="search_nx" readonly="readonly">
			<input type="hidden" id="search_ny" readonly="readonly">
			<input type="hidden" id="base_date" value="<%=base_date%>">
			<input type="hidden" id="base_time" value="<%=base_time%>">
		
			
			<table id="drag" class="table table-bordered"  >  <!-- class="table table-striped" -->
	  		</table>
	  	</div>
	</div>

</body>
</html>