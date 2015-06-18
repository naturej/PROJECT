<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(function(){
	  $.ajax({
		  url : 'unitlist.five',
        dataType : "html",
        success : function(responseData){
      	  var options="";
      	  var unitlist = JSON.parse(responseData);
            $.each(unitlist, function(index,ulist){
                   options += "<option>"+ulist.unit+"</option>";
            });
            $('#unit').append(options);
        },
       error: function (xhr,Options,thrownError) {
       }
    });
});
</script>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="" method="post" enctype="multipart/form-data">
	<table border="1">
	
	<tr><td>제목</td><td><input type="text" name="bo_subject" value="${salboardDto.bo_subject}"/></td></tr>
	<tr><td colspan="2"><textarea name="bo_content">${salboardDto.bo_content}</textarea></td></tr>
	<tr><td>아이디</td><td><input type="text" name="user_id" value="${salboardDto.user_id}"/></td></tr>
	<tr><td>가격</td><td><input type="text" name="bo_price" value="${salboardDto.bo_price}" /></td></tr>
	<tr><td>단위</td><td><select id="unit" name="unit"><option>${salboardDto.unit}</option>
					</select></td></tr>
	<tr><td>품명</td><td><input type="text" name="pro_name" value="${salboardDto.pro_name}"/></td></tr>
	<tr><td>파일</td><td><input type="file" name="file"><img class="" src="salesboard/upload/${salboardDto.bo_photo}" alt="" width="400px" height="400px"></td></tr>
	<tr><td colspan="2"><input type="submit" value="수정" /></td></tr>
	</table>
	</form>
	
</body>
</html>