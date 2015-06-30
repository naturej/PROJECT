<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<% Calendar cal= Calendar.getInstance();
String year=cal.get(Calendar.YEAR)+"년";
String month=cal.get(Calendar.MONTH)+1+"월";
String day =cal.get(Calendar.DAY_OF_MONTH)+"일";
String result= year+" "+month+" "+day+" ";

%>
<script type="text/javascript">
	
	$(function(){
		//1. 매출계산
		$("#direct").keyup(function (){
			var result = parseInt($("#indirect").val())+parseInt($("#direct").val());
			$("#sellproduct").val(result);
		});
		
		//2.매출원가 계산
		$("#lastmoney").keyup(function (){
			var result = parseInt($("#productoriginprice").val())+parseInt($("#stackmoney").val());
			result = parseInt(result)+parseInt($("#lastmoney").val());
			$("#originprice").val(result);
		});
		//3.없음
		//4.판매비 및 일반관리비
		$("#etcprice").keyup(function (){
			var result = parseInt($("#consumeprice").val())+parseInt($("#rental").val());
			result = parseInt(result)+parseInt($("#etcprice").val());
			$("#generalprice").val(result);
			
			result = -parseInt(result)+parseInt($("#selltotalincome").val());
			$("#businessresult").val(result);
		});
		
		//6.
		$("#etcprice2").keyup(function (){
			var result = parseInt($("#interestexpense").val())+parseInt($("#etcprice2").val());
			$("#businessoutprice").val(result);
		});
		
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
							<h2>대차대조 입력</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>판매 상황</p>
						</div>
					</div>
				</div>
			</div>
			<table class="table table-hover">
				<tr>
					<td><h3>제무재표 표시명</h3></td>
					<td><h3>제6기</h3></td>
				</tr>	
				<tr>
					<th>금일</th>
					<th><%=result %></th>
				</tr>
				<tr>
					<th>1.매출</th>
					<td><input type="text" id="income" readonly></td>
				</tr>		
				<tr>
					<td>총 상품매출</td>
					<td><input type="text" id="sellproduct" readonly></td>
				</tr>	
				<tr>
					<td>온라인 상품매출</td>
					<td><input type="text" id="indirect" readonly="readonly" value="${totalsell}"></td>
				</tr>
				<tr>
					<td>직거래 상품매출</td>
					<td><input type="text" id="direct"></td>
				</tr>	
				<tr>
					<th>2.매출원가</th>
					<td><input type="text" id="originprice" readonly></td>
				</tr>		
				<tr>
					<td>상품매출원가</td>
					<td><input type="text" id="productoriginprice"></td>
				</tr>		
				<tr>
					<td>기초재고액</td>
					<td><input type="text" id="stackmoney"></td>
				</tr>		
				<tr>
					<td>기말재고액</td>
					<td><input type="text" id="lastmoney"></td>
				</tr>
				<tr>
					<th>3.매출 총 이익</th>
					<td><input type="text" id="selltotalincome" ></td>
				</tr>		
				<tr>
					<th>4.판매비 및 일반관리비</th>
					<td><input type="text" id="generalprice" readonly></td>
				</tr>		
				<tr>
					<td>소모품비</td>
					<td><input type="text" id="consumeprice"></td>
				</tr>		
				<tr>
					<td>임대비</td>
					<td><input type="text" id="rental"></td>
				</tr>		
				<tr>
					<td>잡비</td>
					<td><input type="text" id="etcprice"></td>
				</tr>		
				<tr>
					<th>5.영업손익</th>
					<td><input type="text" id="businessresult" readonly></td>
				</tr>				
				<tr>
					<th>6.영업 외 비용</th>
					<td><input type="text" id="businessoutprice" readonly></td>
				</tr>		
				<tr>
					<td>이자비용</td>
					<td><input type="text" id="interestexpense"></td>
				</tr>		
				<tr>
					<td>잡손실</td>
					<td><input type="text" id="etcprice2"></td>
				</tr>		
				<tr>
					<td align="right" colspan="2"><input type="button" value="등록"></td>
				</tr>		
			</table>
		</div>
	</div>
	</section>
</body>
</html>