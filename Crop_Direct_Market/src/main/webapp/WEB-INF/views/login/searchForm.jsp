<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>
<script>
$(function(){
	$('#id_search').click(function(){
		$.ajax({
			  type: "POST",
			  url: "id_search.five",
			  data: {email:$('#email').val()},
			  success: function(data){
				  $('#dialog').text(data).dialog();
			  }
		});
	});
	
	$('#pwd_search').click(function(){
		$.ajax({
			  type: "POST",
			  url: "pwd_search.five",
			  data: {user_id:$('#user_id').val(),
				  	email:$('#email2').val()},
			  success: function(data){
				  $('#dialog').text(data).dialog();
			  }
		});
	});
});
</script>
<!DOCTYPE html>
	<!-- Section: contact -->
    <section id="contact" class="text-center" style="padding-bottom: 5px;height:352px">
    	<div class="boxed-grey">
			<form method="post" action="">
				<div class="row">
					<div class="col-md-6 col-lg-12">
                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="text" class="form-control" name="email" id="email" placeholder="Enter Email" required /></div>
                        </div>
                    </div>
                    <div class="col-md-6  col-lg-12 form-group">
                        <button type="button" class="btn btn-skin pull-right" id="id_search">ID찾기</button>
                    </div>
                    <br><hr>
                    <div class="col-md-6 col-lg-12">
                        <div class="form-group">
                            <label for="user_id">ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input type="text" class="form-control" name="user_id" id="user_id" placeholder="Enter Id" required /></div>
                        </div>
                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="text" class="form-control" name="email" id="email2" placeholder="Enter Email" required /></div>
                        </div>
                    </div>
                    <div class="col-md-6  col-lg-12">
                        <button type="button" class="btn btn-skin pull-right" id="pwd_search">PWD찾기</button>
                    </div>
                </div>
			</form>
		</div>
	</section>
	<div id="dialog" title="title">
	</div>