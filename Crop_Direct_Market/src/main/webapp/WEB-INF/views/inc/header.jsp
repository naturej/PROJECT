<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dropdown.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/css/dropdown.js"></script>

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
				<li><a href="<%=request.getContextPath()%>/salesboard/salboardlist.five">SALESBOARD</a></li>
				<li><a href="<%=request.getContextPath()%>/marketlist.five">MARKET</a></li>

				<li class="dropdown">
					<dt id="one-ddheader" onmouseover="ddMenu('one',1)"
						onmouseout="ddMenu('one',-1)">
						<a style="padding: 15px;">API<b class="caret"></b></a>
					</dt>
					<dd id="one-ddcontent" onmouseover="cancelHide('one')"
						onmouseout="ddMenu('one',-1)">
						<ul style="background: #99DDD0; width: 120px;">
							<li><a href="<%=request.getContextPath()%>/api/searchPriceApi.five">시세정보</a></li>
							<li><a href="<%=request.getContextPath()%>/api/auction_farmApi.five">경매정보</a></li>
							<li><a href="<%=request.getContextPath()%>/api/MiddleTemperatureApi.five">중기날씨조회</a></li>
							<li><a href="<%=request.getContextPath()%>/api/RealTime_Forecast_Api.five">실시간동네조회</a></li>
							<li><a href="<%=request.getContextPath()%>/api/OpenDB_Api.five">오픈백과</a></li>
						</ul>
					</dd>
					<li class="dropdown">
             	<a href="#" class="dropdown-toggle" data-toggle="dropdown">농장관리<b class="caret"></b></a>
            	<ul class="dropdown-menu">
                	<li><a href="<%=request.getContextPath()%>/farmmanage/daecha.five">새 대차대조표</a></li>
                	<li><a href="<%=request.getContextPath()%>/farmmanage/daechaStatics.five">대차대조표 확인</a></li>
                </ul>
				</li>


				<li class="dropdown">
					<dt id="two-ddheader" onmouseover="ddMenu('two',1)"
						onmouseout="ddMenu('two',-1)">
						<a style="padding: 15px;">MYPAGE<b class="caret"></b></a>
					</dt>
					<dd id="two-ddcontent" onmouseover="cancelHide('two')"
						onmouseout="ddMenu('two',-1)">

						<ul style="background: #99DDD0; width: 120px;">
							<li><a href="<%=request.getContextPath()%>/mypage/schedule.five">일정</a></li>
							<li><a href="<%=request.getContextPath()%>/manage/sellermanage.five">판매관리</a></li>
							<li><a href="<%=request.getContextPath()%>/salesboard/shopList.five">장바구니목록</a></li>
							<se:authorize ifAllGranted="ROLE_SELLER">
								<li><a href="<%=request.getContextPath()%>/salesboard/enulistRec.five">에누리목록</a></li>
							</se:authorize>
							<se:authorize ifAllGranted="ROLE_CONSUMER">
								<li><a href="<%=request.getContextPath()%>/salesboard/enulistSend.five">에누리목록</a></li>
							</se:authorize>
							<li><a href="<%=request.getContextPath()%>/salesboard/receiveList.five">받은메세지목록</a></li>
							<li><a href="<%=request.getContextPath()%>/salesboard/sendList.five">보낸메세지목록</a></li>
							<li><a href="<%=request.getContextPath()%>/manage/ordermanage.five">주문관리</a></li>
						</ul>
					</dd>
				</li>

				<se:authorize ifNotGranted="ROLE_SELLER,ROLE_CONSUMER,ROLE_ADMIN">
					<li><a href="<%=request.getContextPath()%>/login.five">LOGIN</a></li>
				</se:authorize>
				<se:authentication property="name" var="LogingUser" />
				<se:authorize ifAnyGranted="ROLE_CONSUMER,ROLE_ADMIN,ROLE_SELLER">
					<li><a href="<c:url value='/j_spring_security_logout' />">(${LogingUser}
							님)LOGOUT</a></li>
				</se:authorize>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>