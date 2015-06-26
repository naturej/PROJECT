<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = (String)request.getAttribute("user_id");
%>
	
	<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
	<link href="css/AdminLTE.css" rel="stylesheet">
	
	<div id="content">
	<section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>Board</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>Board Write</p>
					</div>
					</div>
				</div>
                <!-- Main content -->
                <section class="content">
                    <div class='row'>
                        <div class='col-md-12'>
                            <div class='box box-info'>
                                <div class='box-body pad'>
                                    <form action="" method="post" enctype="multipart/form-data">
                                    <table>
                                    <tr><td><label>Subject</label></td><td>
	   								 <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject ..."/></td></tr>
                                    <tr><td colspan="2">    
                                        <textarea id="editor1" name="editor1" rows="15" cols="80">
                                            This is my textarea to be replaced with CKEditor.
                                        </textarea>
                                        </td></tr>    
                                        <tr><td colspan="2">
                                        <input type="text" id="user_id" name="user_id" class="form-control" placeholder="<%=user_id%>"/>                    
                                    	</td></tr>
                                    	<tr><td><label>Input file</label></td><td>
                                    	<input type="file" id="file" name="file"></td></tr>
                                    </table>
                                   
                                     <div align="right">
	 									  	<button type="submit" class="btn btn-primary">Submit</button>
	   								  </div>
	   								   </form>
                                </div>
                            </div><!-- /.box -->
                        </div><!-- /.col-->
                    </div><!-- ./row -->
                </section><!-- /.content -->
                
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
	