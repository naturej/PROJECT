<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
<link href="css/AdminLTE.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String user_id = (String) request.getAttribute("user_id");
%>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : 'unitlist.five',
			dataType : "html",
			success : function(responseData) {
				var options = "";
				var unitlist = JSON.parse(responseData);
				$.each(unitlist, function(index, ulist) {
					options += "<option>" + ulist.unit + "</option>";
				});
				$('#unit').append(options);
			},
			error : function(xhr, Options, thrownError) {
			}
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : 'seplist.five',
			dataType : "html",
			success : function(responseData) {
				var options = "<option>분류</option>";
				var seplist = JSON.parse(responseData);
				$.each(seplist, function(index, slist) {
					options += "<option>" + slist.pro_sep + "</option>";
				});
				$('#sep').html(options);
			},
			error : function(xhr, Options, thrownError) {
			}
		});
		$('#sep').on("change", function() {
			console.log($('#sep').val());
			$.ajax({
				url : "prolist.five",
				data : {
					pro_sep : $('#sep').val()
				},
				dataType : "html",
				success : function(responseData) {
					var options = "<option>품명</option>";
					var prolist = JSON.parse(responseData);
					$.each(prolist, function(index, plist) {
						options += "<option>" + plist.pro_name + "</option>";
					});
					$('#pro_name').html(options);
				},
				error : function(xhr, Options, thrownError) {
				}
			});
		});
	});
</script>
<!-- 판매글 유효성 검사 -->
<script type="text/javascript">
	function checkform() {
		var ckeditor = CKEDITOR.instances['editor1']; //CKEITOR의 내용을 갖고오기위해 객체 받아온다
		if (document.salform.bo_subject.value == "") { //id값이 없을 경우
			alert("제목을 입력하세요"); //메세지 경고창을 띄운 후
			document.salform.bo_subject.focus(); // id 텍스트박스에 커서를 위치
			return false;
		} else if (ckeditor.getData() == "") { // 가져온 Date가 값이 없을 경우
			alert("글 내용을 입력하세요");
			ckeditor.focus();
			return false;
		} else if (document.salform.bo_price.value == "") {
			alert("가격을 입력하세요");
			document.salform.bo_price.focus();
			return false;
		} else if (isNaN(document.salform.bo_price.value)) {
			alert("숫자만 입력하세요");
			document.salform.bo_price.focus();
			return false;
		} else if (document.salform.bo_salnum.value == "") {
			alert("판매 단위숫자를 입력하세요");
			document.salform.bo_salnum.focus();
			return false;
		} else if (isNaN(document.salform.bo_salnum.value)) {
			alert("숫자만 입력하세요");
			document.salform.bo_salnum.focus();
			return false;
		} else if (document.salform.unit.value == "단위") {
			alert("단위를 선택 하세요");
			return false;
		} else if (document.salform.sep.value == "분류") {
			alert("분류를 선택 하세요");
			return false;
		} else if (document.salform.pro_name.value == "품명") {
			alert("품명을 선택 하세요");
			return false;
		} else if (document.salform.file.value == "") {
			alert("판매 물품의 사진을 등록해주세요");
			return false;
		}
		document.salform.submit();
	}
</script>
<!-- 판매자에게 도매가 정보 -->
<script type="text/javascript">
$(function() {
$('#pro_name').on("change", function() {
	var form_data = {
			work : $("#work").val(),
			type : $("#type").val()
	};
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/searchPriceApi.five',
		data : form_data,
		success : function(data) { //서버가 보낸 data
			data = JSON.parse(data);
			$('#table').empty();
			for ( var _title in data.title) {
				$('#table').append("<td align='center'>"
									+ data.title[_title] +"</td>");
			}
			for (var i = 0; i < data.result.length; i++) {
				$('#table').append("<tr id="+i+"></tr>");
				for ( var _result in data.result[i]) {
						var qu = data.result[i].article.search($('#pro_name').val())
					if(qu!=-1){
						$('#' + i).append("<td align='center'>"
											+ data.result[i][_result] +"</td>");
						}
					}
				}
			}
		});
	});
});
</script>
<script type="text/javascript">
  $(function(){
    function runEffect() {
      var selectedEffect = 'blind';
      var options = {};
      $( "#effect" ).toggle( selectedEffect, options, 500 );
    };
    $( "#detail" ).click(function() {
      runEffect();
    });
  });
</script>	
<input type="hidden" value="1" id="work">
<input type="hidden" value="1" id="type">


<div id="content">
	<section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>Sales Board</h2>
								<i class="fa fa-2x fa-angle-down"></i>
								<p>Sales Board Write</p>
							</div>
						</div>
							
						<!-- Main content -->
						<section class="content">
							<div class='box box-info'>
								<div class='box-body pad' align="center">

									<form action="" method="post" enctype="multipart/form-data"
										name="salform" id="salform">
										<input type="hidden" id="user_id" name="user_id"
											value="<%=user_id%>" />
										<div class="SALES_BOARD">
											<table>
												<tr>
													<td><label>제목</label></td>
													<td colspan="4"><input class="form-control"
														type="text" name="bo_subject" /></td>
												</tr>
												<tr>
													<td colspan="5"><textarea id="editor1" name="editor1"
															rows="5" cols="80">
												      내용을 입력하세요
												    </textarea></td>
												</tr>
												<tr>
													<td><label>가격</label></td>
													<td><div class="input-group input-group-sm">
															<input
																style="text-align: right; padding-right: 1px; width: 150px"
																class="form-control" type="text" name="bo_price"
																placeholder="0000" />원
														</div></td>
													<td><label>숫자 단위</label></td>
													<td><input
														style="text-align: right; padding-right: 1px;"
														class="form-control" type="text" placeholder="0000"
														name="bo_salnum" /></td>
													<td><select id="unit" name="unit"><option>단위</option>
													</select></td>
												</tr>
												<tr>
													<td><label>품명</label></td>
													<td colspan="4"><select id="sep" name="sep"><option>분류</option></select>

														<select id="pro_name" name="pro_name"><option>품명</option></select>

													</td>
												</tr>
												<tr>
													<td><label>파일</label></td>
													<td colspan="4"><input type="file" name="file"></td>
												</tr>
												<tr>
													<td colspan="5" align="center"><button type="button"
															class="btn btn-sm btn-skin" onclick="checkform()">작성</button></td>
												</tr>
											</table>
										</div>
									</form>
									<div align="right">
									<input type="button" value="실시간 가격 확인" id="detail">
									</div>
									<div class="toggler">
								    <div id="effect" class="ui-widget-content ui-corner-all">
								    <br><br><br>
								     <h3 class="ui-widget-header ui-corner-all">실시간 가격 확인</h3>
								     
								     <table class="table" id="table">
								     </table>
								    </div>
								    </div>
																	
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
            $(function() {
                CKEDITOR.replace('editor1');
            });
        </script>
