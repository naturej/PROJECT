<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/datepicker_mint.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%String user_id = (String)request.getAttribute("user_id");%>
<script type="text/javascript">
	$(function() {
	    $( "#startdate" ).datepicker({
            dateFormat: "yy-mm-dd"
        });
	    $( "#enddate" ).datepicker({
            dateFormat: "yy-mm-dd"
        });
	  });
</script>
	<div id="content">
	<section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>Free Share</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>Free Share Write</p>
					</div>
					</div>	
	
	 <!-- Main content -->
                <section class="content">
                            <div class='box box-info'>
                                <div class='box-body pad' align="center">
	
	<form action="" method="post" enctype="multipart/form-data">
	<input type="hidden" id="user_id" name="user_id" value="<%=user_id%>"/>
	<div class="Free_Share">
	<table>
	<tr><td><label>제목</label></td><td colspan="3"><input class="form-control" type="text" name="fm_subject"/></td></tr>
	<tr><td>시작일:</td><td style="width: 100px;"><input type="text" name="fm_date" id="startdate"></td>
		<td>종료일:</td><td><input type="text" name="fm_end" id="enddate"></td>
	</tr>
	<tr><td>방문시간</td><td colspan="3"><input class="form-control" type="text" name="fm_time"></td></tr>
	<tr>
	<tr><td colspan="4">
	<textarea id="editor1" name="editor1" rows="5" cols="80">
      내용을 입력하세요
    </textarea>
	</td></tr>
	<tr><td><label>사진</label></td><td><input type="file" name="file"></td></tr>
	<tr><td colspan="4" align="center"><button type="submit" class="btn btn-sm btn-skin">작성</button></td></tr>
	</table>
	</div>
	
	</form>
	</div>
	</div>
	</section>
	</div>
	</div>
	</div>
	</div>
	</section>
	</div>
	<script src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js" type="text/javascript"></script>
	 <script src="<%=request.getContextPath()%>/js/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            $(function() {
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace('editor1');
                //bootstrap WYSIHTML5 - text editor
                $(".textarea").wysihtml5();
            });
        </script>
	