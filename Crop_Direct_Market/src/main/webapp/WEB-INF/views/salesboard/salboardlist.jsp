<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div id="content">
	<section id="service" class="home-section text-center">
			<div class="heading-about">
				<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
						<h2>SALESBOARD</h2>
						<i class="fa fa-2x fa-angle-down"></i>
						<p>농산물 판매</p>
						</div>
						</div>
					</div>
				</div>
	

					<table>
					<tr>
				<th class="bo_num">번호</th>
				<th class="bo_subject">제목</th>
				<th class="bo_photo">사진</th>
				<th class="unit">단위</th>
				<th class="bo_price">가격</th>
				<th class="user_id">작성자</th>
				<th class="bo_date">작성일</th>
					</tr>
					<c:forEach items="${list}" var="n">
				
				<tr>
					<td class="bo_num">${n.bo_num}</td>
					<td class="bo_subject"><a href="salesdetail.five?bo_num=${n.bo_num}">${n.bo_subject}${n.bo_photo}</a></td>
					<td class="bo_photo"><img class="" src="/salboard/upload/${n.bo_photo}" alt="" width="200px" height="200px"></td>
					<td class="unit">${n.bo_salnum}${n.unit}</td>
					<td class="bo_price">${n.bo_price}</td>
					<td class="user_id">${n.user_id}</td>
					<td class="bo_date">${n.bo_date}</td>
				</tr>
			</c:forEach>
			</table>
	</div>
	</div>
	</section>
</div>
</html>