<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<td>IDX</td>
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
			<a href="<%=request.getContextPath()%>/board/boardwrite.five">글쓰기</a>
	</div>
	</div>
	</section>
</div>
</html>