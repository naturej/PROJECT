<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<html class="no-js">
<link href="css/table-base/bootstrap.min.css" rel="stylesheet">  
<script type="text/javascript">
	function onlyNumber(event){
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        return false;
	}
	
	function CheckForm(){
		if( $( "#sh_quantity" ).val()==""){
			alert('수량을 입력해주세요');
			return false;
		}
		else{
			$.ajax({
				type:'post',
				url:'shopInsert.five',
				data:{
					user_id:"gathering11",	//나중에 바꿈..
					bo_num:"${salboardDto.bo_num}",
					sh_quantity:$("#sh_quantity").val(),
					bo_price:"${salboardDto.bo_price}"
				},
				dataType:'html'
			});
			$( "#dialog-confirm" ).dialog( "open" );
		}
	}
	function Enuri(number,id,product){
		window.open('enuri_sinchung.five?bo_num='+number+'&user_id='+id+'&pro_name='+product,'에누리 신청',
	      'top=100px, left=100px, width=430 height=510 ')
	}
	
	$(function() {
		  $( "#dialog-confirm" ).dialog({
			autoOpen: false,
		    resizable: false,
		    height:300,
		    width:500,
		    modal: true,
		    buttons: {
		      "장바구니 보기": function() {
				//$('#shopbag').submit();
		        $( this ).dialog( "close" );
		        location.href = "shopList.five";
		      },
		      "계속 쇼핑하기": function() {
		    	//$('#shopbag').submit();
		        $( this ).dialog( "close" );
		        location.reload();
		      }
		    }
		  });
		  

		});
	
</script>



<div id="content">
	 <section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>Sales Board</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>농산물 판매 정보</p>
					</div>
					</div>
				</div>
			</div>
	<form>
            <table class="table">
            <tr><td>제목</td><td>${salboardDto.bo_subject}</td></tr>
            <tr><td>글쓴이</td><td>${salboardDto.user_id}</td></tr>
            <tr><td>작성일</td><td>${salboardDto.bo_date}</td></tr>
            <tr><td colspan="2"><img class="" src="<%=request.getContextPath()%>/salesboard/upload/${salboardDto.bo_photo}" alt="" width="400px" height="400px"></td></tr>
            <tr><td>내용</td><td>${salboardDto.bo_content}</td></tr>
            <tr><td>가격</td><td><input type="text" name="bo_price" value="${salboardDto.bo_price}"></td></tr>
            <tr><td>단위</td><td>${salboardDto.bo_salnum}${salboardDto.unit}</td></tr>
            <tr><td>품종</td><td>${salboardDto.pro_name}</td></tr>
            <tr><td>단위</td><td><input type="number" min="1" id="sh_quantity" name="sh_quantity" onkeydown='return onlyNumber(event)'> 개</td></tr>
         </table>
         
         
         
         	<input type="hidden" name="bo_num" value="${salboardDto.bo_num}">
         
            <a href="salboardlist.five">목록</a>
            <a href="salboardedit.five?bo_num=${salboardDto.bo_num}">수정</a>
            <a href="salboarddelete.five?bo_num=${salboardDto.bo_num}">삭제</a>
            <input type="button" id="opener" value="장바구니 담기" onclick="CheckForm()">
            <input type="button" id="enuri" value="에누리 신청" onclick="Enuri('${salboardDto.bo_num}','${salboardDto.user_id}','${salboardDto.pro_name}')">
<%--        
            <a href="review.five?idx=${salboardDto.idx}">리뷰쓰기</a>
--%>
         <br>
         <hr>
         
<%--             
            <table>
            <c:forEach items="${list}" var="n">
            <tr>
               <td class="re_idx">${n.re_idx}</td>
               <td class="re_content">${n.re_content}</td>
               <td class="re_writedate">${n.re_writedate}</td>
               <td class="USER_ID">${n.USER_ID}</td>
            </tr>
            </c:forEach>
            </table>
--%>
	</form>
	
	<div id="dialog-confirm" title="장바구니 담기">
	  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
	  장바구니에 상품을 담았습니다. 상품을 확인하시겠습니까?</p>
	</div>
	</div>
	</div>
	</section>
</div>