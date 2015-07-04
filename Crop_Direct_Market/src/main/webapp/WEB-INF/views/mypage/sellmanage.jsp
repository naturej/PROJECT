
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	function check(order_num, bo_num) {
		var ob=order_num+bo_num;
		$.ajax({
			type : 'GET',
			url : "orderupdate.five",
			data : {
				"order_num" : order_num,
				"bo_num" : bo_num
			},
			dataType : 'html',
			success : function(data) {
				if (data !=null) {
					alert(data);
					console.log("Aaa");
					console.log(document.getElementById(ob+"a"));
					document.getElementById(ob).innerHTML = "";
					document.getElementById(ob+"a").innerHTML = "배송중";
				}
			}
		});

	};
	
	function baesong_check(order_num, bo_num) {
		var ob=order_num+bo_num;
		$.ajax({
			type : 'GET',
			url : "orderupdate2.five",
			data : {
				"order_num" : order_num,
				"bo_num" : bo_num
			},
			dataType : 'html',
			success : function(data) {
				if (data !=null) {
					alert(data);
					console.log("Aaa");
					console.log(document.getElementById(ob+"a"));
					document.getElementById(ob).innerHTML = "";
					document.getElementById(ob+"a").innerHTML = "배송완료";
				}
			}
		});

	};
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
							<h2>판매 관리</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>판매 상황</p>
						</div>
					</div>
				</div>
		
			
			<table class="table table-hover">
	<br>
	<%=request.getAttribute("user_id")%>님의 판매 상황입니다.
	<br>
	<table class="table table-hover">
		<tr>
			<td>주문번호</td>
			<td>판매제목</td>
			<td>판매물품</td>
			<td>주문수량</td>
			<td>결제금액</td>
			<td>주문자</td>
			<td>주문상태</td>
			<td>결제확인</td>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.or_id}</td>
				<td>${list.bo_subject}</td>
				<td>${list.pro_name}</td>
				<td>${list.or_quan}</td>
				<td>${list.or_cost}</td>
				<td>${list.buy_userid}</td>
				<c:choose>
					<c:when test="${list.or_addr=='직거래'}">
						<td>직거래</td>
					</c:when>
					<c:otherwise>
						<td id="${list.or_id}${list.bo_num}a">${list.or_state}</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
						<c:when test="${list.or_addr=='직거래'}">
							<td>직거래</td>
						</c:when>
						<c:when test="${list.or_state=='입금확인 중'}">
							<td id="${list.or_id}${list.bo_num}"><input type="button" value="입금확인"
								onclick="check('${list.or_id}','${list.bo_num}')"></td>
						</c:when>
						<c:when test="${list.or_state=='배송중'}">
							<td id="${list.or_id}${list.bo_num}"><input type="button" value="배송완료"
								onclick="baesong_check('${list.or_id}','${list.bo_num}')"></td>
						</c:when>
						<c:when test="${list.or_state=='배송완료'}">
							<td>${list.or_state}</td>
						</c:when>
						<c:when test="${list.or_state=='거래종료'}">
							<td>${list.or_state}</td>
						</c:when>
						<c:otherwise>
							<td>미 입금</td>
						</c:otherwise>
					</c:choose>
			</tr>
		</c:forEach>
	</table>
			</section>
			</table>
			</div>
			</div>
			</div>
			</section>
			
</body>
</html>