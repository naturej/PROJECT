<!-- 장바구니 -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
$(function(){
	$('#how').click(function(){
		var sh = document.getElementsByName("shoplist");
		var ho = document.getElementsByName("how");
		var checkhw="false";
	 	$.each(sh,function(index,ob){
            if(ob.checked){
            if(ho[index].value=='택배'){checkhw="true";}
            }});
        if(checkhw=='true'){
        	var output=	"<br><br><br><h3>배송지 정보</h3><table class='table'>"+
			"<tr><td><label>배송지 선택</label><input type='radio' name='radio' id='exadd' checked='checked' value='기본'>기본배송지"+
			"<input type='radio' name='radio' id='newadd' value='신규'>신규배송지</td></tr><tr><td>"+
			"<div id='newaddfrm'><label>우편번호</label><input type='text' id='code' value='"+$('#add_code').val()+"' readonly='readonly'>"+
			"<label>주소</label><input type='text' id='dd' value='"+$('#addd').val()+"' readonly='readonly'><label>상세주소</label>"+
			"<input type='text' id='dr' value='"+$('#addr').val()+"' readonly='readonly'></div></table>";
			$('#addfrm').html(output); 

			$('#exadd').click(function(){
				  var exaddr = "<label>우편번호</label><input type='text' id='code' value='"+$('#add_code').val()+"' readonly='readonly'>"+
					"<label>주소</label><input type='text' id='dd' value='"+$('#addd').val()+"' readonly='readonly'><label>상세주소</label>"+
					"<input type='text' id='dr' value='"+$('#addr').val()+"' readonly='readonly'>";
			   	$('#newaddfrm').html(exaddr); 
			   	});
			 $('#newadd').click(function(){
					var newaddr = "<label>우편번호</label><input type='text' id='code'><label>주소</label><input type='text' id='dd'><label>상세주소</label><input type='text' id='dr'>";
						$('#newaddfrm').html(newaddr);
			   	});	  }else{
			   		$('#addfrm').empty();
			   	}
	});
});
</script>
<script type="text/javascript">
$(function(){
	$('#order').click(function(){
		var obj = document.getElementsByName("shoplist");
		var obb = document.getElementsByName("how");
		var list = [];
		var check ="false";
		var add="false";
	 	$.each(obj,function(index,ob){
            if(ob.checked){
		 	list.push(ob.value);
            list.push(obb[index].value);
            if(obb[index].value=='선택'){check="true";}
            else if(obb[index].value=='택배'){add="true";}
            }});
         if(check=='true'){
        	alert("배송방법을 선택해주세요"); 
         }else if(add=='true'){
			if($('#code').val()!=null&&$('#addd').val()!=null&&$('#addr').val()!=null){
						$.ajax({
			     			type:'POST',
			     			url:"orderinsert.five",
			     			data:{list:JSON.stringify(list),
			     				  add_code:$('#code').val(),
			     				  addd:$('#dd').val(),
			     				  addr:$('#dr').val()},
			     			dataType:"html",
			     			success : function(responseData){
									alert("주문 성공");			     				
			     			},
			     	    error: function (xhr,Options,thrownError) {}
			            }); 
					}
				}
         				else{
					           	$.ajax({
					     			type:'POST',
					     			url:"orderinsert.five",
					     			data:{list:JSON.stringify(list)},
					     			dataType:"html",
					     			success : function(responseData){
					     				alert("주문 성공");
					     			},
					     	    error: function (xhr,Options,thrownError) {}
					            }); 
							}             
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
		<td>품명</td>
		<td>판매가</td>
		<td>수량</td>
		<td>총가격</td>
		<td>판매자</td>
		<td>배송방법</td>
		<td>삭제</td>
	</tr>
	<c:set var="sum" value="0"/>
	<c:forEach items="${list}" var="e">
	<c:set var="sum" value="${sum + e.sh_price}"></c:set>
	<tr>
		<td><input type="checkbox" name="shoplist" id="shoplist" checked="checked"
		 class="shap" value="${e.bo_num},${e.sh_price},${e.sh_quantity},${e.sell_id}"></td>
		<td>${e.bo_subject}</td>
		<td>${e.bo_price}</td>
		<td>${e.sh_quantity}</td>
		<td>${e.sh_price}</td>
		<td>${e.sell_id}</td>
		<td><select id="how" name="how">
					<option>선택</option>
					<option>택배</option>
					<option>직거래</option>
			</select>
		</td>
			<td><a href="" onclick="deleteshop('${e.bo_num}')">x</a></td>
		</tr>
		
		</c:forEach>
		<tr>
			<td colspan="8" align="right">
				총가격 : ${sum} 
			</td>
		</tr>
	</table>
	
		<div id="addfrm">
		</div>
	
		<div align="center">
			<input type="button" value="선택상품 삭제">
			<input type="button" value="선택상품 주문" name="order" id="order" ><!-- 주문으로 넘어가게 -->
			<input type="button" name="frbtn" id="frbtn" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" value="선택상품주문">
			<input type="button" value="이전으로"onclick="javascript:history.back()">
			<input type="button" value="비우기" onclick="deleteAll()">
		</div>
	</div>
	<c:forEach items="${meminfo}" var="m">
	<input type="hidden" id="addd" value="${m.addd}">
	<input type="hidden" id="addr" value="${m.addr}">
	<input type="hidden" id="add_code" value="${m.add_code}">
	</c:forEach>


	</div>
	</div>
	</section>
</div>
</body>
</html>