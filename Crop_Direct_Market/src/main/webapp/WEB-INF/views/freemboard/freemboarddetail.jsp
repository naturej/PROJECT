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
	
</script>

<section id="service" class="home-section text-center"  style="position: static">	
	<div class="heading-about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
							<h2>Free Share</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>무료 나눔 정보</p>
						</div>
					</div>
				</div>
			</div>
			<form method="post">
            	<table class="table">
            		<tr><td colspan="3"><div align="center" style="height: 30px; font-size: 20px;">>&nbsp;${freemDto.fm_subject}</div></td></tr>      
            		<tr><td colspan="3"><div id="img"><img class="" src="<%=request.getContextPath()%>/upload/${freemDto.fm_photo}" alt="" width=400px height=400px></div></td></tr>
	            	<tr><td width="35%"></td><td align="left" colspan="2">농장이름 : ${freemDto.farminfo}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취급품목 : ${freemDto.pro_name}</td></tr>
	            	<tr><td width="35%"></td><td align="left" colspan="2">위치 : ${freemDto.fm_location}</td></tr>
		            <tr><td width="35%"></td><td align="left" colspan="2">기간 : ${freemDto.fm_date}&nbsp;&nbsp;~&nbsp;&nbsp;${freemDto.fm_end}</td></tr>
		            <tr><td width="35%"></td><td align="left" colspan="2">방문가능 시간 : ${freemDto.fm_time}</td></tr>
           			<tr><td colspan="2" align="center"><b><<상세정보>></b></td></tr>
            		<tr><td colspan="2">${freemDto.fm_content}</td></tr>
            <tr><td colspan="3">
	            <a href="freemboardlist.five">목록</a>&nbsp;&nbsp;
	            <se:authentication property="name" var="LoginUser" />
	            	<c:if test="${LoginUser eq freemDto.user_id}">
					<a href="marketedit.five?mar_id=${freemDto.fm_id}">수정</a>&nbsp;&nbsp;
	            	<a href="marketdelete.five?mar_id=${freemDto.fm_id}">삭제</a>		
				</c:if>
            </td></tr>
         </table>
         	<input type="hidden" name="fm_id" value="${freemDto.fm_id}">
         <br>
         <hr>
         
	</form>
	
	
	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	</div>
	</section>

