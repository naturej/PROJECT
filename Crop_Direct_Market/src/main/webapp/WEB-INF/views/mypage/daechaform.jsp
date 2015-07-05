<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="/ohdeokrionline/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<% 
Calendar cal= Calendar.getInstance();
String year=cal.get(Calendar.YEAR)+"년";
String month=(cal.get(Calendar.MONTH)+1)+"월";
String result= year+" "+month;
String user_id = SecurityContextHolder.getContext().getAuthentication().getName();
%>
<script type="text/javascript">
	
	$(function(){

			$("#sal_on").val(0);
			$("#sal_mar").val(0);
			$("#sal_cost").val(0);
			$("#ex_supplies").val(0);
			$("#ex_renter").val(0);
			$("#ex_etc").val(0);
			$("#sal_gain").val(0);
			$("#ex_inter").val(0);
			$("#ex_loss").val(0);
			$("#sal_income").val(0);

			var num1=parseInt($("#sal_on").val())+parseInt($("#sal_mar").val());
			$("#num1").val(num1);
			var num3=parseInt($("#num1").val())-parseInt($("#sal_cost").val());
			$("#num3").val(num3);
			var num4=parseInt($("#ex_supplies").val())+parseInt($("#ex_renter").val())+parseInt($("#ex_etc").val());
			$("#num4").val(num4);
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
			
		//기본 계산문(자동계산문)
		//1. 매출계산
		$("#sal_mar").keyup(function (){
			var result = parseInt($("#sal_on").val())+parseInt($("#sal_mar").val());
			$("#num1").val(result);
			var num3 = parseInt($("#num1").val())-parseInt($("#sal_cost").val());
			$("#num3").val(num3);
			var num4=parseInt($("#ex_supplies").val())+parseInt($("#ex_renter").val())+parseInt($("#ex_etc").val());
			$("#num4").val(num4);
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
			
		});
		
		//3.매출 총이익 계산
		$("#sal_cost").keyup(function (){
			var num3 = parseInt($("#num1").val())-parseInt($("#sal_cost").val());
			$("#num3").val(num3);
			var num4=parseInt($("#ex_supplies").val())+parseInt($("#ex_renter").val())+parseInt($("#ex_etc").val());
			$("#num4").val(num4);
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
		});
		
		//4.판매비 및 일반관리비
		$("#ex_supplies").keyup(function (){
			var num4=parseInt($("#ex_supplies").val())+parseInt($("#ex_renter").val())+parseInt($("#ex_etc").val());
			$("#num4").val(num4);
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
		});
		$("#ex_renter").keyup(function (){
			var num4=parseInt($("#ex_supplies").val())+parseInt($("#ex_renter").val())+parseInt($("#ex_etc").val());
			$("#num4").val(num4);
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
		});
		$("#ex_etc").keyup(function (){
			var num4=parseInt($("#ex_supplies").val())+parseInt($("#ex_renter").val())+parseInt($("#ex_etc").val());
			$("#num4").val(num4);
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
		});
		
		// 잡이익 자동 계산
		$("#sal_gain").keyup(function (){
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
		});
		
		//7. 영업 외 비용
		$("#ex_inter").keyup(function (){
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
		});
		$("#ex_loss").keyup(function (){
			var num5= parseInt($("#num3").val())-num4;
			$("#num5").val(num5);
			var num = parseInt($("#num5").val())+parseInt($("#sal_gain").val())-parseInt($("#ex_inter").val())-parseInt($("#ex_loss").val());
			$("#sal_income").val(num);
			
		});
	
		console.log($("#sal_income").val());
	});
</script>
</head>
<body>
	<section id="service" class="home-section text-center">
	<div class="heading-about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
							<h2>손익 계산서</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>손익 계산서 입력</p>
						</div>
					</div>
				</div>
			</div>
			<form method="post">
			<input type="hidden" value="<%=user_id%>" id="user_id" name="user_id">
			<input type="hidden" value="<%=year+month%>" id="bal_date" name="bal_date">
 			<table class="table">
				<tr><td colspan="3" align="center"><h4><%=result%> 기록</h4></td></tr>
				<tr><td align="center">1.매출</td>
				<td><input type="text" name="num1" id="num1" readonly="readonly" class="form-controll" disabled style="text-align:right; padding-right:1px;">원</td></tr>
				<tr><td align="right">온라인 매출</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_on" name="sal_on" readonly="readonly" class="form-controll" disabled value="0">원</td></tr>
				<tr><td align="right">직거래장터 매출</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_mar" name="sal_mar" class="form-controll">원</td></tr>
				
				<tr><td align="center">2.매출원가</td><td></td></tr>
				<tr><td align="right">상품 원가</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_cost" name="sal_cost" class="form-controll" >원</td></tr>
				
				<tr><td align="center">3.매출 총이익</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="num3" name="num3" readonly="readonly" class="form-controll" disabled>원</td></tr>
				
				<tr><td align="center">4.판매비 및 일반관리비</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" name="num4" id="num4" readonly="readonly" class="form-controll" disabled>원</td></tr>
				<tr><td align="right">소모품비</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_supplies" name="ex_supplies">원</td></tr>
				<tr><td align="right">대여비</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_renter" name="ex_renter" >원</td></tr>
				<tr><td align="right">잡비</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_etc" name="ex_etc">원</td></tr>
				
				<tr><td align="center">5.영업 손익</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="num5" name="num5" readonly="readonly" class="form-controll" disabled >원</td></tr>
				
				<tr><td align="center">6.영업 외 수익</td><td></td></tr>
				<tr><td align="right">잡이익</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_gain" name="sal_gain">원</td></tr>
				
				<tr><td align="center">7.영업 외 비용</td><td></td></tr>
				<tr><td align="right">이자비용</td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_inter" name="ex_inter">원</td></tr>
				<tr><td align="right">잡손실</td>
				<td><input type="text" style="text-align:right;" id="ex_loss" name="ex_loss">원</td></tr>
				
				<tr><td align="center">당기순이익</td>
				<td><input style="text-align:right; padding-right:1px; background-color:#DDDDDD; " type="text" id="sal_income" name="sal_income" readonly="readonly" class="form-controll">원</td></tr>
			</table>
				<input type="submit"  name="btn" id="btn" class="btn btn-skin" value="입력">
			</form>
		</div>
	</div>
	</section>
</body>
</html>