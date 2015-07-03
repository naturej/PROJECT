<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직거래 신청 목록</title>
<script type="text/javascript">
	function yesDirm(dirmno){
		$.ajax({
			url:'yesDirm.five',
			data:{
				dirmno : dirmno,
				user_rec : "${dto.user_rec}",
				user_send : "${dto.user_send}",
				pro_id : "${dto.pro_id}",
				title : "${dto.dirm_sub}",
				content : "${dto.dirm_content}",
				start : "${dto.dirm_startdate}",
				end : "${dto.dirm_enddate}"
			},
			dataType:'html'
		});
		alert('승인 완료');
		history.back();
	}
</script>
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
								<p>직거래 신청 목록</p>
							</div>
						</div>
					</div>
				</div>
			<form id="dirm">
			<table  class="table">
			<tr>
				<td>보낸사람</td>
				<td>${dto.user_send}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${dto.dirm_sub}</td>
			</tr>
			<tr>
				<td>품목</td>
				<td>${dto.pro_id}</td>
			</tr>
			<tr>
				<td>시작날짜</td>
				<td>${dto.dirm_startdate}</td>
			</tr>
			<tr>
				<td>종료날짜</td>
				<td>${dto.dirm_enddate}</td>
			</tr>
			<tr>
				<td colspan="2">${dto.dirm_content}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" class="btn_submit" value="수락" onclick="yesDirm(${dto.dirmno})">
					<input type="button" class="btn_cancel" value="거절" onclick="javascript:history.back()">				
				</td>
			</tr>
		</table>
		</form>
			</div>
		</div>
		</section>
	</div>
</body>
</html>