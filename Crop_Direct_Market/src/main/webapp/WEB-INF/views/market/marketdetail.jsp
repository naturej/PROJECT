<%@page import="kr.co.ohdeokrionline.model.vo.Market_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<c:set var="person" value="${requestScope.person}" />
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
	function marketparti(mar_id,mar_parti,mar_date,mar_subject)
	{
	   	$.ajax({
				url:"marketpart.five",
				data:{"mar_id" : mar_id,
					  "mar_parti" : mar_parti,
					  "mar_date" : mar_date,
					  "mar_subject" : mar_subject
				},
				dataType:"html",
				success : function(data){
					if(data!=null){
						alert("참가 등록이 되었습니다.");
						parti.value = "등록완료";
						parti.onclick = "";
						$("#person").html(window.parseInt($("#person").text())+1);
					}
		        }});
	};
	
	function partici(mar_id)
	{
	   	$.ajax({
				url:"marketpart2.five",
				data:{"mar_id" : mar_id,
				},
				dataType:"html",
				success : function(data){
					if(data!=null){
						part.type = "text";
					}
		        }});
	};
	function partici2(mar_id)
	{
	   	$.ajax({
				url:"marketpart2.five",
				data:{"mar_id" : mar_id,
				},
				dataType:"html",
				success : function(data){
					if(data!=null){
						part.type = "hidden";
					}
		        }});
	};
	
	
</script>

<section id="service" class="home-section text-center"  style="position: static">	
	<div class="heading-about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
							<h2>Offline Market</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>직거래 장터 정보</p>
						</div>
					</div>
				</div>
			</div>
			<form method="post">
            	<table class="table">
            		<tr><td colspan="3"><div align="center" style="height: 30px; font-size: 20px;">>&nbsp;${marketDto.mar_subject}</div></td></tr>      
            		<tr><td colspan="3"><div id="img"><img class="" src="<%=request.getContextPath()%>/market/upload/${marketDto.mar_photo}" alt="" width=400px height=400px></div></td></tr>
	            	<tr><td width="35%"></td><td align="left" colspan="2">위치 : ${marketDto.mar_location}</td></tr>
		            <tr><td width="35%"></td><td align="left" colspan="2">날짜 : ${marketDto.mar_date.toLocaleString().substring(0,11)}</td></tr>
		            <tr><td width="35%"></td><td align="left" colspan="2">시간 : ${marketDto.mar_time}</td></tr>
		            <tr><td width="35%"></td><td align="left" colspan="2">입점수 : <a onmouseover="part.value='${marketDto.mar_parti}'" onmouseout="part.value=''"><span id="person">${requestScope.person}</span>/${marketDto.mar_maxshop}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            	<se:authentication property="name" var="LoginUser" />
						   	
								|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${requestScope.person >= marketDto.mar_maxshop}">
										참가등록 완료!!
									</c:when>
									<c:otherwise>
										<se:authorize ifAnyGranted="ROLE_SELLER">
											<input type="button" value="참가등록" id="parti" name="parti" onclick="marketparti('${marketDto.mar_id}','${LoginUser}','${marketDto.mar_date.toLocaleString().substring(0,11)}','${marketDto.mar_subject}')" >	
										</se:authorize>
									</c:otherwise>
								</c:choose><br>
						<input type="text" style="border:none" size="100" id="part" name="part">
					</td></tr>
           			<tr><td colspan="2" align="center"><b><<상세정보>></b></td></tr>
            		<tr><td colspan="2">${marketDto.mar_content}</td></tr>
            <tr><td colspan="3">
	            <a href="marketlist.five">목록</a>&nbsp;&nbsp;
	            <se:authorize ifAllGranted="ROLE_ADMIN">
					<a href="marketedit.five?mar_id=${marketDto.mar_id}">수정</a>&nbsp;&nbsp;
	            	<a href="marketdelete.five?mar_id=${marketDto.mar_id}">삭제</a>		
				</se:authorize>
            </td></tr>
         </table>
      
         	<input type="hidden" name="bo_num" value="${salboardDto.bo_num}">
         <br>
         <hr>
         
	</form>
	
	
	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	</div>
	</section>

