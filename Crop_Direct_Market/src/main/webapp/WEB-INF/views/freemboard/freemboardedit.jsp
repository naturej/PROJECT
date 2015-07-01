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
<script type="text/javascript">
		$(function(){
		 $.ajax({
			  url : 'seplist.five',
	      dataType : "html",
	      success : function(responseData){
	    	  var options="<option>분류</option>";
	    	  var seplist = JSON.parse(responseData);
	          $.each(seplist, function(index,slist){
	                 options += "<option>"+slist.pro_sep+"</option>";
	          });
	          $('#sep').html(options);
	      },
    		 error: function (xhr,Options,thrownError) {}
 		});
		  $('#sep').on("change",function(){
				$.ajax({
					type:"get",
					url:"prolist.five",// 와 동일하다고 생각url:"JqueryJSON.js",
					data:{pro_sep:$('#sep').val()},
					dataType:"html",
					success : function(responseData){
						var options = "<option>품명</option>";
		                var prolist = JSON.parse(responseData);
						$.each(prolist,function(index,plist){
							options += "<option>"+plist.pro_name+"</option>";
				          });
				          $('#pro_name').html(options);
				      },
			     error: function (xhr,Options,thrownError) {}
			  }); 
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
	<tr><td>제목</td><td colspan="3"><input type="text" name="bo_subject" value="${salboardDto.bo_subject}" /></td></tr>
	<tr><td colspan="4"><textarea name="bo_content">${salboardDto.bo_content}</textarea></td></tr>
	<tr><td>아이디</td><td colspan="3"><input type="text" name="user_id" value="${salboardDto.user_id}"/></td></tr>
	<tr><td>가격</td><td colspan="3"><input type="text" name="bo_price" value="${salboardDto.bo_price}" /></td></tr>
	<tr><td>단위숫자</td><td><input type="text" name="bo_salnum" value="${salboardDto.bo_salnum}"/></td><td>단위</td><td><select id="unit" name="unit"><option>${salboardDto.unit}</option>
					</select>
	</tr>
	<tr><td>품명</td><td colspan="3">
	<select id="sep" name="sep"><option>분류</option></select>
	
	<select id="pro_name" name="pro_name"><option>${salboardDto.pro_name}</option></select>
	
	</td></tr>
	<tr><td>파일</td><td colspan="3"><input type="file" name="file"><img class="" src="<%=request.getContextPath()%>/salesboard/upload/${salboardDto.bo_photo}" alt="" width="400px" height="400px"></td></tr>
	<tr><td colspan="4"><input type="submit" value="작성" /></td></tr>
	</table>
	</form>
	
</body>
</html>