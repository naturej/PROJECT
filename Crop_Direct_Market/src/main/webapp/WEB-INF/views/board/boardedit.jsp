<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)request.getAttribute("user_id");
%>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>   
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
					<p>Board Edit</p>
					</div>
					</div>
				
                <!-- Main content -->
                <section class="content">
                            <div class='box box-info'>
                                <div class='box-body pad' align="center">
                                    <form action="" method="post" enctype="multipart/form-data">
                                    <table>
                                    <tr><td><label>Subject</label></td><td>
	   								 <input type="text" class="form-control" id="subject" name="subject" value="${boardDto.subject}"/></td></tr>
                                    <tr><td colspan="2">    
                                        <textarea id="editor1" name="editor1" rows="15" cols="80">
                                            ${boardDto.content}
                                        </textarea>
                                        </td></tr>    
                                        <tr><td colspan="2">
                                        <input type="text" id="user_id" name="user_id" class="form-control"  value="${boardDto.user_id}"/>                    
                                    	</td></tr>
                                    	<tr><td><label>기존 file:${boardDto.filename}</label></td><td>
                                    	<input type="file" id="file" name="file"></td></tr>
                                    </table>
                                   <br>
                                   <br>
                                	<div align="center">
	 									  	<button type="submit" class="btn btn-sm btn-skin">수정완료</button>
	   								  </div>
	   								   </form>
	   								   
                                </div>
                            </div><!-- /.box -->
                </section><!-- /.content -->
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
	
	
