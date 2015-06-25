<!-- 장바구니 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	function deleteAll(){
		$.ajax({
			url:'deleteall.five'
		});
		location.reload();
	}
	
	function deleteshop(bo_num){
		$.ajax({
			url:'deleteshop.five?bo_num='+bo_num
		});
		location.reload();
	}
	$(document).ready(function(){
		mergeRows(basket,6);// 위 행과 비교하여 같다면 두번째  컬럼 머지
		console.log(basket.rows.length);
		});
	
	function mergeRows(){
		var argu  = mergeRows.arguments; 
		 var cnt  = 1;                                        // rowspan 값 
		 var oTbl  = argu[0];     //테이블 객체      // 비교할 Table Object, default=첫번째 테이블 
		 var oRow;                                            // 현재 Row Object 
		 var oCell;                                            // 현재 Cell Object 
		 var iRow;                                            // 이전에 일치했던 Row Index 
		 var iCell = (argu[1] == null) ? 0 : argu[1];            // 비교할 Cell Index, default=0 
		 console.log(argu[0].rows[argu[1]].cells);
		 var vPre;                                            // 이전에 일치했던 값 
		 var vCur;                                            // 현재 값 
		 var bChk  = false;
		 
		 try { 
			  for (var i=0; i<oTbl.rows.length; i++) {              // Row Index만큼 Loop 
			   for (var j=0; j<oTbl.rows[i].cells.length; j++) { // Cell Index 만큼 Loop 
			    if (iCell == -1 || iCell == j) {                              // 비교할 Cell Index와 현재 Cell Index가 동일하면,, 
			     vCur = oTbl.rows[i].cells[j].innerHTML; 
			     
			     if (vPre == vCur) {                          // 이전값과 현재값이 동일하면,, 
			      if (bChk == false) {                        // 처음 일치시에만 적용 
			       iRow = i-1; 
			       bChk = true; 
			      } // end of if 

			      cnt++; 
			      oTbl.rows[iRow].cells[j].rowSpan = cnt; 
			      oTbl.rows[i].deleteCell(j); 
			     } else {                                      // 이전값과 현재값이 다르면,, 
			      cnt = 1; 
			      vPre = vCur; 
			      bChk = false; 
			     } // end of if 

			     break; 
			    } // end of if 
			   } // end of for 
			  } // end of for 
			 } catch (e) { 
			  alert(e.description); 
			 } // end of try{} catch{} 
			} // end of function
</script>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1" id="basket">
	<tr>
		<td>선택</td>
		<td>구매자</td>
		<td>품명</td>
		<td>판매가</td>
		<td>수량</td>
		<td>총가격</td>
		<td>판매자</td>
		<td>삭제</td>
	<tr>
	<c:set var="sum" value="0"/>
	<c:forEach items="${list}" var="e">
	<c:set var="sum" value="${sum + e.sh_price}"></c:set>
	<tr>
		<td><input type="checkbox" checked="checked"></td>
		<td>${e.user_id}</td>
		<td>${e.bo_subject}</td>
		<td>${e.bo_price}</td>
		<td>${e.sh_quantity}</td>
		<td>${e.sh_price}</td>
		<td>${e.sell_id}</td>
		<td><a href="" onclick="deleteshop('${e.bo_num}')">x</a></td>
	<tr>
	</c:forEach>
	<tr>
		<td colspan="8" align="right">
			총가격 : ${sum} 
		</td>
	</tr>
	<tr>
		<td colspan="8" align="center">
			<input type="button" value="선택상품 삭제">
			<input type="button" value="선택상품 주문"><!-- 주문으로 넘어가게 -->
			<input type="button" value="이전으로" onclick="javascript:history.back()">
			<input type="button" value="비우기" onclick="deleteAll()">
		</td>
	</tr>
</table>
</body>
</html>