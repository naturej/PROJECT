<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/star-rating/jquery.rating.css">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.form.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.MetaData.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/star-rating/jquery.rating.pack.js"></script>
<script type="text/javascript">
// action="reviewReg.five"
	function review() {
		if($("#re_content").val() == ""){
			alert('내용을 입력하세요');
		}else{
			$.ajax({
				url:'reviewReg.five',
				data:$("#review").serialize(),
				dataType:'html'
			});
	 		alert('평가를 등록하셨습니다');
	 		window.close();
	 		window.opener.location.reload();
		}
	}
</script>
</head>

<body style="overflow: hidden;">
<h3 style="margin: 0">리뷰 작성하기</h3>
		<hr color="#1ABC9C">
   제품명:
   <%=request.getParameter("product")%>
   <br>
   <form id="review">
   
      <input name="re_score" type="radio" class="star {split:2}" value="0.5" />
      <input name="re_score" type="radio" class="star {split:2}" value="1.0" />
      <input name="re_score" type="radio" class="star {split:2}" value="1.5" />
      <input name="re_score" type="radio" class="star {split:2}" value="2.0" />
      <input name="re_score" type="radio" class="star {split:2}" value="2.5" checked="checked" /> 
      <input name="re_score" type="radio" class="star {split:2}" value="3.0" /> 
      <input name="re_score" type="radio" class="star {split:2}" value="3.5" /> 
      <input name="re_score" type="radio" class="star {split:2}" value="4.0" /> 
      <input name="re_score" type="radio" class="star {split:2}" value="4.5" /> 
      <input name="re_score" type="radio" class="star {split:2}" value="5.0" /><br>
      <textarea id="re_content" rows="10" cols="50" name="re_content" ></textarea><br>      <!--  -->
      <input hidden name="bo_num" value="${param.bo_num}" /> 
      <input hidden name="user_id" value="${user_id}" /><br>
      <div align="left" style="margin-left: 90px;">
      <input type="button" class="btn_submit" value="리뷰 작성하기" onclick="review()"/>&nbsp;
      <input type="button" class="btn_cancel" value="취소" onclick="window.close()">
      </div>
   </form>
</body>
</html>