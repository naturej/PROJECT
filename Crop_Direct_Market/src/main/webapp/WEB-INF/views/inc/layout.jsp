<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="">
    <meta name="author" content="CSSNectar.com">
    <title>오덕리</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css">
   	<%-- <!-- Fonts -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr.custom.js"></script> --%>
    <link href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Lightbox CSS -->
	<link href="<%=request.getContextPath()%>/css/nivo-lightbox.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
    <!-- Carousel CSS -->
	<link href="<%=request.getContextPath()%>/css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="<%=request.getContextPath()%>/css/owl.theme.css" rel="stylesheet" media="screen" />
    <!-- Hornet animation CSS -->
	<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" />
    <!-- Hornet slideshow CSS -->
    <link href="<%=request.getContextPath()%>/css/slideshow.css" rel="stylesheet" />
    <!-- Hornet theme CSS -->
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/colors.css" rel="stylesheet">  
	<!-- Core JavaScript Files -->
	<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.js"></script>
	<script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/nivo-lightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/stellar.js"></script>
	<script src="<%=request.getContextPath()%>/js/wow.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/js/custom.js"></script> 
</head>

<body>
	<!-- Header 영역 -->
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="widget"/>
	
	<!-- main 영역 -->
	<tiles:insertAttribute name="content"/>
	
	<!-- footer 영역 -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>