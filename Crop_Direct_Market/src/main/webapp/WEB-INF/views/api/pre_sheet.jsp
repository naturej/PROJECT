<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#table_sheet td{
 width: 150px;
 height: 30px;

}
#kkk input {
width: 70px;
}
#kkk td{
width: 100px;
height: 30px;
font-size: 12px;
vertical-align: middle;

}
#kkk th{
width: 80px;
text-align:center;
font-size: 12px;
}

</style>
<style>
  /* Tooltip */
  #min_tool + .tooltip > .tooltip-inner {
      background-color: white; 
      color: black; 
      border: 1px solid green; 
      padding: 15px;
      font-size: 20px;
  }
  /* Tooltip on top */
  #min_tool + .tooltip.top > .tooltip-arrow {
      border-top: 5px solid green;
  }
  /* Tooltip on bottom */
 #min_tool + .tooltip.bottom > .tooltip-arrow {
      border-bottom: 5px solid blue;
  }
  /* Tooltip on left */
 #min_tool+ .tooltip.left > .tooltip-arrow {
      border-left: 5px solid red;
  }
  /* Tooltip on right */
  #min_tool + .tooltip.right > .tooltip-arrow {
      border-right: 5px solid black;
  }
  </style>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <!-- 날씨위젯과 충돌 둘중에 하나만 있어도 되서 이거 주석 처리함 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>	 -->


<script type="text/javascript">

function mmm() {
	$("#div1").fadeIn(2000);
    if(div1.style.display=="block"){ 
    	div1.style.display = "none"; 
  	 }else{ 
  		div1.style.display = "block"; 
  	 }
}




var win=null;
function print(printThis)  
{
       win = window.open();
       self.focus();
       win.document.open();
       win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
       win.document.write('body, td {  text-align: center;font-family: Verdana; font-size: 10pt; width: 180px; height: 30px;}');
       win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
       win.document.write(printThis);
       win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
       win.document.close();
       win.print();
       win.close();
}
	  
$(function() {
	//툴팁////////////////////////////////
	 $('#min_tool').tooltip({title: "Hooray" , placement: "bottom"}); 
	/////////////////////////////////////
	
	
		console.log();
	
	
	
	//품종 리스트 
	$.ajax({
		url : 'api_slist.five',
		dataType : "html",
		success : function(data) { //서버가 보낸 data
			var data = JSON.parse(data);
			var options="<option>선택하세요</option>";
			console.log(data);
	        $.each(data, function(index,list){
	             options += "<option>"+list.pro_sep+"</option>";
	        });
	        $('#sep').html(options);
		},
		 error: function (xhr,Options,thrownError) {}
	});
	
	//품명 리스트
	$('#sep').on("change",function(){
		$('#pro_name_text').empty();
		$('#sep_text').html($('#sep').val());
		$('#sep_text1').html($('#sep').val());
		$.ajax({
			url: 'api_plist.five', 
			data:{pro_sep:$('#sep').val()},
			dataType:"html",
			success : function(data){
				var options = "<option>선택하세요</option>";
	            var data = JSON.parse(data);
				$.each(data,function(index,list){
					options += "<option>"+list.pro_name+"</option>";
			    });
				$('#pro_name').empty();
			    $('#pro_name').html(options);
			},
		     error: function (xhr,Options,thrownError) {}
		}); 
	});
	
	//품명선택시 품명을 집어넣음
	$('#pro_name').on("change",function(){
		$('#pro_name_text').html($('#pro_name').val());	
		$('#pro_name_text1').html($('#pro_name').val());
		$('#pro_name_text2').html($('#pro_name').val());	
	});
	
	//면적 리스트 
		var options = "<option>직접입력</option>";
		for(i=1; i<=10; i++){
			options += "<option>"+i*1000+"</option>";
		}
		
		$('#space').html(options);
	
	//면적 셀렉시 입력
	$('#space').on("change",function(){
		if($('#space').val()=="직접입력"){
			$('#input_space_text').show();
			$('#space_text').html($('#input_text').val());
			$('#space_text1').html($('#input_text').val()+"㎡");
			 $('#space_text2').html($('#input_text').val()+"㎡");
			 $('#space_text3').html($('#input_text').val()+"㎡");
		}else{
			$('#input_space_text').hide();
			$('#space_text').html($('#space').val());
			$('#space_text1').html($('#space').val()+"㎡");
			 $('#space_text2').html($('#space').val()+"㎡");
			 $('#space_text3').html($('#space').val()+"㎡");
		}
	});	 
	
	//면적 키 입력
	 $('#input_space_text').keyup(function(){
		 $('#space_text').html($('#input_space_text').val());
		 $('#space_text1').html($('#input_space_text').val()+"㎡");
		 $('#space_text2').html($('#input_space_text').val()+"㎡");
		 $('#space_text3').html($('#input_space_text').val()+"㎡");
	 });
	//임대가격입력
	 $('#input_rent_price').keyup(function(){
		 $('#input_rent_price_text').html($('#input_rent_price').val());
		 $('#input_rent_price_text1').html($('#input_rent_price').val()+"원");
		 
	 });
	
	//질소비료가격 입력
	 $('#input_mix_amount1').keyup(function(){
		 $('#input_mix_amount1_text').html($('#input_mix_amount1').val());
		 $('#input_mix_amount1_text1').html($('#input_mix_amount1').val()+"원");
	 });
	//질소비료살포 횟수
	 $('#input_mix_spray_count1').keyup(function(){
		 $('#input_mix_spray_count1_text').html($('#input_mix_spray_count1').val());
		 $('#input_mix_spray_count1_text1').html($('#input_mix_spray_count1').val()+"번");
	 });
	//요소비료가격 입력
	 $('#input_mix_amount2').keyup(function(){
		 $('#input_mix_amount2_text').html($('#input_mix_amount2').val());
		 $('#input_mix_amount2_text1').html($('#input_mix_amount2').val()+"원");
	 });
	
	//요소비료살포 횟수
	 $('#input_mix_spray_count2').keyup(function(){
		 $('#input_mix_spray_count2_text').html($('#input_mix_spray_count2').val());
		 $('#input_mix_spray_count2_text1').html($('#input_mix_spray_count2').val()+"번");
	 });
	
	//1인당고용비용
	 $('#input_emp_price').keyup(function(){
		 $('#input_emp_price_text').html($('#input_emp_price').val());
		 $('#input_emp_price_text1').html($('#input_emp_price').val()+"원");
	 });
	
	//총고용인수입력
	 $('#input_emp_total').keyup(function(){
		 $('#input_emp_total_text').html($('#input_emp_total').val());
		 $('#input_emp_total_text1').html($('#input_emp_total').val()+"명");		
	 });
	
	//기타비용입력
	 $('#etc_price').keyup(function(){
		 $('#etc_price_text').html($('#etc_price').val());		 	
		 $('#etc_price_text1').html(commify($('#etc_price').val())+"원");
	 });
	
	//예상수확량 입력
	$('#input_pre_amount').keyup(function(){
		 $('#input_pre_amount_text').html($('#input_pre_amount').val());		 	
		 $('#input_pre_amount_text1').html(commify($('#input_pre_amount').val())+"kg");
	 });
	
	//예상가격
	$('#input_pre_price').keyup(function(){
		 $('#input_pre_price_text').html($('#input_pre_price').val());		 	
		 $('#input_pre_price_text1').html(commify($('#input_pre_price').val())+"원");
	 });
	
	//비료량
	/* <무농약농산물 재배할 때 사용가능한 화학비료 계산 방법> 

  1. 재배포장 6,800㎡에 무농약농산물을 재배 할 때 사용할 수 있는 
      화학비료(질소)의 량 ? 
    (1,000㎡ 당 사용가능한 질소량이 6.3kg으로 제시됨) 
    - 계산과정 : 6800/1000 * 6.3 * 1/3 = 14.28 kg 
  2. 1의 경우 사용할 수 있는 요소비료(질소함량 46%)의 량 ? 
    - 계산과정 : 14.28 / 0.46 = 31.04 kg */
    $('#sheet_ok').click(function(){		
 		var amount =$('#space_text').html(); //면적
 		var price1 = $('#input_mix_amount1_text').html();//질소비료가격(kg당)
 		var price2 = $('#input_mix_amount2_text').html();//요소비료가격(kg당)
 		
 		var amount1 = amount/1000*6.3/3; //질소비료량
 		var amount2 = amount1/0.46; //요소비료량
 		//var amount3 = amount*419.58; //㎡ 당 419.58원 임대료
 		var rent_price = commify(amount*419.58);
 		var mix_price1 = commify((amount1*price1).toFixed(0));
 		var mix_price2 = commify((amount2*price2).toFixed(0));
 		$('#mix_amount1_text').html(amount1);
 		$('#mix_amount1_text1').html(amount1.toFixed(2)+"kg");
 		$('#mix_price1_text').html(mix_price1);
 		$('#mix_price1_text1').html(mix_price1+"원");
 		$('#mix_amount2_text').html(amount2);
 		$('#mix_amount2_text1').html(amount2.toFixed(2)+"kg");
 		$('#mix_price2_text').html(mix_price2);
 		$('#mix_price2_text1').html(mix_price2+"원");
 		$('#rent_text').html(rent_price);
 		
 		var mix_sum1= (amount1*price1)*$('#input_mix_spray_count1_text').html()*1;          
 		$('#mix_sum_text1').html(commify(mix_sum1.toFixed(0))+"원");
 		var mix_sum2= (amount2*price2)*$('#input_mix_spray_count2_text').html()*1;
 		$('#mix_sum_text2').html(commify(mix_sum2.toFixed(0))+"원");
 		
 		//총임대비
 		var rent_price= amount*$('#input_rent_price_text').html()*1
 		$('#rent_sum_text').html(commify(rent_price.toFixed(0))+"원");
 		
 		//총고용비
 		input_emp_total_text
 		var emp_sum=$('#input_emp_total_text').html()*$('#input_emp_price_text').html();
 		$('#emp_sum_text').html(commify(emp_sum.toFixed(0))+"원");
 		
 		//총지출비
 		var total_sum = mix_sum1 + mix_sum2 + rent_price+ emp_sum + $('#etc_price').val()*1;
 		$('#total_sum_text').html(commify(total_sum.toFixed(0))+"원");
 		
 		//1000m2 당 수익
 		var pre_income = $('#input_pre_price_text').html()*$('#input_pre_amount_text').html()/1000;
 		$('#pre_income_text').html(commify(pre_income.toFixed(0))+"원");
 		
 		//총 수익
 		var total_income=$('#input_pre_price_text').html()*$('#input_pre_amount_text').html()*(amount/1000);
 		$('#total_income_text').html(commify(total_income.toFixed(0))+"원");
 		$('#total_income_text1').html(commify(total_income.toFixed(0))+"원");
 		
 		//손익 계산
 		var cal_income=total_income-total_sum;
 		$('#cal_income_text').html(commify(cal_income.toFixed(0))+"원");
    });
    

 

	//천단위로,
    function commify(n) {
      var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
      n += '';                          // 숫자를 문자열로 변환

      while (reg.test(n))
        n = n.replace(reg, '$1' + ',' + '$2');

      return n;
    }
	
});

<%
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

	
	String _date=sdf.format(d);  
	
%>
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
					<h2>견적서</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>데이터를 입력하여 견적서를 출력할수 있습니다</p>
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
				
<!-- 견적서 데이터 입력 테이블  -->		
<div>
	<div style="width: 300px; margin-right: 35px; float: left">
	<table  class="table table-bordered"  id="kkk">	
		<tr>
			<th>품종</th>
			<td><select id="sep" style="border:none;" ></select></td>
			<td id="sep_text"></td>
		</tr>
		<tr>
			<th>품명</th>
			<td><select id="pro_name" style="border:none;"><option>선택하세요</option></select></td>
			<td id="pro_name_text"></td>
		</tr>
		<tr>
			<th>재배면적(㎡)	</th>
			<td><select id="space" style="border:none;"><option>직접입력</option></select>
				<input type='text' id='input_space_text' style="display: none"></td>	
			<td id="space_text"></td>
		</tr>
	</table>
	</div>	
	
	<div style="width: 250px; margin-right: 35px;  float: left">
	<table class="table table-bordered" id="kkk">
		<tr>
			<th>질소비료가격<br>(kg당)</th>
			<td><input type='text' id='input_mix_amount1' style="border:none;"></td>	
		</tr>
		<tr>
			<th>질소비료<br>살포횟수</th>
			<td><input type='text' id='input_mix_spray_count1' style="border:none;"></td>	
		</tr>
		<tr>
			<th>요소비료가격<br>(kg당)</th>
			<td><input type='text' id='input_mix_amount2' style="border:none;"></td>
		</tr>
		<tr>
			<th>요소비료<br>살포횟수</th>
			<td><input type='text' id='input_mix_spray_count2' style="border:none;" ></td>
		</tr>
	</table>
	</div>
	
	<div style="width: 250px; margin-right: 35px;  float: left" id="kkk">
	<table class="table table-bordered" >
		<tr>			
			<th>임대료<br>(㎡당)</th>
			<td><input type='text' id='input_rent_price' style="border:none;"></td>
		</tr>
		<tr>
			<th>1인당<br>고용비</th>
			<td><input type='text' id='input_emp_price' style="border:none;"></td>
		</tr>
		
		<tr>
			<th>총고용인수</th>
			<td><input type='text' id='input_emp_total' style="border:none;"></td>
		</tr>
		<tr>
			<th>기타비용</th>
			<td><input type='text' id='etc_price' style="border:none;"></td>
		</tr>
	</table>
	</div>
	
	
	<div style="width: 250px;  float: left" id="kkk">
	<table class="table table-bordered" >
		<tr>
			<th>kg당 수확물의<br>예상시세(원)</th>
			<td><input type='text' id='input_pre_price' style="border:none;"></td>
		</tr>
		
		<tr>
			<th>1000㎡ 당 <br>예상수확량(kg)</th>
			<td><input type='text' id='input_pre_amount' style="border:none;"></td>			
		<tr>
	</table>
	</div>
	<div>
	<table style='border-left:0;border-right:0;border-bottom:0;border-top:0; clear: both;'></table>
	

									
	<table style="display: none; ">	
		<tr>
			<td id="mix_amount1_text"></td>
			<td id="input_mix_amount1_text"></td>
			<td id="input_mix_spray_count1_text"></td>
			<td id="mix_price1_text"></td>
			<td id="mix_amount2_text"></td>
			<td id="input_mix_amount2_text"></td>
			<td id="input_mix_spray_count2_text"></td>
			<td id="mix_price2_text"></td>
			<td id="input_rent_price_text"></td>
			<td id="input_emp_price_text"></td>
			<td id="input_emp_total_text"></td>
			<td id="etc_price_text"></td>
			<td id="input_pre_amount_text"></td>
			<td id="input_pre_price_text"></td>
		</tr>
	</table>
	</div>
</div>
	
<br>
<span id="sheet_ok"  class="btn btn-default btn-xs"> <span class="glyphicon glyphicon-pencil"></span>&nbsp입력</span>
<hr>

<span  onclick="mmm()" class="btn btn-info" width="200px"><span class="glyphicon glyphicon-folder-open"></span>&nbsp 견적서</span>
&nbsp&nbsp&nbsp&nbsp&nbsp
<span class="btn btn-info"  onclick="javascript:print(document.getElementById('printarea').innerHTML)"><span class="glyphicon glyphicon-print"></span>&nbsp print</span>
 
 
<br>
<br>
<br>
<br>

<!-- 견적서 출력 양식  -->

<div id="printarea">	
<br>
<div id="div1" style="width: 800px; margin: 0 auto; display: none;" >
	<h2 data-toggle="tooltip" title="견적서라는것은 견적서다 우하하하하하">견  적  서</h2>
	<br>
	<hr>
	<!-- 1. 견적서 좌상단 품종,품목,재배면적 -->
	<div style="float: left; ">	
		<table id="table_sheet" border="1px" style="border-collapse:collapse;" >			
			<tr>
				<td>품종</td>
				<td id="sep_text1" ></td>
			</tr>
			<tr>
				<td>품목</td>
				<td id="pro_name_text1"></td>	
			</tr>
			<tr>
				<td>재배면적</td>
				<td id="space_text1"></td>
			</tr>
		</table>
	</div>

	<!--2. 견적서 우상단 날짜  -->
	<div style="float: right; ">
		<table id="table_sheet" border="1px" style="border-collapse:collapse;" >
			<tr>
				<td>날짜</td>
				<td><%=_date%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${user.user_name }</td>	
			</tr>
			<tr>
				<td>농장명</td>
				<td>${farm.farminfo }</td>	
			</tr>
			

		</table>	
	</div>
	<!--2. 견적서 내용  -->
<div style="clear: both;">
	<br>
	<p align="left" style="font-size: 10px">아래와 같이 견적합니다</p>
	<hr >	
	<table class="table table-striped" border="1px" style="border-collapse:collapse; " >
		<tr>
			<td colspan="7">지출</td>
		</tr>
		<tr>
			<td>구분</td>			
			<td>세부항목</td>
			<td>kg(1000㎡당)</td>
			<td>가격(kg당)</td>
			<td>비용</td>
			<td>횟수</td>
			<td>총비용</td>
		</tr>
		<tr>
			<td>1</td>
			<td>비료(질소)</td>
			<td id="mix_amount1_text1"></td>
			<td id="input_mix_amount1_text1"></td>
			<td id="mix_price1_text1"></td>
			<td id="input_mix_spray_count1_text1"></td>
			<td id="mix_sum_text1"></td>
		</tr>
		<tr>
			<td>2</td>
			<td>비료(요소)</td>
			<td id="mix_amount2_text1"></td>
			<td id="input_mix_amount2_text1"></td>
			<td id="mix_price2_text1"></td>
			<td id="input_mix_spray_count2_text1"></td>
			<td id="mix_sum_text2"></td>	
		</tr>
		<tr>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td>구분</td>			
			<td>세부항목</td>
			<td colspan="2" >㎡당 임대료</td>
			<td colspan="2">면적(㎡)</td>
			<td>총비용</td>
		</tr>
		<tr>
			<td>3</td>
			<td>임대료</td>
			<td colspan="2" id="input_rent_price_text1"></td>
			<td colspan="2" id="space_text2"></td>
			<td id="rent_sum_text"></td>	
		</tr>
		<tr>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td>구분</td>			
			<td>세부항목</td>
			<td colspan="2" >1인당고용비</td>
			<td colspan="2">총고용인수</td>
			<td>총비용</td>
		</tr>
		<tr>
			<td>4</td>
			<td>노동임대료</td>
			<td colspan="2" id="input_emp_price_text1"></td>
			<td colspan="2" id="input_emp_total_text1"></td>
			<td id="emp_sum_text"></td>	
		</tr>

		<tr>
			<td>5</td>
			<td>기타비용</td>
			<td colspan="4"></td>
			<td id="etc_price_text1"></td>	
		</tr>
		<tr>
			<td colspan="2">총합(지출)</td>
			<td colspan="5" id="total_sum_text"></td>				
		</tr>
		<tr>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td colspan="7">수입</td>
		</tr>
		<tr>
			<td>구분</td>			
			<td>세부항목</td>
			<td>1000㎡ 당 예상수확량(kg)</td>
			<td>재배면적</td>
			<td>kg당 예상시세</td>
			<td>㎡ 당 예상수입</td>
			<td>총수입</td>
		</tr>
		<tr>
			<td>1</td>			
			<td id="pro_name_text2"></td>
			<td id="input_pre_amount_text1"></td>
			<td id="space_text3"></td>
			<td id="input_pre_price_text1"></td>
			<td id="pre_income_text"></td>
			<td id="total_income_text"></td>
		</tr>
		<tr>
			<td colspan="2">총합(수입)</td>
			<td colspan="5" id="total_income_text1"></td>		
		</tr>
		<tr>
			<td colspan="7">예상손익</td>
		</tr>
		<tr>
			<td colspan="7" id="cal_income_text"></td>			
		</tr>
	
	</table>
</div>	
</div>

</div>






	
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