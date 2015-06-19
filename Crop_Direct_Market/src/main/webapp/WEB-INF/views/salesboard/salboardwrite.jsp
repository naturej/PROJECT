<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<form action="" method="post" enctype="multipart/form-data">
	
	<div class="SALES_BOARD">
	<table border="1">
	<tr><td>제목</td><td><input type="text" name="bo_subject" /></td></tr>
	<tr><td colspan="2"><textarea name="bo_content">내용</textarea></td></tr>
	<tr><td>아이디</td><td><input type="text" name="user_id"/></td></tr>
	<tr><td>가격</td><td><input type="text" name="bo_price" /></td></tr>
	<tr><td>단위</td><td><select id="unit" name="unit">
					</select>
	</tr>
	<tr><td>품명</td><td><input type="text" name="pro_name" /></td></tr>
	<tr><td>파일</td><td><input type="file" name="file"></td></tr>
	<tr><td colspan="2"><input type="submit" value="작성" /></td></tr>
	</table>
	</div>
	
	</form>
