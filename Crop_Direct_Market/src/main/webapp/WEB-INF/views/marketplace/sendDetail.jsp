<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보낸 메세지 상세보기</title>
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
								<p>보낸 메세지</p>
							</div>
						</div>
					</div>
				</div>
					<table class="table table-hover">
		<tr>
			<td>받는사람</td>
			<td>${dto.rec_userid}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.me_date}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.me_subject}</td>
		</tr>
		<tr>
			<td colspan="2">${dto.me_content}</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="sendList.five">목록</a>&nbsp;&nbsp;
				<a href="deleteSend.five?me_num=${dto.me_num}">삭제</a>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
			</div>
		</div>
		</section>
	</div>
</body>
</html>