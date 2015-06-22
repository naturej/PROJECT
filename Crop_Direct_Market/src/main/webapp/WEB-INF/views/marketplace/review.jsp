<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</head>

<body>
   제품명:
   <%=request.getParameter("product")%>
   <br>
   <form action="reviewReg.five">
      <input name="re_score" type="radio" class="star {split:2}" value="0.5" />
      <input name="re_score" type="radio" class="star {split:2}" value="1.0" />
      <input name="re_score" type="radio" class="star {split:2}" value="1.5" />
      <input name="re_score" type="radio" class="star {split:2}" value="2.0" />
      <input name="re_score" type="radio" class="star {split:2}" value="2.5"
         checked="checked" /> <input name="re_score" type="radio"
         class="star {split:2}" value="3.0" /> <input name="re_score"
         type="radio" class="star {split:2}" value="3.5" /> <input
         name="re_score" type="radio" class="star {split:2}" value="4.0" /> <input
         name="re_score" type="radio" class="star {split:2}" value="4.5" /> <input
         name="re_score" type="radio" class="star {split:2}" value="5.0" /> <br>
      <input type="text" name="re_content" size="60"><br> 
      <input id="sub" type="submit" />
      <!--  -->
      <input hidden name="bo_num" value="${param.bo_num}" /> 
      <input hidden name="user_id" value="${param.user_id}" /> 
   </form>
</body>
</html>