<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<script>
		function enabledChange(user_id,enabled){
			var enabled = (enabled=='1') ? '0' : '1';
			$.ajax({
				type: "POST",
				url: "enabledChange.five",
				data: {
					user_id : user_id,
					enabled : enabled	
				},
				success: function(data){
					var enabled = data.trim();
					if(enabled=='0'){
						$(this).removeClass('btn-success').addClass('btn-danger').val('정지');
						location.href="memberManage.five";
					}else if(enabled=='1'){
						$(this).removeClass('btn-danger').addClass('btn-success').val('활성');
						location.href="memberManage.five";
					}
					
				}
			});
		}
	</script>
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
								<td>
									<c:choose>
										<c:when test="${user.enabled eq 1}">
											<input type="button" class="btn-xs btn-skin" value="활성" onclick="enabledChange('${user.user_id}','${user.enabled}')">
										</c:when>
										<c:when test="${user.enabled eq 0}">
											<input type="button" class="btn-xs btn-danger" value="정지" onclick="enabledChange('${user.user_id}','${user.enabled}')">
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
    </section>