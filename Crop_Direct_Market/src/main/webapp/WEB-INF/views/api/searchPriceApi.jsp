<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css">   
<!--위제에 같은 스크립트가 있어서 충돌 <script src="//code.jquery.com/jquery-1.11.2.min.js"></script> -->

<!--Api 데이터를 요청하는 함수  -->
<script type="text/javascript">
	$(function() {
		//이 페이지로 왔을때 미리 초기 설정된(채소) 데이타를 보내서 가격정보를 받아 뿌려줌
		var form_data = {
			work : $("#work").val(),
			type : $("#type").val()
		};

		$.ajax({
			type : "POST",
			url : 'searchPriceApi.five',
			data : form_data, //서버로 보내는 data
			//datatype : "json",
			success : function(data) { //서버가 보낸 즉 응답받은 data

				data = JSON.parse(data);
				console.log(data); 
					
				$('#table').empty(); //테이블을 비워 데이터 출력 겹치는것을 방지
				//화면에 뿌릴 데이터의 컬럼명을 for문으로 뿌림
				for ( var _title in data.title) {
					//console.log(data.title[_title]);
					$('#table').append("<td align='center'>" 
										+ data.title[_title] +"</td>"); 
				}
				//화면에 뿌릴 데이터를 for문으로 뿌림
				for (var i = 0; i < data.result.length; i++) {
					$('#table').append("<tr id="+i+"></tr>")  
					for ( var _result in data.result[i]) {
						//console.log(data.result[i][_result]+"/"+i);
						$('#' + i).append("<td align='center'>" 
								+ data.result[i][_result] +"</td>");
					}
				}
			}
		});
		
		//초기 설정된 데이터가 아닌 특정 데이터를 요청해 가격정보 받음
		$('#type').change(function(){
			
			var form_data = {
				work : $("#work").val(),
				type : $("#type").val()
			};

			$.ajax({
				type : "POST",
				url : 'searchPriceApi.five',
				data : form_data,
				//datatype : "json",
				success : function(data) { //서버가 보낸 data
					
					data = JSON.parse(data);
					console.log(data); 
					
					$('#table').empty();
					
					for ( var _title in data.title) {
						//console.log(data.title[_title]);
						$('#table').append("<td align='center'>"
											+ data.title[_title] +"</td>");
					}
					
					for (var i = 0; i < data.result.length; i++) {
						$('#table').append("<tr id="+i+"></tr>");
						for ( var _result in data.result[i]) {
							//console.log(data.result[i][_result]+"/"+i);
							$('#' + i).append("<td align='center'>"
												+ data.result[i][_result] +"</td>");
						}
					}
				}
			});

		});
	});
</script>
</head>
<body>

	<!-- Section: services -->
    <section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>시세정보</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>카테고리를 선택하시면 그에 따른 시세정보를 보여줍니다</p>
					</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<div class="container">
		<div class="row">
			<div class="col-lg-2 col-lg-offset-5">
				<hr class="marginbot-50">
			</div>
		</div>
        <div class="row">
            
				<div class="wow fadeInLeft" data-wow-delay="0.2s">
					<table>
						<tr>
							<td><select id="work">
									<option value="1" selected="selected">도매</option>
									<option value="2">소매</option>
							</select></td>
							<td>구분 <span>&nbsp</span><select id="type" class="btn btn-default btn-xs">
									<option value="1">채소</option>
									<option value="2">과수</option>
									<option value="3">축산</option>
									<option value="4">화훼</option>
									<option value="5">임산물</option>
									<option value="6">식량</option>
							</select>
							</td>
						</tr>
					</table>
					<br>

					<!-- id="table" 여기에 받은 데이터를 뿌려줌 -->
					<table id="table"  class="table table-striped">
					</table>
				
               <!--  <div class="service-box">
					<h3><i class="fa fa-css3 fa-3x"></i></h3>
					<div class="service-desc">
						<h5>WEB DESIGN</h5>
						<p>Vestibulum tincidunt enim in pharetra malesuada. Duis semper magna metus electram accommodare.</p>
					</div>
                </div> -->
				</div>
          
			
        </div>		
		</div>
	</section>
	<!-- /Section: services -->
	
</body>
</html>