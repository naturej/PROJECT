<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>받은 메세지함</title>
<script type="text/javascript">
function newMessage(){
	window.open('newMessage.five','쪽지 보내기', 'width=430, height=420, scrollbars=no')
}
</script>
</head>
<body>
	<div id="content" style="height:100%">
		<section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>MESSAGE</h2>
								<i class="fa fa-2x fa-angle-down"></i>
								<p>받은 메세지함</p>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-hover">
					<c:set var="m2" value="${list}" />
					<tr>
						<td>받는사람</td>
						<td>보내는사람</td>
						<td>제목</td>
						<td>작성일</td>
						<td>삭제</td>
					</tr>
					<c:choose>
						<c:when test="${empty m2}">
							<tr>
								<td colspan="6">받은 메세지가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="m">
								<tr>
									<td>${m.rec_userid}</td>
									<td>${m.send_userid}</td>
									<td><a href="RecDetail.five?me_num=${m.me_num}">${m.me_subject}</a></td>
									<td>${m.me_date}</td>
									<td><a href="deleteRec.five?me_num=${m.me_num}">삭제</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<a href="" onclick="newMessage()">메세지 작성하기</a>
			</div>
		</div>
		</section>
	</div>
</body>
</html>