<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에누리 상세보기</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style type="text/css">
	#origin_price{
		text-decoration: line-through;
	}
</style>
<script type="text/javascript">
	function yesEnuri(enu_idx){
		$.ajax({
			url:'yesEnuri.five',
			data:{
				enu_idx: enu_idx
			},
			dataType:'html'
		});
		$.ajax({
			url:'enuritoShop.five',
			data:{
				user_id: "${dto.user_id}",
				bo_num: "${dto.bo_num}",
				enu_quan: "${dto.enu_quan}",
				enu_price: "${dto.enu_price}"
			},
			dataType:'html'
		});
 		alert('수락했습니다');
		window.close();
		window.opener.location.reload();
		
	}
	function noEnuri(enu_idx){
		$.ajax({
			url:'noEnuri.five',
			data:{
				enu_idx: enu_idx
			},
			dataType:'html'
		});
 		alert('거절했습니다');
		window.close();
		window.opener.location.reload();
	}
</script>
</head>
<body>
	<form>
		<table cellpadding="7" style="margin: 10px;">
			<tr>
				<td>보낸사람</td>
				<td>${dto.user_id}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${dto.enu_date}</td>
			</tr>
			<tr>
				<td>품목</td>
				<td>${dto.bo_subject}</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${dto.enu_quan}</td>
			</tr>
			<tr>
				<td>에누리 가격</td>
				<td>
					<c:set var="price" value="${dto.enu_quan*dto.bo_price}"></c:set>
					<label id="origin_price">${price}</label> -> ${dto.enu_price}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.enu_content}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수락" onclick="yesEnuri(${dto.enu_idx})">
					<input type="button" value="거절" onclick="noEnuri(${dto.enu_idx})">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>