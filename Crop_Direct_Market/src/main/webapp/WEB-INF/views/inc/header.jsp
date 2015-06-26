<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation"  style="background-color: #1ABC9C">
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
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
              <ul class="nav navbar-nav" style="background-color: #1ABC9C">
                <li><a href="<%=request.getContextPath()%>/board/boardlist.five">BOARD</a></li>
                <li><a href="<%=request.getContextPath()%>/salesboard/salboardlist.five">SALESBOARD</a></li>
                <li><a href="<%=request.getContextPath()%>/marketlist.five">MARKET</a></li>
                <li class="dropdown">
             	 <a href="#" class="dropdown-toggle" data-toggle="dropdown">API<b class="caret"></b></a>
            	  <ul class="dropdown-menu">
                <li><a href="searchPriceApi.five">시세정보</a></li>
                 <li><a href="auction_farmApi.five">경매정보</a></li>
                <li><a href="MiddleTemperatureApi.five">중기날씨조회</a></li>  
                <li><a href="RealTime_Forecast_Api.five">실시간동네조회</a></li>  
                 
              </ul>
           		</li>
           		    <li class="dropdown">
             	 <a href="#" class="dropdown-toggle" data-toggle="dropdown">MYPAGE<b class="caret"></b></a>
            	  <ul class="dropdown-menu">
                <li><a href="<%=request.getContextPath()%>/mypage/schedule.five">일정</a></li>
                <li><a href="<%=request.getContextPath()%>/salesboard/shopList.five">장바구니목록</a></li>
                <li><a href="<%=request.getContextPath()%>/salesboard/enulist.five">에누리목록</a></li>
                <li><a href="<%=request.getContextPath()%>/salesboard/receiveList.five">받은메세지목록</a></li>
                <li><a href="<%=request.getContextPath()%>/salesboard/sendList.five">보낸메세지목록</a></li>
                
                
              </ul>
              <li><a href="login.five">LOGIN</a></li>
              <li><a href="<c:url value='/j_spring_security_logout' />">LOGOUT</a></li>
              </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>