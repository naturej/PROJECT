<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="">
    <meta name="author" content="CSSNectar.com">
	<title>로그인</title>
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
    
     <section id="service" class="home-section text-center">
		
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>Board</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>농산물 정보 공유 & 공지사항</p>
					</div>
					</div>
				</div>
			</div>
			
   		 <div class="Board_Table" >
			<table>
				<tr><td>제목:${boardDto.subject}</td></tr>
				<tr><td>글쓴이: ${boardDto.user_id}</td></tr>
				<tr><td>작성일:${boardDto.writedate}</td></tr>
				<tr><td>내용:${boardDto.content}</td></tr>
				<tr><td>파일:${boardDto.filename}</td></tr>
			</table>
			
				<a href="boardlist.five">목록</a>
				<a href="boardedit.five?idx=${boardDto.idx}">수정</a>
				<a href="boarddelete.five?idx=${boardDto.idx}">삭제</a>
				<a href="reply.five?idx=${boardDto.idx}">댓글쓰기</a>
			<br>
			<hr>
			</div>
			 <div class="CSSTableGenerator" >
				<table>
				<c:forEach items="${list}" var="n">
				<tr>
					<td>${n.re_idx}</td>
					<td>${n.re_content}</td>
					<td>${n.re_writedate}</td>
					<td>${n.USER_ID}</td>
				</tr>
				</c:forEach>
				</table>
				</div>
				
				<div class="CSSTableGenerator">	
				<form action="reply.five?" method="post" enctype="multipart/form-data">
				<input type="hidden" name="idx" value="${boardDto.idx}">
				<table>
				<tr><td>작성자<input type="text" id="USER_ID" name="USER_ID" /></td></tr>
				<tr><td><textarea id="re_content" name="re_content">내용</textarea></td></tr>
				<tr><td><input type="submit" value="작성" /></td></tr>
				</table>
				</form>	
				</div>
				</div>
		</div>
	</section>
				
</body>
</html>