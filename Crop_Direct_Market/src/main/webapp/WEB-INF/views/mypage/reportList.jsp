<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 목록</title>
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
								<h2>REPORT</h2>
								<i class="fa fa-2x fa-angle-down"></i>
								<p>신고 목록</p>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-hover">
					<c:set var="m2" value="${list}" />
					<tr>
						<td>신고자</td>
						<td>피신고자</td>
						<td>글번호</td>
						<td>내용</td>
						<td>작성일</td>
					</tr>
							<c:forEach items="${list}" var="l">
								<tr>
									<td>${l.user_send}</td>
									<td>${l.user_rec}</td>
									<td>${l.bo_num}</td>
									<td>${l.rep_content}</td>
									<td>${l.rep_date}</td>
								<tr>
							</c:forEach>
				</table>
			</div>
		</div>
		</section>
	</div>
</body>
</html>