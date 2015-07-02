<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2>Market</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>Market Edit</p>
					</div>
					</div>
				
                <!-- Main content -->
                <section class="content">
                            <div class='box box-info'>
                                <div class='box-body pad' align="center">
                                    <form action="" method="post" enctype="multipart/form-data">
                                    <table>
                                    <tr><td><label>Subject</label></td><td>
	   								 <input type="text" class="form-control" id="mar_subject" name="mar_subject" value= "${marketDto.mar_subject}" placeholder="Subject ..."/></td></tr>
                                    	<tr><td><label>시간</label></td><td>
                                    	<input type="text" class="form-control" id="mar_time" name="mar_time" value= "${marketDto.mar_time}" placeholder="Time ..."/></td></tr>
										<tr><td><label>장터날짜</label></td><td>
										<input type="text" class="form-control" id="mar_date" name="mar_date" value= "${marketDto.mar_date}" placeholder="Date ..."/></td></tr>
										<tr><td><label>장터위치</label></td><td>
										<input type="text" class="form-control" id="mar_location" name="mar_location" value= "${marketDto.mar_location}" placeholder="Location ..."/></td></tr>
										<tr><td><label>최대입점수</label></td><td>
										<input type="text" class="form-control" id="mar_maxshop" name="mar_maxshop" value= "${marketDto.mar_maxshop}" placeholder="MaxShop ..."/></td></tr>
                                  	  	<tr><td colspan="2">    
                                        <textarea id="mar_content" name="mar_content" rows="15" cols="80">
                                        ${marketDto.mar_content}
                                        </textarea>
                                        </td></tr>    
                                    	<tr><td><label>Input file</label></td><td>
                                    	<input type="file" id="file" name="file" value= "${marketDto.mar_photo}"></td></tr>
                                    </table>
                                	<div align="right">
	 									  	<button type="submit" class="btn btn-primary">Submit</button>
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
                CKEDITOR.replace('mar_content');
                //bootstrap WYSIHTML5 - text editor
                $(".textarea").wysihtml5();
            });
        </script>	
	</form>
