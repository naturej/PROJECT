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

<!--Api 데이터를 요청하는 함수  -->
<script type="text/javascript">
	$(function() {
		//미리 초기 설정된 데이타를 요청해서 응답받음
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
								"<td align='center'>" + data.title[_title] + "</td>");
					}
					for (var i = 0; i < data.result.length; i++) {
						$('#table').append("<tr id="+i+"></tr>")
						for ( var _result in data.result[i]) {
							//console.log(data.result[i][_result]+"/"+i);
							$('#' + i).append(
									"<td align='center'>" + data.result[i][_result]
											+ "</td>");
						}
					}
				}
			});
		//특정 데이터를 요청해 응답받음
		$('#type').change(
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
										"<td align='center'>" + data.title[_title] + "</td>");
							}
							for (var i = 0; i < data.result.length; i++) {
								$('#table').append("<tr id="+i+"></tr>")
								for ( var _result in data.result[i]) {
									//console.log(data.result[i][_result]+"/"+i);
									$('#' + i).append(
											"<td align='center'>" + data.result[i][_result]
													+ "</td>");
								}
							}
						}
					});

				});
	});		
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
					<h2>시세정보</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>카테고리를 선택하시면 그에 따른 시세정보를 보여줍니다</p>
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
					<table>
						<tr>
							<td>
								<select id="work" style="display:none">
									<option value="1" selected="selected" >도매</option>
								</select>
							</td>
							<td>분류
								<select id="type">
									<option value="1">채소</option>
									<option value="2">과수</option>
									<option value="3">축산</option>
									<option value="4">화훼</option>
									<option value="5">임산물</option>
									<option value="6">식량</option>
								</select>
							</td>
						</tr>
					</table><br>
					
					<table id="table"  class="table table-striped">
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