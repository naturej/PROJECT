<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	
		/* 유효성검사 */
		function checkfield() {

			if (document.joinForm.user_id.value == "") { //id값이 없을 경우
				alert("아이디를 입력하세요"); //메세지 경고창을 띄운 후
				document.joinForm.user_id.focus(); // id 텍스트박스에 커서를 위치
				exit;

			} else if (document.joinForm.user_name.value == "") {
				alert("이름을 입력하세요");
				document.joinForm.user_name.focus();
				exit;

			} else if (document.joinForm.password.value == "") {
				alert("비밀번호를 입력하세요");
				document.joinForm.password.focus();
				exit;

			} else if (document.joinForm.password2.value == "") {
				alert("비밀번호확인을 입력하세요");
				document.joinForm.password2.focus();
				exit;

			} else if (document.joinForm.email.value == "") {
				alert("E-Mail를 입력하세요");
				document.joinForm.email.focus();
				exit;

			} else if (document.joinForm.addr.value == "") {
				alert("지역주소를 입력하세요");
				document.joinForm.addr.focus();
				exit;

			} else if (document.joinForm.addd.value == "") {
				alert("세부주소를 입력하세요");
				document.joinForm.addd.focus();
				exit;

			} else if (document.joinForm.cell_phone.value == "") {
				alert("전화번호를 입력하세요");
				document.joinForm.cell_phone.focus();
				exit;

			} else if (document.joinForm.add_code.value == "") {
				alert("우편번호를 입력하세요");
				document.joinForm.add_code.focus();
				exit;

			}

			if (document.joinForm.password.value != document.joinForm.password2.value) {
				//비밀번호와 비밀번호확인의 값이 다를 경우

				alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
				document.joinForm.password.focus();
				exit;

			}

			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if (exptext.test(document.joinForm.email.value) == false) {
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

				alert("이 메일형식이 올바르지 않습니다.");
				document.joinForm.email.focus();
				exit;
			}
			$.ajax({
				  type: "POST",
				  url: "passwordEncoder.five",
				  data: {password:$('#password').val()},
				  success: function(data){
					  $('#password').val(data);
					  document.joinForm.submit();
				  }
			});
			

		}
		
		
		/* email 조합 */
		function changeEmail(email_v) {
			if (email_v == "1") {
				document.joinForm.email3.style.display="inline";
				document.joinForm.email3.value = "";
			} else {
				document.joinForm.email3.style.display="none";
				document.joinForm.email3.value = email_v;
			}
		
		}
		
		/* 조합한 email 표시 */
		function comfirmemail(){
			document.joinForm.email.style.display="inline";
			document.joinForm.email.value = document.joinForm.email1.value+"@"+document.joinForm.email3.value;
		}
	</script>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="">
    <meta name="author" content="CSSNectar.com">
	<title>회원가입</title>
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
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color: #1ABC9C">
        <div class="container" >
            <div class="navbar-header" >
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="index.jsp">
                    <img src="img/logo.png" alt="Hornet" />
                </a>
            </div>

            <!-- Nav Bar -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
              <ul class="nav navbar-nav" style="background-color: #1ABC9C">
                
                <li><a href="boardlist.five">BOARD</a></li>
                <li><a href="salboardlist.five">SALESBOARD</a></li>
                <li><a href="marketlist.five">MARKET</a></li>
                <li class="dropdown">
             	 <a href="#" class="dropdown-toggle" data-toggle="dropdown">API<b class="caret"></b></a>
            	  <ul class="dropdown-menu">
                <li><a href="searchPriceApi.five">시세정보</a></li>
                <li><a href="MiddleForecastApi.five">중기예보</a></li>
                <li><a href="MiddleForecastApi.five">중기육상예보</a></li>
                <li><a href="MiddleTemperatureApi.five">중기기온조회</a></li>  
                <li><a href="RealTime_Forecast_Api.five">동네실황조회</a></li>  
                <li><a href="searchPriceApi.five">시세정보</a></li>  
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
                <li><a href="mypage/schedule.five">일정</a></li>
              </ul>
              <li><a href="login.five">LOGIN</a></li>
              <li><a href="<c:url value='j_spring_security_logout' />">LOGOUT</a></li>
              </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <!-- Section: contact -->
    <section id="contact" class="home-section text-center">
    	<div class="boxed-grey">
	
	<!-- 회원가입 폼 -->
	<form action="" method="post" name="joinForm" enctype="multipart/form-data" >
		<div class="row">
			<div class="col-md-6 col-lg-6">
				<div class="form-group">
					<!-- ID 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">ID</span>
					<input type="text" class="form-control" name="user_id" placeholder="UserID" required/>
					</div>
					<!-- 이름 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">이름</span>
					<input type="text" class="form-control" name="user_name" placeholder="UserName" required/>
					</div>
					<!-- 비밀번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">비밀번호</span>
					<input type="password" class="form-control" name="password" id="password" placeholder="password" required/>
					</div>
					<!-- 비밀번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">비밀번호 확인</span>
					<input type="password" class="form-control" name="password2" id="password2" placeholder="password" required/>
					</div>
					<!-- Email 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">Email</span>
					<input type="text" class="form-control" name="email1" id="password2" placeholder="Email" required />@
					<select name="email2" onchange="changeEmail(this.value)" >
						<option value="" selected>이메일선택</option>
						<option value="naver.com">naver.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="nate.com">nate.com</option>
						<option value="paran.com">paran.com</option>
						<option value="netian.com">netian.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="kornet.net">kornet.net</option>
						<option value="nownuri.net">nownuri.net</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="freechal.com">freechal.com</option>
						<option value="korea.com">korea.com</option>
						<option value="orgio.net">orgio.net</option>
						<option value="chollian.net">chollian.net</option>
						<option value="hitel.net">hitel.net</option>
						<option value="1">직접입력</option>
					</select> 
					<input type="text" class="form-control" name="email3" style="display: none">
					<input type="button" value="확인" onclick="comfirmemail()" >
					<input type="text" class="form-control" name="email" readonly="readonly">
					</div>
					<!-- 우편번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">우편번호</span>
					<input type="text" class="form-control" name="add_code" placeholder="AddressCode" required/>
					</div>
				</div>
			</div>
		</div>
		<%-- <table>
			<!-- ID 입력 --> 
			<tr>
				<td>ID</td>
				<td><input type="text" name="user_id" placeholder="UserID"></td>
			</tr>

			<!-- 이름 입력 -->
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" placeholder="UserName"></td>
			</tr>

			<!-- 비밀번호 입력 -->
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password" placeholder="Password"></td>
			</tr>

			<!-- 비밀번호 입력 -->
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="password2" placeholder="Password"></td>
			</tr>

			<!-- Email 입력 -->
			<tr>
				<td>Email</td>
				<td>
					<input type="text" name="email1" placeholder="Email">@
					<select name="email2" onchange="changeEmail(this.value)" >
						<option value="" selected>이메일선택</option>
						<option value="naver.com">naver.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="nate.com">nate.com</option>
						<option value="paran.com">paran.com</option>
						<option value="netian.com">netian.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="kornet.net">kornet.net</option>
						<option value="nownuri.net">nownuri.net</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="freechal.com">freechal.com</option>
						<option value="korea.com">korea.com</option>
						<option value="orgio.net">orgio.net</option>
						<option value="chollian.net">chollian.net</option>
						<option value="hitel.net">hitel.net</option>
						<option value="1">직접입력</option>
					</select> 
					<input type="text" name="email3" style="display: none">
					<input type="button" value="확인" onclick="comfirmemail()" >
					<br>
					<input type="text" name="email" readonly="readonly">
				</td>
			</tr>
	
			<!-- 우편번호  -->
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="add_code" placeholder="phoneNumber"></td>
			</tr>
			<!-- 지역주소등록 -->
			<tr>
				<td>지역주소</td>
				<td><input type="text" name="addr" placeholder="address"></td>
			</tr>
	
			<!-- 세부주소 -->
			<tr>
				<td>세부주소</td>
				<td><input type="text" name="addd" placeholder="address"></td>
			</tr>
	
			<!-- 전화번호  -->
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="cell_phone" placeholder="phoneNumber"></td>
			</tr>

			<!-- 유저사진등록 -->
			<tr>
				<td>사진</td>
				<td><input type="file" name="file" placeholder="image"></td>
			</tr>
			<tr><td colspan="2"><hr></td></tr>
			<c:if test="${param.user == 'ROLE_SELLER'}">
				<!-- 농장 ID 입력 --> 
				<tr>
					<td>농장 ID</td>
					<td><input type="text" name="farminfo" placeholder="FarmID"></td>
				</tr>
				
				<!-- 농장 이름 입력 -->
				<tr>
					<td>농장 이름</td>
					<td><input type="text" name="farm_name" placeholder="FarmName"></td>
				</tr>
				
				<!-- 농장지역등록 -->
				<tr>
					<td>농장 지역</td>
					<td><input type="text" name="farm_add" placeholder="FarmAddress"></td>
				</tr>
		
				<!-- 세부주소 -->
				<tr>
					<td>농장 세부주소</td>
					<td><input type="text" name="farm_add_de" placeholder="FarmAddress"></td>
				</tr>
				
				<!-- 농장 주요작물 -->
				<tr>
					<td>농장 주요작물</td>
					<td><input type="text" name="pro_name" placeholder="Product"></td>
				</tr>
				
				<!-- 농장전화번호  -->
				<tr>
					<td>농장 전화번호</td>
					<td><input type="text" name="farm_phon" placeholder="FarmPhoneNumber"></td>
				</tr>
				
				<!-- 농장소개  -->
				<tr>
					<td>농장 소개</td>
					<td><textarea name="farm_comment" placeholder="FarmIntroduce"></textarea></td>
				</tr>
			</c:if>
			
			<tr>
				<td><input type="button" value="가입확인" onclick="checkfield()"></td>
				<td><input type="reset" value="가입취소"></td>
			</tr>
		</table> --%>
		<c:choose>
			<c:when test="${param.user == 'ROLE_SELLER'}">
				<input type="hidden" name="authority" value="ROLE_SELLER">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="authority" value="ROLE_CONSUMER">
			</c:otherwise>
		</c:choose>
	</form>
	</div>
	</section>
	
	<!-- footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="wow shake" data-wow-delay="0.4s">
					<div class="page-scroll marginbot-30">
						<a href="#intro" id="totop" class="btn btn-circle">
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