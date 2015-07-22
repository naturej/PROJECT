<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="org.springframework.format.datetime.DateFormatter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>
<link href="/ohdeokrionline/css/style.css" rel="stylesheet" type="text/css">
<% String user_id = SecurityContextHolder.getContext().getAuthentication().getName(); 
		System.out.println(user_id);
%>
<script type="text/javascript">
function delete_re(re_idx,idx){
		$.ajax({
			type: "POST",
			url: "re_del.five",
			data: {re_idx : re_idx,
				   idx : idx},
			success: function(responseData){
		      	location.reload();
			}
		});
	};
</script>
<script type="text/javascript">
$(function(){
	$('#btn').click(function(){
		if($('#re_content').val()==""){
			alert("댓글내용을 입력하세요"); //메세지 경고창
			return false;
		}
	$.ajax({
			type:'POST',
			url:"replywrite.five",
			data:{idx:$('#idx').val(),
				  re_content:$('#re_content').val()
			},
			dataType:"html",
			success : function(responseData){
			    console.log("전송성공");
		      	location.reload();
			},
	    error: function (xhr,Options,thrownError) {}
   		 }); 
	});
});

function popup(id){
	window.open('popup.five?rec_userid='+id,'쪽지 보내기', 'width=430, height=420, scrollbars=no')
}
</script>

		<html class="no-js">
			<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
			    <div id="content" >
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
				<c:set var="user"  value="<%=user_id%>"/>
				<div align="right"><a href="boardlist.five"><img src="<%=request.getContextPath()%>/img/liston.png" style=" height:30px; width:auto; "></a>
					<c:if test="${boardDto.user_id==user}">
					&nbsp;&nbsp;<a href="boardedit.five?idx=${boardDto.idx}"><img src="<%=request.getContextPath()%>/img/editonn.png" style=" height:32px; width:auto; "></a>
					&nbsp;<a href="boarddelete.five?idx=${boardDto.idx}"><img src="<%=request.getContextPath()%>/img/delon.png" style=" height:32px; width:auto; "></a>
					</c:if>
					<br><br>
					</div>
				<table class="table">
				<tr><td colspan="2"><div align="left" style="height: 50px; font-size: 20px;">>&nbsp;${boardDto.subject}</div>
				</td><td align="right">${boardDto.writedate}</td></tr>
				<tr><td colspan="3" align="right">글쓴이&nbsp;<a href="" onclick="popup('${boardDto.user_id}')">${boardDto.user_id}</a>&nbsp;&nbsp;&nbsp;&nbsp;첨부파일&nbsp;${boardDto.filename}</td></tr>
				<tr><td colspan="3" align="left">내용</td></tr>
				<tr><td colspan="3"><br><br>${boardDto.content}<br><br></td></tr>
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
            		<tr><td><div align="center" style="font-size:12px;">작성자</div></td>
            		<td><div align="center" style="font-size:12px;">내용</div></td>
            		<td><div align="right" style="font-size:12px;">작성일</div></td>
            		<td></td></tr>
				<c:forEach items="${list}" var="re">
                <tr><td><div align="center" style="font-size:12px;">${re.user_id}</div></td>
                <td><div align="center" style="font-size:12px;">${re.re_content}</div></td>
                <td><div align="right" style="font-size:12px;">${re.re_writedate}&nbsp;</div></td>
                <td>
                <se:authentication property="name" var="LoginUser" />
	            	<c:if test="${LoginUser eq re.user_id}">
	            		<input type="button" class="btn-xs btn-danger" value="삭제" onclick="delete_re('${re.re_idx}','${re.idx}')"/>
	            	</c:if>
                </td></tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                </table>          
 				</div>
 					
 				 <div class="input-group input-group-sm">
                 <input type="text" class="form-control" name="re_content" id="re_content">
                 <span class="input-group-btn">
                 <button  class="btn btn-sm btn-skin"  name="btn" id="btn" type="button">댓글쓰기</button>
                 </span>
                 </div>
				<input type="hidden" id="idx" name="idx" value="${boardDto.idx}">
                 
                 
                 </div>
				</div>
				</section>
				</div>
</html>