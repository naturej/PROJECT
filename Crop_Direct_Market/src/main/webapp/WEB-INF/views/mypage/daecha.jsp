<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link href="/ohdeokrionline/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<% 
Calendar cal= Calendar.getInstance();
String year=cal.get(Calendar.YEAR)+"년";
String month=(cal.get(Calendar.MONTH)+1)+"월";
String result= year+" "+month;
String user_id = SecurityContextHolder.getContext().getAuthentication().getName();
%>
<script type="text/javascript">
	
	$(function(){
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
			<c:forEach items="${ballist}" var="bal">
			<form method="post">
			<input type="hidden" value="<%=user_id%>" id="user_id" name="user_id">
			<input type="hidden" value="<%=year+month%>" id="bal_date" name="bal_date">
 			<table class="table">
				<tr><td colspan="3" align="center"><h4><%=result%> 기록</h4></td></tr>
				<tr><td align="center"><a href="#" data-toggle="sales" title="매출" data-content="온라인 매출(자동입력) 과 직거래 매출(수동입력) 합계입니다.">1.매출</a></td>
				<td><input type="text" name="num1" id="num1" readonly="readonly" class="form-controll" disabled style="text-align:right; padding-right:1px;">원</td></tr>
				<tr><td align="right"><a href="#" data-toggle="sales_on" title="온라인 매출" data-content="판매게시판을 통해 입금되는 내역을 자동으로 입력해줍니다">온라인 매출</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_on" name="sal_on" readonly="readonly" class="form-controll" disabled value="${bal.sal_on}">원</td></tr>
				<tr><td align="right"><a href="#" data-toggle="sales_off" title="직거래장터 매출" data-content="직거래 장터나 외부에서 얻은 수익을 수동으로 입력합니다.">직거래장터 매출</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_mar" name="sal_mar" class="form-controll" value="${bal.sal_mar}">원</td></tr>
				
				<tr><td align="center">2.매출원가</td><td></td></tr>
				<tr><td align="right"><a href="#" data-toggle="sal_cost" title="상품 원가" data-content="상품의 원가를 입력합니다. EX)씨앗">상품 원가</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_cost" name="sal_cost" class="form-controll" value="${bal.sal_cost}">원</td></tr>
				
				<tr><td align="center"><a href="#" data-toggle="num3" title="매출 총 이익" data-content="총 매출(1)에서 매출 원가(2)를 뺀 금액을 뜻합니다.">3.매출 총이익</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="num3" name="num3" readonly="readonly" class="form-controll" disabled>원</td></tr>
				
				<tr><td align="center"><a href="#" data-toggle="num4" title="판매비 및 일반관리" data-content="판매와 관리에 들어간 금액으로 소모품비, 대여비, 잡비의 합산된 금액입니다.">4.판매비 및 일반관리비</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" name="num4" id="num4" readonly="readonly" class="form-controll" disabled>원</td></tr>
				<tr><td align="right"><a href="#" data-toggle="ex_supplies" title="소모품비" data-content="상품을 생산하기 위해 소모된 비용을 입력합니다. EX)비료, 농약">소모품비</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_supplies" name="ex_supplies" value="${bal.ex_supplies}">원</td></tr>
				<tr><td align="right"><a href="#" data-toggle="ex_renter" title="대여비" data-content="상품을 생산하기 위해 장비나 장소를 대여한 비용을 입력합니다.">대여비</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_renter" name="ex_renter" value="${bal.ex_renter}">원</td></tr>
				<tr><td align="right"><a href="#" data-toggle="ex_etc" title="잡비" data-content="상품을 생산하기위해 쓰인 기타 비용을 입력합니다.">잡비</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_etc" name="ex_etc" value="${bal.ex_etc}">원</td></tr>
				
				<tr><td align="center"><a href="#" data-toggle="num5" title="영업 손익" data-content="매출 총 이익(3)에서 판매비 및 일반관리(4)를 뺀 금액을 뜻합니다.">5.영업 손익</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="num5" name="num5" readonly="readonly" class="form-controll" disabled >원</td></tr>
				
				<tr><td align="center">6.영업 외 수익</td><td></td></tr>
				<tr><td align="right"><a href="#" data-toggle="sal_gain" title="잡이익" data-content="기타 외에 다른 부수입을 입력합니다.">잡이익</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="sal_gain" name="sal_gain" value="${bal.sal_gain}">원</td></tr>
				
				<tr><td align="center"><a href="#" data-toggle="num7" title="영업 외 비용" data-content="판매와 관리를 제외하고 상품의 판매까지 들어간 기타 비용을 뜻합니다.">7.영업 외 비용</a></td><td></td></tr>
				<tr><td align="right"><a href="#" data-toggle="ex_inter" title="이자비용" data-content="대출이나 어음 이자 비용을 입력합니다.">이자비용</a></td>
				<td><input type="text" style="text-align:right; padding-right:1px;" id="ex_inter" name="ex_inter" value="${bal.ex_inter}">원</td></tr>
				<tr><td align="right"><a href="#" data-toggle="ex_loss" title="잡손실" data-content="다른 곳에서 손비된 기타손실 비용을 입력합니다.">잡손실</a></td>
				<td><input type="text" style="text-align:right;" id="ex_loss" name="ex_loss" value="${bal.ex_loss}">원</td></tr>
				
				<tr><td align="center"><a href="#" data-toggle="sal_income" title="당기순이익" data-content="회계기간동안 매출에서 판매비, 영업비, 잡비 등을 제외한 순 이익을 뜻합니다.">당기순이익</a></td>
				<td><input style="text-align:right; padding-right:1px; background-color:#DDDDDD; " type="text" id="sal_income" name="sal_income" readonly="readonly" class="form-controll">원</td></tr>
			</table>
				<input type="submit"  name="btn" id="btn" class="btn btn-skin" value="입력">
				
			</form>
			</c:forEach>
		</div>
	</div>
	</section>
</body>
<script>
$(document).ready(function(){
	$('[data-toggle="sales"]').popover();   
    $('[data-toggle="sales_on"]').popover();
    $('[data-toggle="sales_off"]').popover();   
    $('[data-toggle="sal_cost"]').popover();   
    $('[data-toggle="num3"]').popover();   
    $('[data-toggle="num4"]').popover();   
    $('[data-toggle="ex_supplies"]').popover();   
    $('[data-toggle="ex_renter"]').popover();   
    $('[data-toggle="ex_etc"]').popover();   
    $('[data-toggle="num5"]').popover(); 
    $('[data-toggle="num7"]').popover(); 
    $('[data-toggle="sal_gain"]').popover();   
    $('[data-toggle="ex_inter"]').popover();   
    $('[data-toggle="ex_loss"]').popover();   
    $('[data-toggle="sal_income"]').popover();   
    
});
</script>
</html>