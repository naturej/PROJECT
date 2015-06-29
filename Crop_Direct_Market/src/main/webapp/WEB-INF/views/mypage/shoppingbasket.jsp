<!-- 장바구니 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	function deleteAll(){
		$.ajax({
			url:'deleteall.five'
		});
		location.reload();
	}
	
	function deleteshop(bo_num){
		$.ajax({
			url:'deleteshop.five?bo_num='+bo_num
		});
		location.reload();
	}
</script>
</head>
<body>
<div id="content">
	<section id="service" class="home-section text-center">
			<div class="heading-about">
				<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
						<h2>BASKET</h2>
						<i class="fa fa-2x fa-angle-down"></i>
						<p>장바구니</p>
						</div>
						</div>
					</div>
				</div>
	<table class="table table-hover" id="basket">
	<tr>
		<td>선택</td>
		<td>구매자</td>
		<td>품명</td>
		<td>판매가</td>
		<td>수량</td>
		<td>총가격</td>
		<td>판매자</td>
		<td>삭제</td>
	<tr>
	<c:set var="sum" value="0"/>
	<c:forEach items="${list}" var="e">
	<c:set var="sum" value="${sum + e.sh_price}"></c:set>
	<tr>
		<td><input type="checkbox" checked="checked"></td>
		<td>${e.user_id}</td>
		<td>${e.bo_subject}</td>
		<td>${e.bo_price}</td>
		<td>${e.sh_quantity}</td>
		<td>${e.sh_price}</td>
		<td>${e.sell_id}</td>
		<td><a href="" onclick="deleteshop('${e.bo_num}')">x</a></td>
	<tr>
	</c:forEach>
	<tr>
		<td colspan="8" align="right">
			총가격 : ${sum} 
		</td>
	</tr>
	<tr>
		<td colspan="8" align="center">
			<input type="button" value="선택상품 삭제">
			<input type="button" value="선택상품 주문"><!-- 주문으로 넘어가게 -->
			<input type="button" value="이전으로" onclick="javascript:history.back()">
			<input type="button" value="비우기" onclick="deleteAll()">
		</td>
	</tr>
</table>
	</div>
	</div>
	</section>
</div>
</body>
</html>