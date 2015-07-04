<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <!-- Section: contact -->
    <section id="contact" class="home-section text-center">
    	<div class="boxed-grey">
		    <div class="row" style="height:293px;" align="center">
			<table>
				<tr>
				<td align="center">
					<a href="join.five?user=ROLE_SELLER">
					<img src="<%=request.getContextPath()%>/img/seller.png" style="height: 300px; width: auto;"><br>
					<button type="button" class="btn btn-skin">판매자</button>
					</a>
				</td>
				<td align="center">
					<a href="join.five?user=ROLE_CONSUMER">
					<img src="<%=request.getContextPath()%>/img/consumer.png" style="height: 300px; width: auto;"><br>
					<button type="button" class="btn btn-skin">소비자</button>
					</a>
				</td>
				</tr>
			</table>
			</div>
		</div>
	</section>
	