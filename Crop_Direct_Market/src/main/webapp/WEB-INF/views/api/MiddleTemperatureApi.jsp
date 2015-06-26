<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<!--css 설정  -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="">
    <meta name="author" content="CSSNectar.com">
    <title>Hornet Bootstrap 3 One Page CSS Theme</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Fonts -->
    <script type="text/javascript" src="js/modernizr.custom.js"></script>
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Lightbox CSS -->
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
    <!-- Carousel CSS -->
	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
    <!-- Hornet animation CSS -->
	<link href="css/animate.css" rel="stylesheet" />
    <!-- Hornet slideshow CSS -->
    <link href="css/slideshow.css" rel="stylesheet" />
    <!-- Hornet theme CSS -->
    <link href="css/style.css" rel="stylesheet">
	<link href="css/colors.css" rel="stylesheet">
	

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">   
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">

//중기예보
$(function() {
	
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
				
				$('#table1').empty();
				//console.log(data.title[_title]);
				$('#table1').append("<td>" + data.body.items.item.wfSv + "</td>");
				
			}
		});

	$('#stnId').change(
			
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
						
						$('#table1').empty();
						//console.log(data.title[_title]);
						$('#table1').append("<td>" + data.body.items.item.wfSv + "</td>");
						
					}
				});

			});
});






//3일후 기온
	$(function() {
		
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
						
						$('#table').append("<tr id='tr'></tr>")
						for ( var _title in kkk) {
							
							$('#tr').append(
									"<td>" + kkk[_title] + "</td>");
						}
						for ( var _title in data.body.items.item) {
							
							$('#table').append(
									"<td>" + data.body.items.item[_title] + "</td>");
						} 
					}
				});

			
		$('#regId').change(
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
							
							$('#table').append("<tr id='tr'></tr>")
							for ( var _title in kkk) {
								
								$('#tr').append(
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
	
///3일 맑음	
	$(function() {
		
					var form_data = {
						regId : $("#_regId").val(),
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
							
							$('#table2').empty();
							
							var kkk =["지역코드","3일후 오전","3일후 오후","4일후 오전","4일후 오후","5일후 오전","5일후 오후",
							          "6일후 오전","6일후 오후","7일후 오전","7일후 오후","8일후","9일후","10일후"]
							
							$('#table2').append("<tr id='tr2'></tr>")
							for ( var _title in kkk) {
								$('#tr2').append("<td>" + kkk[_title] + "</td>");
							}
							for ( var _title in data.body.items.item) {
								$('#table2').append("<td>" + data.body.items.item[_title] + "</td>");
							}
						}
					});
					
$('#_regId').change(
		function() {
			var form_data = {
				regId : $("#_regId").val(),
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
										
					$('#table2').empty();
										
					var kkk =["지역코드","3일후 오전","3일후 오후","4일후 오전","4일후 오후","5일후 오전","5일후 오후",
					          "6일후 오전","6일후 오후","7일후 오전","7일후 오후","8일후","9일후","10일후"]
										
					$('#table2').append("<tr id='tr2'></tr>")
					for ( var _title in kkk) {
						$('#tr2').append("<td>" + kkk[_title] + "</td>");
					}
					for ( var _title in data.body.items.item) {
						$('#table2').append("<td>" + data.body.items.item[_title] + "</td>");
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

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="index_1.html">
                    <img src="img/logo.png" alt="Hornet" />
                </a>
            </div>

            <!-- Nav Bar -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#service">Home</a></li>
                <li><a href="boardlist.five">BOARD</a></li>
                <li><a href="salboardlist.five">SALESBOARD</a></li>
                <li><a href="marketlist.five">MARKET</a></li>
                <li class="dropdown">
             	 <a href="#" class="dropdown-toggle" data-toggle="dropdown">API<b class="caret"></b></a>
            	  <ul class="dropdown-menu">
                <li><a href="searchPriceApi.five">시세정보</a></li>
                <li><a href="MiddleTemperatureApi.five">중기예보조회</a></li>  
                <li><a href="RealTime_Forecast_Api.five">실시간 날씨</a></li>  
                
            <!--
            	<li class="divider"></li>
                <li><a href="#">Separated link</a></li>
                <li class="divider"></li>
                <li><a href="#">One more separated link</a></li> 
            -->
              </ul>
           		</li>
           		    <li class="dropdown">
             	 <a href="#" class="dropdown-toggle" data-toggle="dropdown">MYPAGE<b class="caret"></b></a>
            	  <ul class="dropdown-menu">
                <li><a href="schedule.five">일정</a></li>
              </ul>
              <li><a href="login.five">LOGIN</a></li>
              <li><a href="<c:url value='j_spring_security_logout' />">LOGOUT</a></li>
              </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

	<!-- Section: services -->
    <section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>기온 예보</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>3일 이후 부터의 기온을 예보합니다</p>
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
	
	<!--////////////////////////////////////  -->				
	
	<table>
		<tr>
			<td>예보지역
				<select id="regId">
					<option value="11B10101" selected="selected">서울</option>
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
			<td  style="display:none">발표시각
				<select id="tmFc">
					<option value="<%=dateToday %>" selected="selected">현재</option>
				</select>
			</td>
		</tr>
	</table>
<br>	

	<table id="table" class="table table-striped" >
		
	</table>	
<!-- 	//////////// /////////////////////////////-->	

<br>



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
		</tr>
	</table>

<hr>

	<table id="table1" class="table table-striped" >
		
	</table>
	
	<!--  ///////////////////////////////////////////-->		
	
	
	<table>
		<tr>
			<td>예보구역코드
				<select id="_regId">
					<option value="11B00000">서울 인천경기도</option>
					<option value="11D10000">강원도영서</option>
					<option value="11D20000">강원도영동</option>
					<option value="11C20000">대전 세종 충청남도</option>
					<option value="11C10000">충청북도</option>
					<option value="11F20000">광주 전라남도</option>
					<option value="11F10000">전라북도</option>
					<option value="11H10000">대구 경상북도</option>
					<option value="11H20000">부산 울산 경상남도</option>
					
				</select>
			</td>
		
		
		</tr>
	</table>

<hr>
	<table id="table2" class="table table-striped"  >
		
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
	

	
	

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="wow shake" data-wow-delay="0.4s">
					<div class="page-scroll marginbot-30">
						<a href="#service" id="totop" class="btn btn-circle">
							<i class="fa fa-angle-double-up animated"></i>
						</a>
					</div>
					</div>
					<p>Hornet by <a href="http://cssnectar.com/" target="_blank">CSS Nectar</a><br>
&copy; Copyright 2015 All Rights Reserved</p>
                    <p>Note:Images at demo are under cc licence and are not included in download package </p>
				</div>
			</div>	
		</div>
	</footer>

    <!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
	<script src="js/wow.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>

</body>

</html>