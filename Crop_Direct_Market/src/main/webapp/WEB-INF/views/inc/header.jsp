<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(function(){
	if($('#rec_userid').val()!=null){
   	$.ajax({
			url:'<%=request.getContextPath()%>/salesboard/messagecount.five',
			data:{rec_userid:$('#rec_userid').val()},
			dataType:"html",
			success : function(data){
				var count = JSON.parse(data);
				$('#mes').html(count);
	        }
		});
	$.ajax({
		url:'<%=request.getContextPath()%>/manage/newordercount.five',
		data:{user_id:$('#rec_userid').val()},
		dataType:"html",
		success : function(data){
			var neworder = JSON.parse(data);
			$('#order').html(neworder);
       	 	}
		});
	$.ajax({
		url:'<%=request.getContextPath()%>/salesboard/shopbagcount.five',
		data:{user_id:$('#rec_userid').val()},
		dataType:"html",
		success : function(data){
			var shopcount = JSON.parse(data);
			$('#shopbag').html(shopcount);
     		   }
		});	
	}
});

</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dropdown.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/css/dropdown.js"></script>
<style>
#log {
	border: 1px solid #28c3ab;
    outline: 0;
    color: #28c3ab;
    background-color: #ffffff;
    padding: 6px;
    font-size: 12px;
    border-radius : 5px;
}

#log:hover {
	border: 1px solid #28c3ab;
    outline: 0;
    color: #28c3ab;
    background-color: #EEEEEE;
    padding: 6px;
    font-size: 12px;
    border-radius : 5px;
}
</style>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color: #1ABC9C">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/index.five">
				<img src="<%=request.getContextPath()%>/img/logo.png" alt="Hornet" />
			</a>
		</div>

		<!-- Nav Bar -->
		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav" style="background-color: #1ABC9C">
				<li><a href="<%=request.getContextPath()%>/board/boardlist.five">BOARD</a></li>

				<li class="dropdown">
					<dt id="three-ddheader" onmouseover="ddMenu('three',1)"	onmouseout="ddMenu('three',-1)">
						<a style="padding: 15px;">MARKET<b class="caret"></b></a>
					</dt>
					<dd id="three-ddcontent" onmouseover="cancelHide('three')" onmouseout="ddMenu('three',-1)">
						<ul style="background: white; width: 120px;">
							<li><a href="<%=request.getContextPath()%>/salesboard/salboardlist.five">OnlinMarket</a></li>
							<li><a href="<%=request.getContextPath()%>/marketlist.five">OfflineMarket</a></li>
							<li><a href="<%=request.getContextPath()%>/freemboard/freemboardlist.five">Free Share</a></li>
						</ul>
					</dd>
				</li>
				
				<li class="dropdown">
					<dt id="one-ddheader" onmouseover="ddMenu('one',1)"
						onmouseout="ddMenu('one',-1)">
						<a style="padding: 15px;">API<b class="caret"></b></a>
					</dt>
					<dd id="one-ddcontent" onmouseover="cancelHide('one')"
						onmouseout="ddMenu('one',-1)">
						<ul style="background: white; width: 120px;">
							<li><a href="<%=request.getContextPath()%>/searchPriceApi.five">시세정보</a></li>
							<li><a href="<%=request.getContextPath()%>/auction_farmApi.five">경매정보</a></li>
							<li><a href="<%=request.getContextPath()%>/MiddleTemperatureApi.five">중기날씨조회</a></li>
							<li><a href="<%=request.getContextPath()%>/RealTime_Forecast_Api.five">실시간동네조회</a></li>
							<li><a href="<%=request.getContextPath()%>/OpenDB_Api.five">오픈백과</a></li>
							<li><a href="<%=request.getContextPath()%>/pre_sheet.five">견적서</a></li>
						</ul>
					</dd>
				</li>
				
				<se:authorize ifAllGranted="ROLE_SELLER">
				<li class="dropdown">
					<dt id="four-ddheader" onmouseover="ddMenu('four',1)"
						onmouseout="ddMenu('four',-1)">
						<a style="padding: 15px;">농장관리<b class="caret"></b></a>
					</dt>
					<dd id="four-ddcontent" onmouseover="cancelHide('four')"
						onmouseout="ddMenu('four',-1)">
						<ul style="background: white; width: 120px;">
							<li><a href="<%=request.getContextPath()%>/farmmanage/daecha.five">당기 손익계산서</a></li>
                			<li><a href="<%=request.getContextPath()%>/farmmanage/daechaStatics.five">매출기록 확인</a></li>
						</ul>
					</dd> 
				</li>
				</se:authorize>
				
				<li class="dropdown">
					<dt id="two-ddheader" onmouseover="ddMenu('two',1)"
						onmouseout="ddMenu('two',-1)">
						<a style="padding: 15px;">MYPAGE<b class="caret"></b></a>
					</dt>
					<dd id="two-ddcontent" onmouseover="cancelHide('two')"
						onmouseout="ddMenu('two',-1)">

						<ul style="background: white; width: 120px;">
							<li><a href="<%=request.getContextPath()%>/mypage/schedule2.five">일정</a></li>
							<se:authorize ifAllGranted="ROLE_SELLER">
								<li><a href="<%=request.getContextPath()%>/manage/sellermanage.five">판매관리</a></li>
								<li><a href="<%=request.getContextPath()%>/salesboard/enulistRec.five">에누리목록</a></li>
								<li><a href="<%=request.getContextPath()%>/manage/dirmlist.five">직거래 신청목록</a></li>
							</se:authorize>
							<se:authorize ifAllGranted="ROLE_CONSUMER">
								<li><a href="<%=request.getContextPath()%>/salesboard/shopList.five">장바구니목록</a></li>
								<li><a href="<%=request.getContextPath()%>/salesboard/enulistSend.five">에누리목록</a></li>
								<li><a href="<%=request.getContextPath()%>/manage/ordermanage.five">주문관리</a></li>
							</se:authorize>
							<li><a href="<%=request.getContextPath()%>/salesboard/receiveList.five">받은메세지목록</a></li>
							<li><a href="<%=request.getContextPath()%>/salesboard/sendList.five">보낸메세지목록</a></li>
							<li><a href="<%=request.getContextPath()%>/mypage/userInfo.five">회원정보</a></li>
							<se:authorize ifAllGranted="ROLE_ADMIN">
								<li><a href="<%=request.getContextPath()%>/admin/memberManage.five">회원관리</a></li>
								<li><a href="<%=request.getContextPath()%>/salesboard/reportList.five">신고목록</a></li>
							</se:authorize>
						</ul>
					</dd>
				</li>
				
				<!-- 메세지, 장바구니, 새로운 주문목록 -->
				<se:authorize ifAnyGranted="ROLE_SELLER,ROLE_CONSUMER,ROLE_ADMIN">
				<li>
				<a href="<%=request.getContextPath()%>/salesboard/receiveList.five">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success" id="mes" style="background-color: #1ABC9C; font-size:inherit;"></span>
                </a>
                </li>
                </se:authorize>
                
              	<se:authorize ifAnyGranted="ROLE_SELLER">
				<li>
				<a href="<%=request.getContextPath()%>/manage/sellermanage.five">
                                <i class="fa fa-bell"></i>
                                <span class="label label-success" style="background-color: #1ABC9C; font-size:inherit;" id="order"></span>
                </a>
                </li>
                </se:authorize>  
                
                 	<se:authorize ifAnyGranted="ROLE_CONSUMER">
				<li>
				<a href="<%=request.getContextPath()%>/salesboard/shopList.five">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="label label-success" id="shopbag" style="background-color: #1ABC9C; font-size:inherit;"></span>
                </a>
                </li>
                </se:authorize>
                
                <!--  메세지, 장바구니, 새로운 주문목록 끝 -->

				<se:authorize ifNotGranted="ROLE_SELLER,ROLE_CONSUMER,ROLE_ADMIN">
					<li><a href="<%=request.getContextPath()%>/login.five">LOGIN</a></li>
				</se:authorize>
				<se:authentication property="name" var="LoginUser" />
				<se:authorize ifAnyGranted="ROLE_CONSUMER,ROLE_ADMIN,ROLE_SELLER">
				<input type="hidden" value="${LoginUser}" id="rec_userid">
					<li><a href="<c:url value='/j_spring_security_logout' />">${LoginUser}님 <span id="log">LOGOUT</span></a></li>
				</se:authorize>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>