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
			list = <%=list%>;
			loginId = '<%=user_id%>';
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month'
				},
				defaultDate: '<%=date%>',
				selectable: true,
				selectHelper: true,
				select: function(start, end) {
					var title = prompt('Event Title:');
					if(title==null){return false;}
					$('#addstart').datepicker({
						  dateFormat: "yy-mm-dd"
					});
					$('#addend').datepicker({
						  dateFormat: "yy-mm-dd"
					});
					$('#addDialog').dialog({title:title});
					var eventData;
					/* if (title) {
						eventData = {
							title: title,
							start: start,
							end: end
						};
						$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
					} */
					$('#calendar').fullCalendar('unselect');
				},
				editable: true,
				eventLimit: true // allow "more" link when too many events
				//events: list
			});
			var eventData = list;
			$.each(list,function(idx,schedule){
				if(schedule.user_id=='admin'){
					schedule.color='#da3f3a';
				} else if(schedule.start==schedule.end){
					schedule.end='';
				}
				$('#calendar').fullCalendar('renderEvent', schedule, true);
			});
			
			
			$('#agenda.fc-content').click(function(){
				var title = $(this)[0].textContent.trim();
				$.each(list,function(idx,schedule){
					if(title==schedule.title){
						console.log(schedule);
						$('#end').val(schedule.end);
						$('#start').val(schedule.start);
						$('#user_id').val(schedule.user_id);
						$('#pro_name').val(schedule.pro_name);
						$('#content').val(schedule.content);
						$('#dialog').dialog({
							title:schedule.title
						});
					}
				});
				
			});
			// datepicker 적용
			$('#addstart').datepicker({
				  dateFormat: "yy-mm-dd"
			});
			$('#addend').datepicker({
				  dateFormat: "yy-mm-dd"
			});
			$('#editstart').datepicker({
				  dateFormat: "yy-mm-dd"
			});
			$('#editend').datepicker({
				  dateFormat: "yy-mm-dd"
			});
		});
		
		function add(){
			var title = $('.ui-dialog-title').text();
			var start = $('#addstart').val();
			var end = $('#addend').val();
			var user_id = $('#adduser_id').val();
			var pro_name = $('#addpro_name').val();
			var content = $('#addcontent').val();
			var eventData = {
				title: title,
				start: start,
				end: end,
				user_id: user_id,
				pro_name: pro_name,
				content: content
			};
			//$('#calendar').fullCalendar('renderEvent', eventData, true);
			
			$.ajax({
				type: "POST",
				url : "schedule2Add.five",
				data : eventData,
				success : function(data){
					if(data.length>0){
						location.href='schedule2.five';
					}else{
						alert('fail');
					}
				},
				error : function(xhr, status){
					alert(xhr + '/' + status); 
				}
			});
			$('#addDialog').dialog('close');
		}
		
		function editForm(){
			var title = $('.ui-dialog-title').text();
			var start = $('#addstart').val();
			var end = $('#addend').val();
			var user_id = $('#adduser_id').val();
			var pro_name = $('#addpro_name').val();
			var content = $('#addcontent').val();
			
			$('#editend').val(end);
			$('#editstart').val(start);
			$('#edituser_id').val(user_id);
			$('#editpro_name').val(pro_name);
			$('#editcontent').val(content);
			$('#dialog').dialog('close');
			$('#editDialog').dialog({
				title: title
			});
		}
		
		function edit(){
			var title = $('.ui-dialog-title').text();
			var end = $('#editend').val();
			var start = $('#editstart').val();
			var user_id = $('#edituser_id').val();
			var pro_name = $('#editpro_name').val();
			var content = $('#editcontent').val();
			
			var eventData = {
				title: title,
				start: start,
				end: end,
				user_id: user_id,
				pro_name: pro_name,
				content: content
			};
			
			$.ajax({
				type: "POST",
				url : "schedule2Edit.five",
				data : eventData,
				success : function(data){
					if(data.length>0){
						location.href='schedule2.five';
					}else{
						alert('fail');
					}
				},
				error : function(xhr, status){
					alert(xhr + '/' + status); 
				}
			});
			$('#editDialog').dialog('close');
		}
	</script>
	<style>
		#calendar {
			margin: 100px auto;
			max-width: 900px;
		}
	
	</style>
<section id="contact" class="home-section text-center" style="position:static">
	<div id='calendar' ></div>
	<div id="dialog" style="display:none">
		<form method="post" action="">
			<div class="row">
				<div class="col-md-6 col-lg-12">
					<div class="form-group">
						<label for="start">START</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-play"></span> 
							</span> <input type="text" class="form-control" name="start" id="start" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="end">END</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-stop"></span> 
							</span> <input type="text" class="form-control" name="end" id="end" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="user_id">WRITER</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
							<input type="text" class="form-control" name="user_id" id="user_id" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="pro_name">CROP</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-leaf"></span> </span>
							<input type="text" class="form-control" name="pro_name" id="pro_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="content">CONTENT</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-comment"></span> </span>
							<textarea class="form-control" name="content" id="content" readonly="readonly"></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-12">
					<button type="button" class="btn btn-skin pull-right" onclick="add()">
                            삭 제</button>
                    <button type="button" class="btn btn-skin pull-right" onclick="editForm()">
                            수 정</button>
				</div>
			</div>
		</form>
	</div>
	<div id="addDialog" style="display:none">
		<form method="post" action="">
			<div class="row">
				<div class="col-md-6 col-lg-12">
					<div class="form-group">
						<label for="start">START</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-play"></span> 
							</span> <input type="text" class="form-control" name="start" id="addstart" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="end">END</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-stop"></span> 
							</span> <input type="text" class="form-control" name="end" id="addend" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="user_id">WRITER</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
							<input type="text" class="form-control" name="user_id" id="adduser_id" value="${user_id}" readonly="readonly"/>
							
						</div>
					</div>
					<div class="form-group">
						<label for="pro_name">CROP</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-leaf"></span> </span>
							<input type="text" class="form-control" name="pro_name" id="addpro_name" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="content">CONTENT</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-comment"></span> </span>
							<textarea class="form-control" name="content" id="addcontent" required="required"></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-12">
					<button type="button" class="btn btn-skin pull-right" onclick="add()">
                            등 록</button>
				</div>
			</div>
		</form>
	</div>
	<div id="editDialog" style="display:none">
		<form method="post" action="">
			<div class="row">
				<div class="col-md-6 col-lg-12">
					<div class="form-group">
						<label for="start">START</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-play"></span> 
							</span> <input type="text" class="form-control" name="start" id="editstart" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="end">END</label>
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-stop"></span> 
							</span> <input type="text" class="form-control" name="end" id="editend" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="user_id">WRITER</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
							<input type="text" class="form-control" name="user_id" id="edituser_id" value="${user_id}" readonly="readonly"/>
							
						</div>
					</div>
					<div class="form-group">
						<label for="pro_name">CROP</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-leaf"></span> </span>
							<input type="text" class="form-control" name="pro_name" id="editpro_name" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="content">CONTENT</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-comment"></span> </span>
							<textarea class="form-control" name="content" id="editcontent" required="required"></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-12">
					<button type="button" class="btn btn-skin pull-right" onclick="edit()">
                            수 정</button>
				</div>
			</div>
		</form>
	</div>
</section>
