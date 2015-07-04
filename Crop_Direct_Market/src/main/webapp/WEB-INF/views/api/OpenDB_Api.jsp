<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function kkk(i){
	console.log($("#page_Num option:selected").val()*i);
	$('#_snum').val($("#page_Num option:selected").val()*(i-1)+1);
	$('#_enum').val($("#page_Num option:selected").val()*(i-1)+$("#page_Num option:selected").val()*1);
	console.log("시작:"+$('#_snum').val()*1);
	console.log("끝:"+$('#_enum').val()*1);
	
	var form_data = {
			category : $("#category option:selected").val(),
			searchname : $("#searchname").val(),
			_snum : $('#_snum').val(),
			_enum : $('#_enum').val(),
		};
	
	$.ajax({
		type : "POST",
		url : 'OpenDB_Api.five',
		data : form_data,
		//datatype : "json",
		success : function(data) { //서버가 보낸 data
			
			data = JSON.parse(data);
			console.log(data);

			
			var totalcount = data.totalcount; // 총 게시글 수
			var page_num=$("#page_Num option:selected").val(); // 한 화면에 보여줄 게시글 수
			var page_count;
			if((totalcount%page_num)/page_num !=0){
				page_count= parseInt(totalcount/page_num)+1;
			}else{
				page_count= parseInt(totalcount/page_num);
			}
			console.log(page_count);
			
			var block_page = parseInt($("#page_Num option:selected").val());
			console.log(block_page);
			
			var start_page =$('#_snum').val()*1;  
			var end_page = $('#_enum').val()*1;
		
			
			$('#div').empty();
			for(i=1; i<data.totalcount+1; i++){
				
				if(i>=parseInt(start_page/page_num-1) && i<=parseInt(start_page/page_num+3) && i>=1 && i<=page_count){ 
					console.log(i);
					$('#div').append("<a href='#' id='div"+i+"' onclick='kkk("+i+")'>["+i+"]</a>"
							);
				}
				
			} 
			
			$('#table').empty();
			if(data.totalcount ==0){
				console.log("ddddddd");
				$('#div').append(
						"검색값없음");
			}
			for(i=0; i<data.totalcount; i++){
				
				$('#table').append(
						"<tr id='tr"+i+"'></tr>");
			}
			for(i=0; i<data.totalcount; i++){
				  if(data.totalcount==1){
						$('#tr'+i).append(
								"<td style='width: 10%'>" + data.result.classname + "</td>");
						
						$('#tr'+i).append(
								"<td style='width: 12%'>" + data.result.subject + "</td>");
						
						$('#tr'+i).append(
								"<td style='width: 10%'><img alt='' width='100%' height='auto' src='"+data.result.summaryimg+"'></td>");
						
						$('#tr'+i).append(
								"<td style='width: 68%'>" + data.result.summary + "</td>");
						
					}else{
						
						$('#tr'+i).append(
								"<td style='width: 10%'>" + data.result[i].classname + "</td>");
						
						$('#tr'+i).append(
								"<td style='width: 12%'>" + data.result[i].subject + "</td>");
						
						$('#tr'+i).append(
								"<td style='width: 10%'><img alt='' width='100%' height='auto' src='"+data.result[i].summaryimg+"'></td>");
						
						$('#tr'+i).append(
								"<td style='width: 68%'>" + data.result[i].summary + "</td>");
					}
			}
			
			
			
		}
	});
}

	$(function() {
		//툴팁
		$('#searchname').tooltip({title: "검색어 입력 후 돋보기를 누르세요", html: true,placement: "top"}); 
	
		
		$('#buttonprice').click(function() {
				
				var page_num=$("#page_Num option:selected").val();
				
				var form_data = {
					category : $("#category option:selected").val(),
					searchname : $("#searchname").val(),
					_snum : page_num-page_num+1,
					_enum : page_num,
				};
				$('#_snum').val(form_data._snum);
				$('#_enum').val(form_data._enum);
 
				$.ajax({
					type : "POST",
					url : 'OpenDB_Api.five',
					data : form_data,
					//datatype : "json",
					success : function(data) { //서버가 보낸 data
						
						data = JSON.parse(data);
						console.log(data);
				
						
					    var totalcount = data.totalcount; // 총 게시글 수
						var page_num=$("#page_Num option:selected").val(); // 한 화면에 보여줄 게시글 수
						var page_count;
						if((totalcount%page_num)/page_num !=0){
							page_count= parseInt(totalcount/page_num)+1;
						}else{
							page_count= parseInt(totalcount/page_num);
						}
						console.log(page_count);
						
						
						
						var block_page = parseInt($("#page_Num option:selected").val());
						console.log(block_page);
						
						var start_page = form_data._snum*1;
						var end_page = form_data._enum*1;
						console.log(end_page);
						
						$('#div').empty();
						for(i=1; i<page_count+1; i++){
							if(i>=1 && i<=5 && i>=1 && i<=page_count){ 
								console.log(i);
								$('#div').append("<a href='#' id='div"+i+"' onclick='kkk("+i+")'>["+i+"]</a>"
										);
							}
							
						} 
						

						
						$('#table').empty();
						if(data.totalcount ==0){
							console.log("ddddddd");
							$('#div').append(
									"검색값없음");
						}
						for(i=0; i<data.totalcount; i++){
							
							$('#table').append(
									"<tr id='tr"+i+"'></tr>");
						}
						for(i=0; i<data.totalcount; i++){
						  if(data.totalcount==1){
								$('#tr'+i).append(
										"<td style='width: 10%'>" + data.result.classname + "</td>");
								
								$('#tr'+i).append(
										"<td style='width: 12%'>" + data.result.subject + "</td>");
								
								$('#tr'+i).append(
										"<td style='width: 10%'><img alt='' width='100%' height='auto' src='"+data.result.summaryimg+"'></td>");
								
								$('#tr'+i).append(
										"<td style='width: 68%'>" + data.result.summary + "</td>");
								
							}else{
								
								$('#tr'+i).append(
										"<td style='width: 10%'>" + data.result[i].classname + "</td>");
								
								$('#tr'+i).append(
										"<td style='width: 12%'>" + data.result[i].subject + "</td>");
								
								$('#tr'+i).append(
										"<td style='width: 10%'><img alt='' width='100%' height='auto' src='"+data.result[i].summaryimg+"'></td>");
								
								$('#tr'+i).append(
										"<td style='width: 68%'>" + data.result[i].summary + "</td>");
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
					<h2>오픈백과</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>카테고리를 선택하시면 그에 따른 정보를 보여줍니다</p>
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
							<td>카테고리 <span>&nbsp</span>
								<select id="category" class="btn btn-default btn-xs">
									<option>선택</option>
									<option value="110">농가경영/경영체</option>
									<option value="111">유통/무역</option>
									<option value="112">가공/유통/경영 용어사전</option>
									<option value="113">관광휴양</option>
									<option value="114">산악/레저</option>
									<option value="115">체험/축제/행사</option>
									<option value="116">관광/휴양/레저 용어사전</option>
									<option value="117">기관/협회/단체</option>
									<option value="118">생활/문화</option>
									<option value="119">영농기반</option>
									<option value="120">인물/교육</option>
									<option value="121">정책/법령/민원</option>
									<option value="122">농림일반 용어사전</option>
									<option value="123">산림기계/장비</option>
									<option value="124">산림조성/보호</option>
									<option value="125">임산물/나무</option>
									<option value="126">산림자원 용어사전</option>
									<option value="127">곤충자원</option>
									<option value="128">균류자원</option>
									<option value="129">식물자원</option>
									<option value="130">생물자원 용어사전</option>
									<option value="131">농기자재/비료</option>
									<option value="132">병해충/잡초</option>
									<option value="133">작물재배</option>
									<option value="134">종자/육묘</option>
									<option value="135">작물농업 용어사전</option>
									<option value="136">가축 품종/사육</option>
									<option value="137">구제역</option>
									<option value="138">질병/약품</option>
									<option value="139">축산/사육 용어사전</option>
									<option value="140">국제농업협상</option>
									<option value="141">북한농업</option>
									<option value="142">해외국가농업</option>
									<option value="143">해외농업동향</option>
									<option value="144">해외/북한농업 용어사전</option>
							</select>
							<span>&nbsp</span>
							</td>
	
							<td> <span>&nbsp</span><span>&nbsp</span><span>&nbsp</span><span>&nbsp</span>
								<input type="text" id="searchname" class="btn btn-default btn-xs">
							</td>


							<td ><input type="hidden" id="_snum" value="1"
								readonly="readonly"></td>
							<td><input type="hidden" id="_enum" value="5"
								readonly="readonly"></td>
								
							<td><span>&nbsp</span>
								<span  id="buttonprice" class="btn btn-default btn-xs" style="border-style: none"><span class="glyphicon glyphicon-search"></span></span>
								<span>&nbsp</span>
							</td>
							
							<span style="float: right;">페이지 단위<span>&nbsp</span>
							   <select id="page_Num" class="btn btn-default btn-xs">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
								</select>
							<span>
						</tr>
					</table>
		
				<hr>
				<table id="table" class="table table-striped"  style="text-align:left;">

				</table>
				<br>
				<div id="div"></div>


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