<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="nowpage" value="${requestScope.page}" />
<c:set var="maxpage" value="${requestScope.maxpage}" />
<c:set var="startpage" value="${requestScope.startpage}" />
<c:set var="endpage" value="${requestScope.endpage}" />



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
						<p>농산물 관련정보 & 공지사항</p>
						</div>
						</div>
					</div>
				</div>
	
				<table class="table table-hover">
                  <thead>
				<tr>
				<td>IDX${np}</td>
				<td>SUBEJCT</td>
				<td>DATE</td>
				<td>COUNT</td>
				<td>WIRTER</td>
					</tr>
					<tbody>
					<c:forEach items="${list}" var="n">
				<tr>
					<td>${n.idx}</td>
					<td><a href="<%=request.getContextPath()%>/board/detailboard.five?idx=${n.idx}">${n.subject}</a></td>
					<td>${n.writedate}</td>
					<td>${n.count}</td>
					<td>${n.user_id}</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>

				<c:choose>
				<c:when test="${nowpage<=1}">
				[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="<%=request.getContextPath()%>/board/boardlist.five?pg=${nowpage-1}">[이전]</a>&nbsp;
					</c:otherwise>
				</c:choose>
				<c:forEach var="i"  begin="${startpage}" end="${endpage}" step="1">
				<c:choose>
				<c:when test="${i==nowpage}">
				[${i}]
				</c:when>
				<c:otherwise>
					<a href="<%=request.getContextPath()%>/board/boardlist.five?pg=${i}">[${i}]</a>&nbsp;
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${nowpage>=maxpage}">
					[다음]
					</c:when>
					<c:otherwise>
						<a href="<%=request.getContextPath()%>/board/boardlist.five?pg=${nowpage+1}">[다음]</a>&nbsp;
					</c:otherwise>
				</c:choose>
			
			
			<a href="<%=request.getContextPath()%>/board/boardwrite.five">글쓰기</a>
			
	</div>
	</div>
	</section>
</div>
</html>