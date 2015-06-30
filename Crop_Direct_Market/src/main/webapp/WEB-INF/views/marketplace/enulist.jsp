<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="">
    <meta name="author" content="CSSNectar.com">
	<title>에누리 목록</title>
<!-- 	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
<!--     Fonts -->
<!--     <script type="text/javascript" src="js/modernizr.custom.js"></script> -->
<!--     <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<!--     Lightbox CSS -->
<!-- 	<link href="css/nivo-lightbox.css" rel="stylesheet" /> -->
<!-- 	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" /> -->
<!--     Carousel CSS -->
<!-- 	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" /> -->
<!--     <link href="css/owl.theme.css" rel="stylesheet" media="screen" /> -->
<!--     Hornet animation CSS -->
<!-- 	<link href="css/animate.css" rel="stylesheet" /> -->
<!--     Hornet slideshow CSS -->
<!--     <link href="css/slideshow.css" rel="stylesheet" /> -->
<!--     Hornet theme CSS -->
<!--     <link href="css/style.css" rel="stylesheet"> -->
<!-- 	<link href="css/colors.css" rel="stylesheet"> -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	function popup(enu_idx){
		window.open('enuDetail.five?enu_idx='+enu_idx,'에누리 상세보기', 'width=430 height=490')
	}
</script>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
     <section id="service" class="home-section text-center">
		
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>에누리 목록</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					</div>
					</div>
				</div>
			</div>
   	 <div class="CSSTableGenerator">
		<table>
			<tr>
				<td>번호</td>
				<td>보내는사람</td>
				<td>제목</td>
				<td>작성일</td>
				<td>상태</td>
			</tr>
			<c:forEach items="${list}" var="e">
			<tr>
				<td>${e.enu_idx}</td>
				<td>${e.user_id}</td>
				<td><a href="#" onclick="popup('${e.enu_idx}')">RE:${e.bo_subject}</a></td>
				<td>${e.enu_date}</td>
				<c:if test="${e.enu_confirm == '0'}"><td>대기중</td></c:if>
				<c:if test="${e.enu_confirm == '1'}"><td>수락</td></c:if>
				<c:if test="${e.enu_confirm == '2'}"><td>거절</td></c:if>
			</tr>
			</c:forEach>
		</table>
			</div>
			</div>
	</div>
	</section>
</body>
</html>