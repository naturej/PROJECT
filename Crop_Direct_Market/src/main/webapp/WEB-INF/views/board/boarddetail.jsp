<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>
<script type="text/javascript">
$(function(){
	$('#btn').click(function(){
	$.ajax({
			type:'POST',
			url:"replywrite.five",
			data:{idx:$('#idx').val(),
				  re_content:$('#re_content').val()
			},
			dataType:"html",
			success : function(responseData){
				  console.log("전송성공");
				  var options="";
		      	  var relist = JSON.parse(responseData);
		          options="<table class='table'><tr><td><div align='left' style='font-size:12px;'>작성자</div></td>"+
        					"<td><div align='center' style='font-size:12px;'>내용</div></td>"+
        					"<td><div align='right' style='font-size:12px;'>작성일</div></td></tr>"; 
		      	  $.each(relist, function(index,re){
		      		  options+= "<tr><td><div align='left' style='font-size:12px;'>"+re.user_id+"</div></td>"+
	                 		   "<td><div align='center' style='font-size:12px;'>"+re.re_content+"</div></td>"+
	               			   "<td><div align='right' style='font-size:12px;'>"+(re.re_writedate.year+1900)+"."+
	               				(re.re_writedate.month+1)+"."+(re.re_writedate.date)+"&nbsp;</div></td></tr>";          
		      	  });
		      	  options+="</table>"
		            $('#reli').html(options);
				  
			},
	    error: function (xhr,Options,thrownError) {}
    }); 
	});
	
	
});
</script>
		<html class="no-js">
			<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
			    <div id="content">
		     <section id="service" class="home-section text-center">
				<div class="heading-about">
					<div class="container">
					<div class="row">
							<div class="col-lg-8 col-lg-offset-2">
							<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
							<h2>Board</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>농산물 정보 공유 & 공지사항</p>
							</div>
							</div>
						</div>
					</div>
			
				<table class="table">
				<tr><td colspan="2"><div align="left" style="height: 50px; font-size: 20px;">>&nbsp;${boardDto.subject}</div>
				</td><td align="right">${boardDto.writedate}</td></tr>
				<tr><td colspan="3" align="right">글쓴이&nbsp;${boardDto.user_id}&nbsp;&nbsp;&nbsp;&nbsp;첨부파일&nbsp;${boardDto.filename}</td></tr>
				<tr><td colspan="3" align="left">내용</td></tr>
				<tr><td colspan="3"><div style="height: 200px;">${boardDto.content}</div></td></tr>
				<tr><td colspan="3" align="left">댓글</td></tr>
				</table>
				
				<div id="reli">
				<table class="table">
                <c:set var="reply" value="${list}" />
           		<c:choose>
            	<c:when test="${empty reply}">
            		<tr>
            		<td colspan="3">
            			작성된 댓글이 없습니다. 댓글을 작성해보세요
            		</td>
            		</tr>
            	</c:when>
            	<c:otherwise>
            		<tr><td><div align="left" style="font-size:12px;">작성자</div></td>
            		<td><div align="center" style="font-size:12px;">내용</div></td>
            		<td><div align="right" style="font-size:12px;">작성일</div></td></tr>
				<c:forEach items="${list}" var="re">
                <tr><td><div align="left" style="font-size:12px;">${re.user_id}</div></td>
                <td><div align="center" style="font-size:12px;">${re.re_content}</div></td>
                <td><div align="right" style="font-size:12px;">${re.re_writedate}&nbsp;</div></td></tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                </table>          
 				</div>
 					
 				 <div class="input-group input-group-sm">
                 <input type="text" class="form-control" name="re_content" id="re_content">
                 <span class="input-group-btn">
                 <button class="btn btn-info btn-flat" name="btn" id="btn" type="button">댓글쓰기</button>
                 </span>
                 </div>
                 
				<input type="hidden" id="idx" name="idx" value="${boardDto.idx}">
                 	<a href="boardlist.five">목록</a>
					<a href="boardedit.five?idx=${boardDto.idx}">수정</a>
					<a href="boarddelete.five?idx=${boardDto.idx}">삭제</a>

                 
                 </div>
				</div>
				</div>
		</section>
	</div>
</html>