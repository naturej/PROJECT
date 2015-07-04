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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("add_code").value = data.postcode1+'-'+data.postcode2;
	                //document.getElementById("postcode2").value = data.postcode2;
	                document.getElementById("addr").value = fullAddr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addd").focus();
	            }
	        }).open();
	    }
		function execDaumPostcode2() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById("add_code").value = data.postcode1+'-'+data.postcode2;
	                //document.getElementById("postcode2").value = data.postcode2;
	                document.getElementById("farm_add").value = fullAddr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("farm_add_de").focus();
	            }
	        }).open();
	    }
	
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
			"<div id='newaddfrm'><div class='input-group'><span class='input-group-addon'>우편번호</span><input type='text' class='form-control' name='add_code' id='add_code' value='"+$('#add_code').val()+"' readonly='readonly'/>"+
			"<span class='input-group-addon'>지역주소</span><input type='text' class='form-control' name='addr' id='addr' value='"+$('#addr').val()+"' readonly='readonly'/></div><div class='input-group'>"+
			"<span class='input-group-addon'>세부주소</span><input type='text' class='form-control' name='addd' id='addd' value='"+$('#addd').val()+"' readonly='readonly'/></div></div></table>";
			$('#addfrm').html(output); 

			$('#exadd').click(function(){
				  var exaddr = "<div class='input-group'><span class='input-group-addon'>우편번호</span><input type='text' class='form-control' name='add_code' id='add_code' value='"+$('#add_code').val()+"' readonly='readonly'/>"+
					"<span class='input-group-addon'>지역주소</span><input type='text' class='form-control' name='addr' id='addr' value='"+$('#addr').val()+"' readonly='readonly'/></div><div class='input-group'>"+
					"<span class='input-group-addon'>세부주소</span><input type='text' class='form-control' name='addd' id='addd' value='"+$('#addd').val()+"' readonly='readonly'/></div>";
					  
			   	$('#newaddfrm').html(exaddr); 
			   	});
			 $('#newadd').click(function(){
					var newaddr = "<div class='input-group'><span class='input-group-addon'>우편번호</span><input type='text' class='form-control' name='add_code' id='add_code' placeholder='AddressCode' required readonly='readonly'/>"+
					"<input type='button' class='btn btn-skin' onclick='execDaumPostcode()' value='우편번호 찾기'></div><div class='input-group'>"+
					"<span class='input-group-addon'>지역주소</span><input type='text' class='form-control' name='addr' id='addr' placeholder='Address' required readonly='readonly'/></div><div class='input-group'>"+
					"<span class='input-group-addon'>세부주소</span><input type='text' class='form-control' name='addd' id='addd' placeholder='Address' required/></div>";
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
			if($('#add_code').val()!=null&&$('#addd').val()!=null&&$('#addr').val()!=null){
						$.ajax({
			     			type:'POST',
			     			url:"orderinsert.five",
			     			data:{list:JSON.stringify(list),
			     				  add_code:$('#add_code').val(),
			     				  addd:$('#addd').val(),
			     				  addr:$('#addr').val()},
			     			dataType:"html",
			     			success : function(responseData){
			     				alert('주문이 완료되었습니다. 주문 관리창으로 이동합니다');
			     				location.href = $('#loc').val()+"/manage/ordermanage.five";	     				
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
					     				alert('주문이 완료되었습니다. 주문 관리창으로 이동합니다');
					     				location.href = $('#loc').val()+"/manage/ordermanage.five";
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