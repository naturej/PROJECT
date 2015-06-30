<!-- 장바구니 -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	$(function(){
		$('#ormbtn').click(function(){
			 location.href = $('#loc').val()+"/manage/ordermanage.five";
		})
		$('#shopbtn').click(function(){
			 location.reload();
		})
		
	})
	
</script>
</head>
<script type="text/javascript">
$(function(){
	$('#frbtn').click(function(){
		var obj = document.getElementsByName("shoplist");
		var list = [];
	 $.each(obj,function(index,ob){
            if(ob.checked){
               list.push(ob.value);
            } 
            console.log(ob);
            console.log(index);
            console.log(ob.value);
            console.log(ob.checked);
          })
          console.log(list);
		$.ajax({
				type:'POST',
				url:"orderinsert.five",
				data:{list:JSON.stringify(list)},
				dataType:"html",
				success : function(responseData){

				},
		    error: function (xhr,Options,thrownError) {} 
		  }); 
		 });
	});
</script>
<body>


					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">주문완료</h4>
					        </div>
					        <div class="modal-body">
					          <h3>주문 관리 페이지로 이동하시겠습니까?</h3>
					          
					        </div>
					        <div class="modal-footer">
					        <input type="hidden" id="loc" name="loc" value="<%=request.getContextPath()%>">
					          <button type="button" class="btn btn-default" data-dismiss="modal" id="ormbtn" name="ormbtn">주문관리이동</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal" id="shopbtn" name="shopbtn">장바구이동</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>


<div id="content">
	<section id="service" class="home-section text-center">
			<div class="heading-about">
				<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
						<h2>BOARD</h2>
						<i class="fa fa-2x fa-angle-down"></i>
						<p>장바구니</p>
						</div>
						</div>
					</div>
				</div>
	
	<div>
	
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
	</tr>
	<c:set var="sum" value="0"/>
	<c:forEach items="${list}" var="e">
	<c:set var="sum" value="${sum + e.sh_price}"></c:set>
	<tr>
		<td><input type="checkbox" name="shoplist" id="shoplist" checked="checked"
		 class="shap" value="${e.bo_num},${e.sh_price},${e.sh_quantity},${e.sell_id}"></td>
		<td>${e.user_id}</td>
		<td>${e.bo_subject}</td>
		<td>${e.bo_price}</td>
		<td>${e.sh_quantity}</td>
		<td>${e.sh_price}</td>
		<td>${e.sell_id}</td>
		<td><a href="" onclick="deleteshop('${e.bo_num}')">x</a></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="8" align="right">
			총가격 : ${sum} 
		</td>
	</tr>
</table>
		<div align="center">
			<input type="button" value="선택상품 삭제">
			<input type="button" value="선택상품 주문" name="order" id="order" ><!-- 주문으로 넘어가게 -->
			<input type="button" name="frbtn" id="frbtn" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" value="선택상품주문">
			<input type="button" value="이전으로"onclick="javascript:history.back()">
			<input type="button" value="비우기" onclick="deleteAll()">
		</div>
</div>


	</div>
	</div>
	</section>
</div>
</body>
</html>