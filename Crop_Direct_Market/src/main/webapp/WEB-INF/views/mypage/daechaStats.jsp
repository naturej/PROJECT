<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
	});
</script>
<!doctype html>
<head>
<title>Doughnut Chart</title>
<script src="<%=request.getContextPath()%>/js/Chart.js"></script>
<style>
body {
	padding: 0;
	margin: 0;
}

#canvas-holder {
	width: 30%;
}
</style>
</head>
<body>
	<section id="service" class="home-section text-center">
	<div class="heading-about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
							<h2>대차대조 입력</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>온라인/직거래 판매비율</p>
						</div>
					</div>
				</div>
			</div>
			<div id="canvas-holder">
				<canvas id="chart-area" width="500" height="500" />
			</div>

			<script>
			var dir=${dir};
			var indir=${indir};
			var total= parseInt(dir)+parseInt(indir);
			var perdir = Math.round(parseInt(dir)/parseInt(total)*100);
			var perindir =Math.round(parseInt(indir)/parseInt(total)*100);
				var doughnutData = [ {
					value : perdir,
					color : "#F7464A",
					highlight : "#FF5A5E",
					label : "직거래"
				}, {
					value : perindir,
					color : "#46BFBD",
					highlight : "#5AD3D1",
					label : "온라인거래"
				} ];

				window.onload = function() {
					var ctx = document.getElementById("chart-area").getContext(
							"2d");
					window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
						responsive : true
					}); 
					
				}; 
			</script> 
</body>
</html>
