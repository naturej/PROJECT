<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>받은 직거래 쪽지함</title>
</head>
<body>
	<div id="content">
		<section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>MESSAGE</h2>
								<i class="fa fa-2x fa-angle-down"></i>
								<p>받은 직거래 신청</p>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-hover">
					<c:set var="m2" value="${list}" />
					<tr>
						<td>보내는사람</td>
						<td>제목</td>
					</tr>
					<c:choose>
						<c:when test="${empty m2}">
							<tr>
								<td colspan="6">받은 메세지가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="d">
								<tr>
									<td>${d.user_send}</td>
									<td><a href="dirmDetail.five?me_num=${d.dirmno}">${d.dirm_sub}</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		</section>
	</div>
</body>
</html>