<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String user_id = (String)request.getAttribute("user_id");%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>	
	<link href="<%=request.getContextPath()%>/css/table-base/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/AdminLTE.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	
	 <!--글 내용 CK EDITOR  -->
    <script type="text/javascript">
            $(function() {
                CKEDITOR.replace('editor1');
            });
    </script>
        
	<!-- 공지사항 유효성 검사 -->
	<script type="text/javascript">
	function checkboard(){
		var ckeditor = CKEDITOR.instances['editor1']; //CKEITOR의 내용을 갖고오기위해 객체 받아온다
		if (document.boardForm.subject.value == "") { //id값이 없을 경우
				alert("제목을 입력하세요"); //메세지 경고창을 띄운 후
				document.boardForm.subject.focus(); // id 텍스트박스에 커서를 위치
				return false;
			}
		 else if(ckeditor.getData()=="") {	// 가져온 Date가 값이 없을 경우
				alert("글 내용을 입력하세요");
				ckeditor.focus();			
				return false;											
			}
		 document.boardForm.submit();
	}
	</script>
	
	<div id="content">
	<section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container" style="height: 620px;">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>Board</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>Board Write</p>
					</div>
					</div>
				
                <!-- Main content -->
                <section class="content">
                            <div class='box box-info'>
                                <div class='box-body pad' align="center">
                                    <form action="" method="post" name="boardForm" enctype="multipart/form-data">
                                    <input type="hidden" id="user_id" name="user_id" value="<%=user_id%>"/>                    
                                    <table>
                                    <tr><td><label>Subject</label></td><td>
	   								 <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject ..."/></td></tr>
                                    <tr><td colspan="2">    
                                        <textarea id="editor1" name="editor1" rows="15" cols="80">
                                            내용을 입력하세요
                                        </textarea>
                                        </td></tr>    
                                    	<tr><td><label>Input file</label></td><td>
                                    	<input type="file" id="file" name="file"></td></tr>
                                    </table>
                                     </form>
                                    <br><br>
                                	<div align="center">
	 									  	<button type="button"  class="btn btn-sm btn-skin" onclick="checkboard()" >작성완료</button>
	   								  </div>
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
	