<%@page import="java.util.Locale"%>
<%@page import="org.springframework.format.datetime.DateFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.co.ohdeokrionline.model.vo.ScheduleRecord_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%
	List<ScheduleRecord_DTO> list = (List<ScheduleRecord_DTO>)request.getAttribute("list");
	String user_id = (String)request.getAttribute("user_id");
	DateFormatter df = new DateFormatter("yyyy-MM-dd");
	String date = df.print(new Date(), Locale.KOREAN);
	System.out.println(date);
%>
<!DOCTYPE html>
	<!-- jQuery UI -->
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>

	<!-- fullcalendar-2.3.2 -->
	<link href='<%=request.getContextPath()%>/js/fullcalendar-2.3.2/fullcalendar.css' rel='stylesheet' />
	<link href='<%=request.getContextPath()%>/js/fullcalendar-2.3.2/fullcalendar.print.css' rel='stylesheet' media='print' />
	<script src='<%=request.getContextPath()%>/js/fullcalendar-2.3.2/lib/moment.min.js'></script>
	<%-- <script src='<%=request.getContextPath()%>/js/fullcalendar-2.3.2/lib/jquery.min.js'></script> --%>
	<script src='<%=request.getContextPath()%>/js/fullcalendar-2.3.2/fullcalendar.js'></script>
	<script>
	
		$(document).ready(function() {
			var list = <%=list%>;
			
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				defaultDate: '<%=date%>',
				editable: true,
				eventLimit: true, // allow "more" link when too many events
				events: list
			});
			$('#agenda.fc-content').click(function(){
				console.log($(this));
				$('#dialog').dialog();
			});
		});
	
	</script>
	<style>
		#calendar {
			margin: 100px auto;
			max-width: 900px;
		}
	
	</style>
<section id="contact" class="home-section text-center" style="position:static">
	<div id='calendar' ></div>
	<div id="dialog">
		<form method="post" action="">
			<div class="row">
				<div class="col-md-6 col-lg-12">
					<div class="form-group">
						<label for="email">TITLE</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-envelope"></span> 
							</span> <input type="text" class="form-control" name="title" id="title"/>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-6 col-lg-12">
					<div class="form-group">
						<label for="user_id">WRITER</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
							<input type="text" class="form-control" name="user_id" id="user_id"/>
						</div>
					</div>
					<div class="form-group">
						<label for="pro_name">CROP</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span> </span>
							<input type="text" class="form-control" name="pro_name" id="pro_name"/>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
