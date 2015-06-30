<!-- 장바구니 -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<div id="content">
	<section id="service" class="home-section text-center">
			<div class="heading-about">
				<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
						<h2>ORDER_MANAGEMENT</h2>
						<i class="fa fa-2x fa-angle-down"></i>
						<p>주문 관리</p>
						</div>
						</div>
					</div>
				</div>
				
			<table class="table table-hover" id="basket">
			<tr>
			<td>주문번호</td>
			<td>주문날짜</td>
			<td>제목</td>
			<td>품목</td>
			<td>구매갯수</td>
			<td>판매자</td>
			<td>총가격</td>
			<td>주문상태</td>
			</tr>
			<c:set var="sum" value="0"/>
			<c:forEach items="${orderlist}" var="ord">
			<c:set var="sum" value="${sum+ord.or_cost}"></c:set>
			<tr>
			<td>${ord.or_id}</td>
			<td>${ord.or_date}</td>
			<td>${ord.bo_subject}</td>
			<td>${ord.pro_name}</td>
			<td>${ord.or_quan}</td>
			<td>${ord.sell_userid}</td>
			<td>${ord.or_cost}</td>
			<td>${ord.or_state}</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="8">총 가격:${sum}</td>
			</tr>
			</table>	
			</div>
		</div>
	</section>
</div>
</body>
</html>