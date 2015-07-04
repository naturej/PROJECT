<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>
<script>
	function openForm(){
		window.open('searchForm.five','찾기','width=430 height=490');
	}
	$(function(){
		$('#dialog').dialog();
	});
</script>
    <!-- Section: contact -->
    <section id="contact" class="home-section text-center" style="position:static;">
    	<div class="boxed-grey">
			<c:if test="${param.error != null}">
			<div id="dialog" title="로그인실패">
				 <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
				 	<c:set value="${SPRING_SECURITY_LAST_EXCEPTION.message}" var="fail"/>
				 	<c:choose>
				 		<c:when test="${fail eq 'User is disabled' }">
				 			정지된 계정입니다.
				 		</c:when>
				 		<c:when test="${fail eq 'Bad credentials' }">
				 			잘못된 자격 증명입니다.
				 		</c:when>
				 		<c:when test="${fail eq 'Could not get JDBC Connection; nested exception is java.sql.SQLRecoverableException: IO 오류: The Network Adapter could not establish the connection' }">
				 			데이터베이스 오류; 네트워크 연결이 없습니다.
				 		</c:when>
				 		<c:otherwise>
				 			reason : ${fail}
				 		</c:otherwise>
				 	</c:choose>
				 </c:if>
			</div>
			</c:if>
			<c:url value="/j_spring_security_check" var="loginURL"/>
			<form method="post" action="${loginURL}">
				<div class="row" align="center" style="height:294px">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="j_username">ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input type="text" class="form-control" name="j_username" placeholder="Enter id" required /></div>
                        </div>
                        <div class="form-group">
                            <label for="j_password">PWD</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-link"></span>
                                </span>
                                <input type="password" class="form-control" name="j_password" placeholder="Enter password" required /></div>
                        </div>
                    </div>
                    <div class="col-md-4  col-lg-9">
                    	<a href="#" onclick="openForm()"><button type="button" class="btn btn-skin">ID/PWD 찾기</button></a>
                        <a href="joinSelect.five"><button type="button" class="btn btn-skin pull-right">회원가입</button></a>
                        <button type="submit" class="btn btn-skin pull-right">
                            Login</button>
                    </div>
                </div>
			</form>
		</div>
	</section>
