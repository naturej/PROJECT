<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
<link href="css/AdminLTE.css" rel="stylesheet">

<!-- 장터글 유효성 검사 -->
<script type="text/javascript">
	function checkform() {
		var mar_content = CKEDITOR.instances['mar_content']; //CKEITOR의 내용을 갖고오기위해 객체 받아온다
		var mardate = /^[0-9][0-9][0-9][0-9]\/[0-1][0-9]\/[0-3][0-9]/;
		if (document.marketform.mar_subject.value == "") { //id값이 없을 경우
			alert("제목을 입력하세요"); //메세지 경고창을 띄운 후
			document.marketform.mar_subject.focus(); // id 텍스트박스에 커서를 위치
			return false;
		} else if (document.marketform.mar_time.value == "") {
			alert("시간을 입력하세요");
			document.marketform.mar_time.focus();
			return false;
		} 
		else if (!mardate.test(document.marketform.mar_date.value)) {
			alert("날짜를 0000/00/00 형식으로 입력하세요");
			document.marketform.mar_date.focus();
			return false;
		} 
		else if (document.marketform.mar_location.value == "") {
			alert("장소를 입력하세요");
			document.marketform.mar_location.focus();
			return false;
		} else if (isNaN(document.marketform.mar_maxshop.value)) {
			alert("입점가능한 수를 입력하세요(숫자만)");
			document.marketform.mar_maxshop.focus();
			return false;
		} else if (mar_content.getData() == "") { // 가져온 Date가 값이 없을 경우
			alert("글 내용을 입력하세요");
			mar_content.focus();
			return false;
		} 
		
		document.marketform.submit();
	}
</script>
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
					<p>Market Write</p>
					</div>
					</div>
				
                <!-- Main content -->
                <section class="content">
                            <div class='box box-info'>
                                <div class='box-body pad' align="center">
                                    <form action="" method="post" enctype="multipart/form-data"
                                    name="marketform" id="marketform">
                                    <table>
                                    <tr><td><label>Subject</label></td><td>
	   								 <input type="text" class="form-control" id="mar_subject" name="mar_subject" placeholder="Subject ..."/></td></tr>
                                    	<tr><td><label>시간</label></td><td>
                                    	<input type="text" class="form-control" id="mar_time" name="mar_time" placeholder="Time ..."/></td></tr>
										<tr><td><label>장터날짜</label></td><td>
										<input type="text" class="form-control" id="mar_date" name="mar_date" placeholder="Date ..."/></td></tr>
										<tr><td><label>장터위치</label></td><td>
										<input type="text" class="form-control" id="mar_location" name="mar_location" placeholder="Location ..."/></td></tr>
										<tr><td><label>최대입점수</label></td><td>
										<input type="text" class="form-control" id="mar_maxshop" name="mar_maxshop" placeholder="MaxShop ..."/></td></tr>
                                  	  	<tr><td colspan="2">    
                                        <textarea id="mar_content" name="mar_content" rows="15" cols="80">
                                        </textarea>
                                        </td></tr>    
                                    	<tr><td><label>Input file</label></td><td>
                                    	<input type="file" id="file" name="file"></td></tr>
                                    </table>
                                	<div align="center">
                                	<button type="submit"
											class="btn btn-sm btn-skin" >submit</button>
	 									  	<button type="button"
											class="btn btn-sm btn-skin" onclick="checkform()">작성</button>
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
		CKEDITOR.replace('mar_content');
		$(".textarea").wysihtml5();
		});
</script>	
	
