<%@page import="java.util.Calendar"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/ohdeokrionline/css/style.css" rel="stylesheet" type="text/css">

<title>Doughnut Chart</title>

<script src="<%=request.getContextPath()%>/js/Chart.js"></script>
<%
	Calendar cal = Calendar.getInstance();
	String year = cal.get(Calendar.YEAR) + "년";
	String month = cal.get(Calendar.MONTH) + 1 + "월";
	String day = cal.get(Calendar.DAY_OF_MONTH) + "일";
	String result = year + " " + month + " " + day + " ";
%>
	<section id="service" class="home-section text-center">
	<div class="heading-about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
							<h2>매출 관리 표</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>순이익 & 매출량 관리</p>
						</div>
					</div>
				</div>
			</div>
			
			<table class="table table-hover">
				<tr>
					<td><%=month%> 온라인 & 직거래장터 비율</td>
					<td><%=year%> 총 매출 & 순이익 변동 그래프</td>
				</tr>
				<tr>
					<td>
						<div style="margin-top: 50%;">
							<canvas id="canvas" width=200 height="200">
							</canvas>
						</div>
						<div style="font-size:15px">
							<br> <span>&lt;온라인 직거래 비율></span></div>
							<div style="font-size:13px"align="right">(단위:%)</div>
							<div style="font-size:15px" align="center">
							직거래 매출 <img src="<%=request.getContextPath()%>/img/순이익.JPG" height="8px" width="15px">&nbsp;&nbsp;&nbsp;
							 온라인 매출<img src="<%=request.getContextPath()%>/img/총매출액.JPG" height="8px" width="15px"></div>	
					</td>
					<td rowspan="2">
						<div>
							<canvas id="canvas2" height="450" width="600">
							</canvas>
						</div>
						<div style="font-size:15px" align="center">
							순이익 <img src="<%=request.getContextPath()%>/img/순이익.JPG" height="8px" width="15px">&nbsp;&nbsp;&nbsp;
							총매출액 <img src="<%=request.getContextPath()%>/img/총매출액.JPG" height="8px" width="15px"></div>
							<div style="font-size:13px"align="right">(단위:원)</div>
					</td>
				</tr>
			</table>
			<script>
				var dd = ${sal_on};
				var dr = ${sal_mar};
				var dir = dd[0];
				var indir = dr[0];
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
				var lineChartData = {
					labels : ${datelist}
					           ,
					datasets : [
							{
								label : "순이익",
								fillColor : "rgba(100,170,170,0.2)",
								strokeColor : "#F7464A",
								pointColor : "#F7464A",
								pointStrokeColor : "#000",
								pointHighlightFill : "#000",
								pointHighlightStroke : "rgba(220,220,220,1)",
								data : ${incomelist}
							},
							{
								label : "총 매출액",
								fillColor : "rgba(222,220,220,0.2)",
								strokeColor : "#46BFBD",
								pointColor : "#46BFBD",
								pointStrokeColor : "#000",
								pointHighlightFill : "#000",
								pointHighlightStroke : "rgba(220,220,220,1)",
								data : ${totallist}
							} ]
				} ;
			</script>
			
<script>
  $(function(){
	 $( "#effect" ).toggle( 'blind', {}, 500 ); 
  });

  $(function() {
    function runEffect() {
      var selectedEffect = 'blind';
      var options = {};
      $( "#effect" ).toggle( selectedEffect, options, 500 );
    };
    $( "#detail" ).click(function() {
      runEffect();
    });
  });
  </script>		
 
  <input type="button" class="btn btn-sm btn-skin" id="detail" value="상세보기">	
  
  <div class="toggler">
    <div id="effect" class="ui-widget-content ui-corner-all">
    <br><br><br>
     <h3 class="ui-widget-header ui-corner-all">손익계산서 상세내역</h3>
     
     <table class="table">
     <tr>
     <td></td>
     <td colspan="2">매출</td>
     <td>매출원가</td>
     <td colspan="3">판매비 및 일반관리비</td>
     <td>영업 외 수익</td>
     <td colspan="2">영업 외 비용</td>
     <td></td>
     </tr>
     <tr>
     <td>일자</td>
     <td>온라인거래</td>
     <td>직거래장터</td>
     <td>상품원가</td>
     <td>소모품비</td>
     <td>대여비</td>
     <td>잡비</td>
     <td>잡이익</td>
     <td>이자비용</td>
     <td>잡손실</td>
     <td style="background-color:#fae6db;">당기순이익</td>
     </tr>
   
     <c:forEach items="${baldetail}" var="detail">
     <fmt:formatNumber value="${detail.sal_on}" pattern="###,###,###" var="sal_on"/>
     <fmt:formatNumber value="${detail.sal_mar}" pattern="###,###,###" var="sal_mar"/>
     <fmt:formatNumber value="${detail.sal_cost}" pattern="###,###,###" var="sal_cost"/>
     <fmt:formatNumber value="${detail.ex_supplies}" pattern="###,###,###" var="ex_supplies"/>
     <fmt:formatNumber value="${detail.ex_renter}" pattern="###,###,###" var="ex_renter"/>
     <fmt:formatNumber value="${detail.ex_etc}" pattern="###,###,###" var="ex_etc"/>
     <fmt:formatNumber value="${detail.sal_gain}" pattern="###,###,###" var="sal_gain"/>
     <fmt:formatNumber value="${detail.ex_inter}" pattern="###,###,###" var="ex_inter"/>
     <fmt:formatNumber value="${detail.ex_loss}" pattern="###,###,###" var="ex_loss"/>
     <fmt:formatNumber value="${detail.sal_income}" pattern="###,###,###" var="sal_income"/>
      <tr>
      <td>${detail.bal_date}</td>
      <td>${sal_on}원</td>
      <td>${sal_mar}원</td>
      <td>${sal_cost}원</td>
      <td>${ex_supplies}원</td>
      <td>${ex_renter}원</td>
      <td>${ex_etc}원</td>
      <td>${sal_gain}원</td>
      <td>${ex_inter}원</td>
      <td>${ex_loss}원</td>
      <td style="background-color:#fae6db;">${sal_income}원</td>
      </c:forEach>
      </table>
     
 	  </div>
 	</div>
			
		</div>
	</div>
	</section>

</html>
