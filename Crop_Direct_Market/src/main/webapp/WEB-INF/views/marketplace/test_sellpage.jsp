<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
   function senddata(number,id,product){
      console.log(number)
      console.log(id)
      console.log(product)
      window.open('enuri_sinchung.five?bo_num='+number+'&user_id='+id+'&pro_name='+product,'에누리 신청',
      'top=100px, left=100px, width=430 height=510 ')
      
   }
   function review(salnum, userid, product){
	   window.open('review_sinchung.five?bo_num='+salnum+'&user_id='+userid+'&product='+product,
	      'top=100px, left=100px, height=700 width=1000')
   }
</script>
</head>
<body>
   <!-- 
      
      한 라인의 데이터를 전부 parameter로 던져 주고 받아야 한다. 정답
      고정 값만 생각,받는 사람, 품목 추가로 글 번호까지 해주면 좋을 듯
      보이지 않는 데이터가 팝업 창에서 상당 수 존재 : enuri table에 들어가는 컬럼 대부분
      애초에 테스트 페이지에서도 16번 글의 데이터를 받는 구조로 만들어야 제대로 된 테스트 가능
      
      -->
   <table width="500" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <td>제목</td>
         <td>내용</td>
         <td>사진</td>
         <td>가격</td>
         <td>보내는 사람</td>
         <td>단위</td>
         <td>제품명</td>
         <td>작성일</td>
         <td>단위</td>
      <tr>
      <tr>
         <td
            onclick="senddata('${list.bo_num}','${list.user_id}','${list.pro_name}')">${list.bo_subject}</td>
         <td>${list.bo_content}</td>
         <td>${list.bo_photo}</td>
         <td>${list.bo_price}</td>
         <td>${list.user_id}</td>
         <td>${list.unit}</td>
         <td>${list.pro_name}</td>
         <td>${list.bo_date}</td>
         <td><a href="#" onclick="review('${list.bo_num}','${list.user_id}','${list.pro_name}')">평가하기</a></td>
      <tr>
   </table>
</body>
</html>