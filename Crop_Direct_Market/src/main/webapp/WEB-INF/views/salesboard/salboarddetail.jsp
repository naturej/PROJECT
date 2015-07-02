<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 -->
<style type="text/css">
	#img {
		width: 400px;
		height: 400px;
		border-radius: 400px;
		margin: 0 auto;
		overflow: hidden;
	}
	
	div #dialog-confirm {
		position: static;
	}
	
	.buyUser {
		padding: 2px;
		background-color: #1ABC9C;
		color: white;
		font-size: 12px;
		border-radius: 4px;
	}
</style>

<title>상세보기</title>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/star-rating/jquery.rating.css">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.form.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.MetaData.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.rating.pack.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>
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
					//user_id: Principal.getName(),
					bo_num:"${salboardDto.bo_num}",
					sh_quantity:$("#sh_quantity").val(),
					bo_price:"${salboardDto.bo_price}"
				},
				dataType:'html',
				success: $( "#dialog-confirm" ).dialog( "open" )
			});
		}
	}

	function popup(id){
		window.open('popup.five?rec_userid='+id,'쪽지 보내기', 'width=430, height=485, scrollbars=no')
	}
	
	function review_popup(bo_num,product){
		window.open('review_sinchung.five?bo_num='+bo_num+'&product='+product,'평가하기', 'width=430, height=440, scrollbars=no')
	}
	
	function report_popup(bo_num,product,bo_subject,user_rec){
		window.open('reportPopup.five?bo_num='+bo_num+'&product='+product+'&bo_subject='+bo_subject+'&user_rec='+user_rec,'신고하기','width=430, height=440, scrollbars=no')
	}
	
	function Enuri(number,id,product){
		window.open('enuri_sinchung.five?bo_num='+number+'&user_id='+id+'&pro_name='+product,'에누리 신청',
	      'top=100px, left=100px, width=430 height=510')
	}
	
	function sold(bo_num){
		$.ajax({
			type: "POST",
			url: "sold.five",
			data: {
				bo_num : bo_num,
				sold : '1'	
			},
			success: function(data){
				location.href="salboardlist.five";
			}
		});
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

	 <section id="service" class="home-section text-center"  style="position: static">
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
	<form method="post">
            <table class="table">
            <tr><td><div align="left" style="height: 50px; font-size: 20px;">>&nbsp;${salboardDto.bo_subject}</div></td><td colspan="3">${salboardDto.bo_date}</td></tr>      
            
            <tr><td rowspan="8"><div id="img"><img class="" src="<%=request.getContextPath()%>/salesboard/upload/${salboardDto.bo_photo}" alt="" width="400px" height="400px"></div></td>
            <td>가격</td><td colspan="2">${salboardDto.bo_price}</td></tr>
            <tr><td>농장명</td><td colspan="2">${salboardDto.farminfo}</td></tr>
            <tr><td>글쓴이</td><td colspan="2"><a href="#" onclick="popup('${salboardDto.user_id}')">${salboardDto.user_id}</a></td></tr>
            <tr><td>원산지</td><td colspan="2">${salboardDto.farm_add}</td></tr>
            <tr><td>단위</td><td colspan="2">${salboardDto.bo_salnum}${salboardDto.unit}</td></tr>
            <tr><td>품종</td><td colspan="2">${salboardDto.pro_name}</td></tr>
            <tr><td>구매수량</td><td colspan="2"><input type="number" min="1" id="sh_quantity" name="sh_quantity" onkeydown='return onlyNumber(event)'> 개
	            	<se:authentication property="name" var="LoginUser" />
	            	<c:if test="${LoginUser eq salboardDto.user_id}">
	            		<input type="button" class="btn-xs btn-danger" value="매 진" onclick="sold('${salboardDto.bo_num}')"/>
	            	</c:if>
            	</td>
            </tr>
            <tr><td colspan="3">
            <input type="button" id="opener" value="장바구니 담기" onclick="CheckForm()">
            <input type="button" id="enuri" value="에누리 신청" onclick="Enuri('${salboardDto.bo_num}','${salboardDto.user_id}','${salboardDto.pro_name}')"></td></tr>
            <tr><td colspan="4" align="left">상세정보</td></tr>
            <tr><td colspan="4">${salboardDto.bo_content}</td></tr>
            <tr><td colspan="4" align="left">리뷰</td></tr>
   			<c:set var="r2" value="${list}" />
            <c:choose>
            	<c:when test="${empty r2}">
            		<tr>
            		<td colspan="4">
            			작성된 후기가 없습니다. 리뷰를 처음으로 작성해보세요
            		</td>
            		</tr>
            	</c:when>
            	<c:otherwise>
							<c:forEach items="${list}" var="r">
								<tr>
									<td>
									<c:forEach items="${buyList}" var="b">
										<c:choose>
											<c:when test="${r.review_id eq b}">
												<span class="buyUser">실구매자평</span>
											</c:when>
										</c:choose>
									</c:forEach>
										${r.re_content}
									</td>
									<c:set var="rs" value="${r.re_score}" />
									<%-- <td>${r.re_score}</td> --%>
									<c:choose>
										<c:when test="${rs==0.5}">
											<td><div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div></td>
										</c:when>
										<c:when test="${rs==1.0}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
										</td>
										</c:when>
										<c:when test="${rs==1.5}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
										</td>
										</c:when>
										<c:when test="${rs==2.0}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
										</td>
										</c:when>
										<c:when test="${rs==2.5}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
											<div role="text" aria-label="2.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.5" style="margin-left: 0px;">2.5</a></div>
										</td>
										</c:when>
										<c:when test="${rs==3.0}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
											<div role="text" aria-label="2.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.5" style="margin-left: 0px;">2.5</a></div>
											<div role="text" aria-label="3.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.0" style="margin-left: -8px;">3.0</a></div>
										</td>
										</c:when>
										<c:when test="${rs==3.5}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
											<div role="text" aria-label="2.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.5" style="margin-left: 0px;">2.5</a></div>
											<div role="text" aria-label="3.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.0" style="margin-left: -8px;">3.0</a></div>
											<div role="text" aria-label="3.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.5" style="margin-left: 0px;">3.5</a></div>
										</td>
										</c:when>
										<c:when test="${rs==4.0}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
											<div role="text" aria-label="2.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.5" style="margin-left: 0px;">2.5</a></div>
											<div role="text" aria-label="3.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.0" style="margin-left: -8px;">3.0</a></div>
											<div role="text" aria-label="3.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.5" style="margin-left: 0px;">3.5</a></div>
											<div role="text" aria-label="4.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="4.0" style="margin-left: -8px;">4.0</a></div>
										</td>
										</c:when>
										<c:when test="${rs==4.5}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
											<div role="text" aria-label="2.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.5" style="margin-left: 0px;">2.5</a></div>
											<div role="text" aria-label="3.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.0" style="margin-left: -8px;">3.0</a></div>
											<div role="text" aria-label="3.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.5" style="margin-left: 0px;">3.5</a></div>
											<div role="text" aria-label="4.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="4.0" style="margin-left: -8px;">4.0</a></div>
											<div role="text" aria-label="4.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="4.5" style="margin-left: 0px;">4.5</a></div>
										</td>
										</c:when>
										<c:when test="${rs==5.0}">
										<td>
											<div role="text" aria-label="0.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="0.5" style="margin-left: 0px;">0.5</a></div>
											<div role="text" aria-label="1.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.0" style="margin-left: -8px;">1.0</a></div>
											<div role="text" aria-label="1.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="1.5" style="margin-left: 0px;">1.5</a></div>
											<div role="text" aria-label="2.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.0" style="margin-left: -8px;">2.0</a></div>
											<div role="text" aria-label="2.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="2.5" style="margin-left: 0px;">2.5</a></div>
											<div role="text" aria-label="3.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.0" style="margin-left: -8px;">3.0</a></div>
											<div role="text" aria-label="3.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="3.5" style="margin-left: 0px;">3.5</a></div>
											<div role="text" aria-label="4.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="4.0" style="margin-left: -8px;">4.0</a></div>
											<div role="text" aria-label="4.5" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="4.5" style="margin-left: 0px;">4.5</a></div>
											<div role="text" aria-label="5.0" class="star-rating rater-2 star {split:2} star-rating-applied star-rating-live star-rating-on" style="width: 8px;"><a title="5.0" style="margin-left: -8px;">5.0</a></div>
										</td>
										</c:when>
										<c:otherwise>
											<td>${r.re_score}</td>
										</c:otherwise>
									</c:choose>
									<td>${r.review_id}</td>
									<td>${r.re_date}</td>
								</tr>
							</c:forEach>
				</c:otherwise>
			</c:choose>
            <tr><td colspan="4"><a href="" onclick="review_popup('${salboardDto.bo_num}','${salboardDto.pro_name}')">리뷰쓰기</a></td></tr>
            <tr><td colspan="4">
	            <a href="salboardlist.five">목록</a>&nbsp;&nbsp;
	            <se:authorize ifAllGranted="ROLE_SELLER">
					<a href="salboardedit.five?bo_num=${salboardDto.bo_num}">수정</a>&nbsp;&nbsp;
	            	<a href="salboarddelete.five?bo_num=${salboardDto.bo_num}">삭제</a>			
				</se:authorize>
	            <se:authorize ifAllGranted="ROLE_CONSUMER">
					<a href="" onclick="report_popup('${salboardDto.bo_num}','${salboardDto.pro_name}','${salboardDto.bo_subject}','${salboardDto.user_id}')">신고하기</a>			
				</se:authorize>
            </td></tr>
         </table>
  
      
         	<input type="hidden" name="bo_num" value="${salboardDto.bo_num}">
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
	
	
	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	</div>
	<div id="dialog-confirm" title="장바구니 담기">
	  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
	  장바구니에 상품을 담았습니다. 상품을 확인하시겠습니까?</p>
	</div>
	</section>

 
