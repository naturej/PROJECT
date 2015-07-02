<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<!-- Section: contact -->
    <section id="service" class="home-section text-center" style="position: static">
    	<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>회원 관리</h2>
					</div>
					</div>
				</div>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<td>USER_ID</td>
							<td>Authority</td>
							<td>REPORT-COUNT</td>
							<td>ENABLED</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td>${user.user_id}</td>
								<td>${user.authority}</td>
								<td>${user.reportcount}</td>
								<td>${user.enabled}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
    </section>