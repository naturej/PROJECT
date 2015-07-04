<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
	//중기예보
	$(function() {

		var form_data = {
			stnId : $("#stnId").val(),
			tmFc : $("#tmFc").val()
		};

		$.ajax({
			type : "POST",
			url : 'MiddleForecastApi.five',
			data : form_data,
			//datatype : "json",
			success : function(data) { //서버가 보낸 data

				data = JSON.parse(data);
				console.log(data);
				console.log(data.body.items.item.wfSv);

				$('#table1').empty();
				//console.log(data.title[_title]);
				$('#table1').append(
						"<td>" + data.body.items.item.wfSv + "</td>");

			}
		});

		$('#stnId').change(

				function() {
					var form_data = {
						stnId : $("#stnId").val(),
						tmFc : $("#tmFc").val()
					};

					$.ajax({
						type : "POST",
						url : 'MiddleForecastApi.five',
						data : form_data,
						//datatype : "json",
						success : function(data) { //서버가 보낸 data

							data = JSON.parse(data);
							console.log(data);
							console.log(data.body.items.item.wfSv);

							$('#table1').empty();
							//console.log(data.title[_title]);
							$('#table1').append(
									"<td>" + data.body.items.item.wfSv
											+ "</td>");

						}
					});

				});
	});

	//3일후 기온
	$(function() {

		var form_data = {
			regId : $("#regId").val(),
			tmFc : $("#tmFc").val()
		};

		$.ajax({
			type : "POST",
			url : 'MiddleTemperatureApi.five',
			data : form_data,
			//datatype : "json",
			success : function(data) { //서버가 보낸 data

				data = JSON.parse(data);
				console.log(data);
				console.log(data.body.items.item.length);

				$('#table').empty();
				var kkk = [ "예보구역코드", "3일후 예상최고기온(℃)", "4일후 예상최고기온(℃)",
						"5일후 예상최고기온(℃)", "6일후 예상최고기온(℃)", "7일후 예상최고기온(℃)",
						"8일후 예상최고기온(℃)", "9일후 예상최고기온(℃)", "10일후 예상최고기온(℃)",
						"3일후 예상최저기온(℃)", "4일후 예상최저기온(℃)", "5일후 예상최저기온(℃)",
						"6일후 예상최저기온(℃)", "7일후 예상최저기온(℃)", "8일후 예상최저기온(℃)",
						"9일후 예상최저기온(℃)", "10일후 예상최저기온(℃)" ]

				console.log(kkk[2]);
				console.log(kkk.length);

				$('#table').append("<tr id='tr'></tr>")
				for ( var _title in kkk) {

					$('#tr').append("<td>" + kkk[_title] + "</td>");
				}
				for ( var _title in data.body.items.item) {

					$('#table').append(
							"<td>" + data.body.items.item[_title] + "</td>");
				}
			}
		});

		$('#regId')
				.change(
						function() {
							var form_data = {
								regId : $("#regId").val(),
								tmFc : $("#tmFc").val()
							};

							$
									.ajax({
										type : "POST",
										url : 'MiddleTemperatureApi.five',
										data : form_data,
										//datatype : "json",
										success : function(data) { //서버가 보낸 data

											data = JSON.parse(data);
											console.log(data);
											console
													.log(data.body.items.item.length);

											$('#table').empty();
											var kkk = [ "예보구역코드",
													"3일후 예상최고기온(℃)",
													"4일후 예상최고기온(℃)",
													"5일후 예상최고기온(℃)",
													"6일후 예상최고기온(℃)",
													"7일후 예상최고기온(℃)",
													"8일후 예상최고기온(℃)",
													"9일후 예상최고기온(℃)",
													"10일후 예상최고기온(℃)",
													"3일후 예상최저기온(℃)",
													"4일후 예상최저기온(℃)",
													"5일후 예상최저기온(℃)",
													"6일후 예상최저기온(℃)",
													"7일후 예상최저기온(℃)",
													"8일후 예상최저기온(℃)",
													"9일후 예상최저기온(℃)",
													"10일후 예상최저기온(℃)" ]

											console.log(kkk[2]);
											console.log(kkk.length);

											$('#table').append(
													"<tr id='tr'></tr>")
											for ( var _title in kkk) {

												$('#tr').append(
														"<td>" + kkk[_title]
																+ "</td>");
											}
											for ( var _title in data.body.items.item) {

												$('#table')
														.append(
																"<td>"
																		+ data.body.items.item[_title]
																		+ "</td>");
											}
										}
									});

						});
	});

	///3일 맑음	
	$(function() {

		var form_data = {
			regId : $("#_regId").val(),
			tmFc : $("#tmFc").val()
		};

		$.ajax({
			type : "POST",
			url : 'MiddleLandWeatherApi.five',
			data : form_data,
			//datatype : "json",
			success : function(data) { //서버가 보낸 data

				data = JSON.parse(data);
				console.log(data);

				$('#table2').empty();

				var kkk = [ "지역코드", "3일후 오전", "3일후 오후", "4일후 오전", "4일후 오후",
						"5일후 오전", "5일후 오후", "6일후 오전", "6일후 오후", "7일후 오전",
						"7일후 오후", "8일후", "9일후", "10일후" ]

				$('#table2').append("<tr id='tr2'></tr>")
				for ( var _title in kkk) {
					$('#tr2').append("<td>" + kkk[_title] + "</td>");
				}
				for ( var _title in data.body.items.item) {
					$('#table2').append(
							"<td>" + data.body.items.item[_title] + "</td>");
				}
			}
		});

		$('#_regId')
				.change(
						function() {
							var form_data = {
								regId : $("#_regId").val(),
								tmFc : $("#tmFc").val()
							};
							$
									.ajax({
										type : "POST",
										url : 'MiddleLandWeatherApi.five',
										data : form_data,
										//datatype : "json",
										success : function(data) { //서버가 보낸 data

											data = JSON.parse(data);
											console.log(data);

											$('#table2').empty();

											var kkk = [ "지역코드", "3일후 오전",
													"3일후 오후", "4일후 오전",
													"4일후 오후", "5일후 오전",
													"5일후 오후", "6일후 오전",
													"6일후 오후", "7일후 오전",
													"7일후 오후", "8일후", "9일후",
													"10일후" ]

											$('#table2').append(
													"<tr id='tr2'></tr>")
											for ( var _title in kkk) {
												$('#tr2').append(
														"<td>" + kkk[_title]
																+ "</td>");
											}
											for ( var _title in data.body.items.item) {
												$('#table2')
														.append(
																"<td>"
																		+ data.body.items.item[_title]
																		+ "</td>");
											}
										}
									});

						});

	});
<%Date d = new Date();

			//String s = d.toString();
			//System.out.println("현재날짜 : "+ s);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			System.out.println("현재날짜 : " + sdf.format(d));

			String dateToday = sdf.format(d) + "0600"; //API 요청파라메터로 현재날짜와 06:00 or 18:00 발표시간이 필요 
														//즉 현재 2015년 6월 18일이라면 (201506180600 or 201506181800)이 입력되어야한다
			System.out.println(dateToday);%>
	
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
							<h2>중기 날씨 예보</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>3일 이후 부터의 날씨을 예보합니다</p>
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

				<!--////////////////////////////////////  -->

				<table>
					<tr>
						<td>예보지역 <span>&nbsp</span><select id="regId" class="btn btn-default btn-xs">
								<option value="11B10101" selected="selected">서울</option>
								<option value="11B20201">인천</option>
								<option value="11B20601">수원</option>
								<option value="11B20305">문산</option>
								<option value="11D10301">춘천</option>
								<option value="11D10401">원주</option>
								<option value="11D20501">강릉</option>
								<option value="11C20401">대전</option>
								<option value="11C20101">서산</option>
								<option value="11C10301">청주</option>
								<option value="11F20501">광주</option>
								<option value="11F20401">여수</option>
								<option value="11F10201">전주</option>
								<option value="21F20801">목포</option>
								<option value="11H20201">부산</option>
								<option value="11H20101">울산</option>
								<option value="11H20301">창원</option>
								<option value="11H10701">대구</option>
								<option value="11H10501">안동</option>
								<option value="11G00201">제주</option>
								<option value="11G00401">서귀포</option>
								<option value="11C20404">세종</option>
								<option value="11H10201">포항</option>
								<option value="21F10501">군산</option>
						</select>
						</td>
						<td style="display: none">발표시각 <select id="tmFc">
								<option value="<%=dateToday%>" selected="selected">현재</option>
						</select>
						</td>
					</tr>
				</table>
				<br>

				<table id="table" class="table table-striped">

				</table>
				<!-- 	//////////// /////////////////////////////-->
				<hr>
				<br>

				<table>
					<tr>
						<td>지점번호 <span>&nbsp</span><select id="stnId" class="btn btn-default btn-xs">
								<option value="105">강릉(강원도 포함)</option>
								<option value="108">전국</option>
								<option value="109">수도권(서울,경기,인천)</option>
								<option value="133">대전(세종,충청 도 포함)</option>
								<option value="156">광주(전라도 포함)</option>
								<option value="159">부산(대구,울산,경상도 포함)</option>
								<option value="184">제주</option>
						</select>
						</td>
					</tr>
				</table>
				<br>

				<table id="table1" class="table table-striped" style="text-align:left;">

				</table>
				<hr>
				<br>

				<!--  ///////////////////////////////////////////-->


				<table>
					<tr>
						<td>예보구역코드 <span>&nbsp</span><select id="_regId" class="btn btn-default btn-xs">
								<option value="11B00000">서울 인천경기도</option>
								<option value="11D10000">강원도영서</option>
								<option value="11D20000">강원도영동</option>
								<option value="11C20000">대전 세종 충청남도</option>
								<option value="11C10000">충청북도</option>
								<option value="11F20000">광주 전라남도</option>
								<option value="11F10000">전라북도</option>
								<option value="11H10000">대구 경상북도</option>
								<option value="11H20000">부산 울산 경상남도</option>

						</select>
						</td>


					</tr>
				</table>
				</br>

				<table id="table2" class="table table-striped">

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