<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

	
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">   
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


<script type="text/javascript">


	$(function() {
							
			var form_data = {
					date : $("#today_date").val()
					//lcode : $("#large_code option:selected").val(),
					//mcode : $("#middle_code option:selected").val()
			};
 
			$.ajax({
				type : "POST",
				url : 'auction_farmApi.five',
				data : form_data,
				//datatype : "json",
				success : function(data) { //서버가 보낸 data
						
					data = JSON.parse(data);
					console.log(data.result);
					
					//ajax로 얻은 데이터 대분류 이름을 select 하게 option에 넣어줌
					for(var key in data.result){
						$('#large').append("<option>"+data.result[key].name+"</option>");
					}
					
					//대분류 이름을 select 해서 change하면 그에 맞은 코드값을 구해 또 다시 ajax로 중분류데이터를 얻는다
					$('#large').change(function() {
						var _large =$("#large option:selected").val();
						$('#large_code').empty();
						$('#middle').empty();
						$('#middle_code').empty();
						$('#small').empty();
						$('#small_code').empty();
						for(var key in data.result){
							if(_large == data.result[key].name){//대분류 이름과 같은 코드 추출
								$('#large_code').append("<option>"+data.result[key].code+"</option>");
									console.log("aaaaa"+$("#large_code option:selected").val());
									
									//중분류 데이터를 얻기 위해 ajax 처리
									var form_data = {
											date : $("#today_date").val(),
											lcode : $("#large_code option:selected").val()
											//mcode : $("#middle_code option:selected").val()
									};
									$.ajax({
										type : "POST",
										url : 'auction_farmApi.five',
										data : form_data,
										//datatype : "json",
										success : function(data) { //서버가 보낸 data
												
											data = JSON.parse(data);
											console.log(data.result);
											$('#middle').empty();
											$('#middle').append("<option>선택하세요</option>");
											for(var key in data.result){
												$('#middle').append("<option>"+data.result[key].name+"</option>");
											}
											
											$('#middle').change(function() {
												var _middle =$("#middle option:selected").val();
												$('#middle_code').empty();
												$('#small').empty();
												$('#small_code').empty();
												for(var key in data.result){
													if(_middle == data.result[key].name){
														$('#middle_code').append("<option>"+data.result[key].code+"</option>");
														
														//소분류 데이터를 얻기 위해 ajax처리
														var form_data = {
																date : $("#today_date").val(),
																lcode : $("#large_code option:selected").val(),
																mcode : $("#middle_code option:selected").val()
																//scode : $("#small_code option:selected").val()
														};
														$.ajax({
															type : "POST",
															url : 'auction_farmApi.five',
															data : form_data,
															//datatype : "json",
															success : function(data) { //서버가 보낸 data
																	
																data = JSON.parse(data);
																console.log(data.result);
																$('#small').empty();
																$('#small').append("<option>선택하세요</option>");
																for(var key in data.result){
																	$('#small').append("<option>"+data.result[key].name+"</option>");
																}
																
																$('#small').change(function() {
																	$('#small_code').empty();
																	$('#sale_maket').empty();
																	$('#sale_maket_code').empty();
																	var _small =$("#small option:selected").val();
																	
																	for(var key in data.result){
																		if(_small == data.result[key].name){
																			$('#small_code').append("<option>"+data.result[key].code+"</option>");
																			console.log($("#small_code option:selected").val());
																			
																			////도매 코드 데이터를 얻기위함
																			var form_data = {
																					date : $("#today_date").val(),
																					lcode : $("#large_code option:selected").val(),
																					mcode : $("#middle_code option:selected").val(),
																					scode : $("#small_code option:selected").val()
																			};
																			
																			$.ajax({
																				type : "POST",
																				url : 'auction_farmApi.five',
																				data : form_data,
																				//datatype : "json",
																				success : function(data) { //서버가 보낸 data
																					data = JSON.parse(data);
																					console.log(data.result);
																					
																					$('#sale_maket').empty();
																					$('#sale_maket').append("<option>선택하세요</option>");
																					for(var key in data.result){
																						$('#sale_maket').append("<option>"+data.result[key].name+"</option>");
																					}
																					$('#sale_maket').change(function() {
																						$('#sale_maket_code').empty();
																						var _sale_maket =$("#sale_maket option:selected").val();	
																						
																						for(var key in data.result){
																							if(_sale_maket == data.result[key].name){
																								$('#sale_maket_code').append("<option>"+data.result[key].code+"</option>");
																								console.log($("#sale_maket_code option:selected").val());
																								
																								
																								/////얻은 도매코드로 정보 얻음
																								var form_data = {
																										date : $("#today_date").val(),
																										lcode : $("#large_code option:selected").val(),
																										mcode : $("#middle_code option:selected").val(),
																										scode : $("#small_code option:selected").val(),
																										ccode : $("#sale_maket_code option:selected").val()
																								};
																								$.ajax({
																									type : "POST",
																									url : 'auction_farmApi2.five',
																									data : form_data,
																									//datatype : "json",
																									success : function(data) { //서버가 보낸 data
																										data = JSON.parse(data);
																										console.log(data);
																										console.log(data.totalcount);
																										
																										/////////////////도매장소에 따른 정보
																											$('#result_table').empty();
																											
																												
																												$('#result_table').append(
																														"<td align='center'>경매시간</td>"+
																														"<td align='center'>도매법인</td>"+
																														"<td align='center'>도매시장</td>"+
																														"<td align='center'>품목</td>"+
																														"<td align='center'>경락단가</td>"+
																														"<td align='center'>산지</td>"+
																														"<td align='center'>품종</td>"+
																														"<td align='center'>거래량</td>"+
																														"<td align='center'>규격</td>");
																											
																											for (var i = 0; i < data.totalcount; i++) {
																												$('#result_table').append("<tr id="+i+"></tr>")
																												if(data.totalcount==1){
																													for ( var _result in data.result) {
																														//console.log(data.result[i][_result]+"/"+i);
																														$('#' + i).append(
																																"<td align='center'>" + data.result[_result]
																																		+ "</td>");
																													}
																												}	
																													for ( var _result in data.result[i]) {
																														//console.log(data.result[i][_result]+"/"+i);
																														$('#' + i).append(
																																"<td align='center'>" + data.result[i][_result]
																																		+ "</td>");
																													}
																											}
																											
																											
																										
																									}
																									
																								});
																								
																							}
																						}
																						
																					});
																					
																				}
																								
																			
																			
																			
																			});
																			
																			////////////////
																		}
																	}
																});
																
															}
														
														});
														
														
													}
												}
											});
											
										}
									
									});
							}
						}
					});

				}
			});
			
	
	
	
	
	
	});
	
	
	
<%
	Date d = new Date();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	System.out.println("현재날짜 : "+ sdf.format(d));
	
	String dateToday=sdf.format(d); 
	System.out.println(dateToday);
%>	
</script> 
</head>


	<!-- Section: services -->
    <section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>경매정보</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>카테고리를 선택하시면 그에 따른 경매정보를 보여줍니다</p>
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
							<td style="display: none">현재날짜 <input type="text" id="today_date"
								value="<%=dateToday%>">
							</td>
						</tr>
					</table>
				
				<hr>
				<table id="table" class="table table-striped">
					<tr>
						<td>대분류 <select id="large">
								<option>선택하세요</option>
						</select>
						</td>
						<td style="display: none">대분류코드 <select id="large_code">

						</select>
						</td>

						<td>중분류 <select id="middle">
								<option>선택하세요</option>
						</select>
						</td>
						<td style="display: none">중분류코드 <select id="middle_code">

						</select>
						</td>

						<td>소분류 <select id="small">
								<option>선택하세요</option>
						</select>
						</td>
						<td style="display: none">소분류코드 <select id="small_code">

						</select>
						</td>

						<td>도매상 <select id="sale_maket">
								<option>선택하세요</option>
						</select>
						</td>
						<td style="display: none">소분류코드 <select id="sale_maket_code">

						</select>
						</td>
					</tr>

				</table>
				<table id="result_table" class="table table-striped">

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
	

</html>