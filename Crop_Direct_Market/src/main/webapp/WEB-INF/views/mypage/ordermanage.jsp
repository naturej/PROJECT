<!-- 장바구니 -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문관리</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	function seller_info(sell_userid) {
		var seller = sell_userid;
		window.open('seller_account.five?seller=' + seller, '판매자정보',
				'top=100px, left=100px, height=220 width=400')
	}
	
	function money_check(orderid,bo_num){
		var ob=orderid+bo_num;
       	$.ajax({
 			url:"moneystate_check.five",
 			data:{"order_id" : orderid,
 				  "bo_num" : bo_num	
 			},
 			dataType:"html",
 			success : function(data){
 				if(data!=null){
 					document.getElementById(ob).innerHTML="입금확인 중";
 				}
 	        }});
	};
	
	function item_check(orderid,bo_num){
		var ob=orderid+bo_num;
       	$.ajax({
 			url:"orderupdate3.five",
 			data:{"order_id" : orderid,
 				  "bo_num" : bo_num	
 			},
 			dataType:"html",
 			success : function(data){
 				if(data!=null){
 					document.getElementById(ob).innerHTML="거래 종료";
 				}
 	        }});
	};
	
	function popup(sell_userid,pro_name){
		window.open('popupDirm.five?user_rec='+sell_userid+'&pro_id='+pro_name,'직거래 신청','width=430, height=550, scrollbars=no')
	}
</script>
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
						<td>배송방법</td>
						<td>주문상태</td>
					</tr>
					<c:set var="sum" value="0" />
					<c:forEach items="${orderlist}" var="ord">
						<c:set var="sum" value="${sum+ord.or_cost}"></c:set>
						<tr>
							<td>${ord.or_id}</td>
							<td>${ord.or_date}</td>
							<td><a href="<%=request.getContextPath()%>/salesboard/salesdetail.five?bo_num=${ord.bo_num}">${ord.bo_subject}</a></td>
							<td>${ord.pro_name}</td>
							<td>${ord.or_quan}</td>
							<td><a onclick="seller_info('${ord.sell_userid}')">${ord.sell_userid}</a></td>
							<td>${ord.or_cost}</td>
							<td>
							<c:choose>
								<c:when test="${ord.or_how eq '직거래'}">
									${ord.or_how} <a href="" onclick="popup('${ord.sell_userid}','${ord.pro_name}')">신청</a>
								</c:when>
								<c:otherwise>
									${ord.or_how}
								</c:otherwise>
							</c:choose>
							</td>
							<c:choose>
								<c:when test="${ord.or_how=='직거래'}">
								<td></td>
								</c:when>
								<c:when test="${ord.or_state=='입금대기'}">
									<td id="${ord.or_id}${ord.bo_num}">
									<input type="button" value="  입금  " 
									onclick="money_check('${ord.or_id}','${ord.bo_num}')"></td>
								</c:when> 
								<c:when test="${ord.or_state=='입금대기'}">
									<td id="${ord.or_id}${ord.bo_num}">
									<input type="button" value="  입금  " 
									onclick="money_check('${ord.or_id}','${ord.bo_num}')"></td>
								</c:when> 
								<c:when test="${ord.or_state=='배송완료'}">
									<td id="${ord.or_id}${ord.bo_num}">
									<input type="button" value="수취확인" 
									onclick="item_check('${ord.or_id}','${ord.bo_num}')"></td>
								</c:when>
								<c:otherwise>
									<td>${ord.or_state}</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
					<tr>
						<td>
							<input type=button value="창닫기" onclick="self.close()">
						</td>
					</tr>
				</table>

			</div>
		</div>
	</section>
</div>
</body>
</html>