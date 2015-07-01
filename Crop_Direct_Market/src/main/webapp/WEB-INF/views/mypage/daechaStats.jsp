<%@page import="java.util.Calendar"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
<title>Doughnut Chart</title>
<script src="<%=request.getContextPath()%>/js/Chart.js"></script>
<%
	Calendar cal = Calendar.getInstance();
	String year = cal.get(Calendar.YEAR) + "년";
	String month = cal.get(Calendar.MONTH) + 1 + "월";
	String day = cal.get(Calendar.DAY_OF_MONTH) + "일";
	String result = year + " " + month + " " + day + " ";
%>
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
							<p>대차대조 통계</p>
						</div>
					</div>
				</div>
			</div>
			<table class="table table-hover">
				<tr>
					<td>온라인/직거래 비율</td>
					<td>최근 6개월 월별 매출현황</td>
				</tr>
				<tr>
					<td>
						<div style="margin-top: 50%;">
							<canvas id="canvas" width=200 height="200" />
						</div>
						<div><br>
							<span>&lt;온라인 직거래 비율></span>
						</div>
					</td>
					<td rowspan="2">
						<div>
							<canvas id="canvas2" height="450" width="600" />
						</div>
					</td>
				</tr>
				
			</table>
			<script>
				var dir = ${dir};
				var indir = ${indir};
				var total = parseInt(dir) + parseInt(indir);
				var perdir = Math.round(parseInt(dir) / parseInt(total) * 100);
				var perindir = Math.round(parseInt(indir) / parseInt(total)
						* 100);
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
					var ctx = document.getElementById("canvas")
							.getContext("2d");
					window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
						responsive : true
					});
					var ctx = document.getElementById("canvas2").getContext(
							"2d");
					window.myLine = new Chart(ctx).Line(lineChartData, {
						responsive : true
					});

				};
			</script>
			<script>
				var randomScalingFactor = function() {
					return Math.round(Math.random() * 100)
				};
				var lineChartData = {
					labels : [ "<%=year%>${m0}월","<%=year%>${m1}월","<%=year%>${m2}월",
					           "<%=year%>${m3}월","<%=year%>${m4}월","<%=year%>${m5}월"],
					datasets : [
							{
								label : "My First dataset",
								fillColor : "rgba(100,170,170,0.2)",
								strokeColor : "rgba(100,0,0,2)",
								pointColor : "rgba(150,0,0,2)",
								pointStrokeColor : "#000",
								pointHighlightFill : "#000",
								pointHighlightStroke : "rgba(220,220,220,1)",
								data : [ "${c0}",
								         "${c1}",
								         "${c2}",
								         "${c3}",
								         "${c4}",
								         "${c5}"]
							},
							{
								label : "My First dataset",
								fillColor : "rgba(222,220,220,0.2)",
								strokeColor : "rgba(180,50,0,2)",
								pointColor : "rgba(140,50,0,2)",
								pointStrokeColor : "#000",
								pointHighlightFill : "#000",
								pointHighlightStroke : "rgba(220,220,220,1)",
								data : [ 
								         "${c1}",
								         "${c2}",
								         "${c3}",
								         "${c4}",
								         "${c5}",
								         "0"]
							}
							]

				}
			</script>
			
</body>
</html>
