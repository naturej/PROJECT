<%@page import="kr.co.ohdeokrionline.model.vo.ScheduleRecord_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%
	List<ScheduleRecord_DTO> list = (List<ScheduleRecord_DTO>)request.getAttribute("list");
	String user_id = (String)request.getAttribute("user_id");
%>
<!-- 내일정관리 페이지 -->
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="">
    <meta name="author" content="CSSNectar.com">
	<title>일정관리</title>
	<!-- Include CSS for JQuery Frontier Calendar plugin (Required for calendar plugin) -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/calendar/css/frontierCalendar/jquery-frontier-cal-1.3.2.css" />
	
	<!-- Include CSS for color picker plugin (Not required for calendar plugin. Used for example.) -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/calendar/css/colorpicker/colorpicker.css" />
	
	<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/calendar/css/jquery-ui/smoothness/jquery-ui-1.8.1.custom.css" />
	
	<!--
	Include JQuery Core (Required for calendar plugin)
	** This is our IE fix version which enables drag-and-drop to work correctly in IE. See README file in js/jquery-core folder. **
	-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/js/jquery-core/jquery-1.4.2-ie-fix.min.js"></script>
	
	<!-- Include JQuery UI (Required for calendar plugin.) -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/js/jquery-ui/smoothness/jquery-ui-1.8.1.custom.min.js"></script>
	
	<!-- Include color picker plugin (Not required for calendar plugin. Used for example.) -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/js/colorpicker/colorpicker.js"></script>
	
	<!-- Include jquery tooltip plugin (Not required for calendar plugin. Used for example.) -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/js/jquery-qtip-1.0.0-rc3140944/jquery.qtip-1.0.js"></script>
	
	<!--
		(Required for plugin)
		Dependancies for JQuery Frontier Calendar plugin.
	    ** THESE MUST BE INCLUDED BEFORE THE FRONTIER CALENDAR PLUGIN. **
	-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/js/lib/jshashtable-2.1.js"></script>
	
	<!-- Include JQuery Frontier Calendar plugin -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/js/frontierCalendar/jquery-frontier-cal-1.3.2.js"></script>
	
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

	<!-- Some CSS for our example. (Not required for calendar plugin. Used for example.)-->
	<style type="text/css" media="screen">
	body { font-size: 62.5%; }
	.shadow {
		-moz-box-shadow: 3px 3px 4px #1ABC9C;
		-webkit-box-shadow: 3px 3px 4px #1ABC9C;
		box-shadow: 3px 3px 4px #1ABC9C;
		/* For IE 8 */
		-ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#1ABC9C')";
		/* For IE 5.5 - 7 */
		filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#1ABC9C');
	}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){	
		i=1;
		list = <%=list%>;
		user_id = <%="'"+user_id+"'"%>;
		var clickDate = "";
		var clickAgendaItem = "";
		
		/**
		 * Initializes calendar with current year & month
		 * specifies the callbacks for day click & agenda item click events
		 * then returns instance of plugin object
		 */
		var jfcalplugin = $("#mycal").jFrontierCal({
			date: new Date(),
			dayClickCallback: myDayClickHandler,
			agendaClickCallback: myAgendaClickHandler,
			agendaDropCallback: myAgendaDropHandler,
			agendaMouseoverCallback: myAgendaMouseoverHandler,
			applyAgendaTooltipCallback: myApplyTooltip,
			agendaDragStartCallback : myAgendaDragStart,
			agendaDragStopCallback : myAgendaDragStop,
			dragAndDropEnabled: true
		}).data("plugin");
		
		/**
		 * Do something when dragging starts on agenda div
		 */
		function myAgendaDragStart(eventObj,divElm,agendaItem){
			// destroy our qtip tooltip
			if(divElm.data("qtip")){
				divElm.qtip("destroy");
			}	
		};
		
		/**
		 * Do something when dragging stops on agenda div
		 */
		function myAgendaDragStop(eventObj,divElm,agendaItem){
			//alert("drag stop");
		};
		
		/**
		 * Custom tooltip - use any tooltip library you want to display the agenda data.
		 * for this example we use qTip - http://craigsworks.com/projects/qtip/
		 *
		 * @param divElm - jquery object for agenda div element
		 * @param agendaItem - javascript object containing agenda data.
		 */
		function myApplyTooltip(divElm,agendaItem){
	
			// Destroy currrent tooltip if present
			if(divElm.data("qtip")){
				divElm.qtip("destroy");
			}
			
			var displayData = "";
			
			var title = agendaItem.title;
			var startDate = agendaItem.startDate;
			var endDate = agendaItem.endDate;
			var allDay = agendaItem.allDay;
			var data = agendaItem.data;
			displayData += "<br><b>" + title+ "</b><br><br>";
			
			for (var propertyName in data) {
				displayData += "<b>" + propertyName + ":</b> " + data[propertyName] + "<br>"
			}
			// use the user specified colors from the agenda item.
			var backgroundColor = agendaItem.displayProp.backgroundColor;
			var foregroundColor = agendaItem.displayProp.foregroundColor;
			var myStyle = {
				border: {
					width: 5,
					radius: 10
				},
				padding: 10, 
				textAlign: "left",
				tip: true,
				name: "dark" // other style properties are inherited from dark theme		
			};
			if(backgroundColor != null && backgroundColor != ""){
				myStyle["backgroundColor"] = backgroundColor;
			}
			if(foregroundColor != null && foregroundColor != ""){
				myStyle["color"] = foregroundColor;
			}
			// apply tooltip
			divElm.qtip({
				content: displayData,
				position: {
					corner: {
						tooltip: "bottomMiddle",
						target: "topMiddle"			
					},
					adjust: { 
						mouse: true,
						x: 0,
						y: -15
					},
					target: "mouse"
				},
				show: { 
					when: { 
						event: 'mouseover'
					}
				},
				style: myStyle
			});
	
		};
	
		/**
		 * Make the day cells roughly 3/4th as tall as they are wide. this makes our calendar wider than it is tall. 
		 */
		jfcalplugin.setAspectRatio("#mycal",0.75);
	
		/**
		 * Called when user clicks day cell
		 * use reference to plugin object to add agenda item
		 */
		function myDayClickHandler(eventObj){
			// Get the Date of the day that was clicked from the event object
			var date = eventObj.data.calDayDate;
			// store date in our global js variable for access later
			clickDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
			// open our add event dialog
			$('#add-event-form').dialog('open');
		};
		
		/**
		 * Called when user clicks and agenda item
		 * use reference to plugin object to edit agenda item
		 */
		function myAgendaClickHandler(eventObj){
			// Get ID of the agenda item from the event object
			var agendaId = eventObj.data.agendaId;		
			// pull agenda item from calendar
			var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);
			clickAgendaItem = agendaItem;
			$("#display-event-form").dialog('open');
		};
		
		/**
		 * Called when user drops an agenda item into a day cell.
		 */
		function myAgendaDropHandler(eventObj){
			// Get ID of the agenda item from the event object
			var agendaId = eventObj.data.agendaId;
			// date agenda item was dropped onto
			var date = eventObj.data.calDayDate;
			// Pull agenda item from calendar
			var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);		
			alert("You dropped agenda item " + agendaItem.title + 
				" onto " + date.toString() + ". Here is where you can make an AJAX call to update your database.");
		};
		
		/**
		 * Called when a user mouses over an agenda item	
		 */
		function myAgendaMouseoverHandler(eventObj){
			var agendaId = eventObj.data.agendaId;
			var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);
			//alert("You moused over agenda item " + agendaItem.title + " at location (X=" + eventObj.pageX + ", Y=" + eventObj.pageY + ")");
		};
		/**
		 * Initialize jquery ui datepicker. set date format to yyyy-mm-dd for easy parsing
		 */
		$("#dateSelect").datepicker({
			showOtherMonths: true,
			selectOtherMonths: true,
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			dateFormat: 'yy-mm-dd'
		});
		
		/**
		 * Set datepicker to current date
		 */
		$("#dateSelect").datepicker('setDate', new Date());
		/**
		 * Use reference to plugin object to a specific year/month
		 */
		$("#dateSelect").bind('change', function() {
			var selectedDate = $("#dateSelect").val();
			var dtArray = selectedDate.split("-");
			var year = dtArray[0];
			// jquery datepicker months start at 1 (1=January)		
			var month = dtArray[1];
			// strip any preceeding 0's		
			month = month.replace(/^[0]+/g,"")		
			var day = dtArray[2];
			// plugin uses 0-based months so we subtrac 1
			jfcalplugin.showMonth("#mycal",year,parseInt(month-1).toString());
		});	
		/**
		 * Initialize previous month button
		 */
		$("#BtnPreviousMonth").button();
		$("#BtnPreviousMonth").click(function() {
			jfcalplugin.showPreviousMonth("#mycal");
			// update the jqeury datepicker value
			var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
			var cyear = calDate.getFullYear();
			// Date month 0-based (0=January)
			var cmonth = calDate.getMonth();
			var cday = calDate.getDate();
			// jquery datepicker month starts at 1 (1=January) so we add 1
			$("#dateSelect").datepicker("setDate",cyear+"-"+(cmonth+1)+"-"+cday);
			return false;
		});
		/**
		 * Initialize next month button
		 */
		$("#BtnNextMonth").button();
		$("#BtnNextMonth").click(function() {
			jfcalplugin.showNextMonth("#mycal");
			// update the jqeury datepicker value
			var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
			var cyear = calDate.getFullYear();
			// Date month 0-based (0=January)
			var cmonth = calDate.getMonth();
			var cday = calDate.getDate();
			// jquery datepicker month starts at 1 (1=January) so we add 1
			$("#dateSelect").datepicker("setDate",cyear+"-"+(cmonth+1)+"-"+cday);		
			return false;
		});
		
		/**
		 * Initialize delete all agenda items button
		 */
		$("#BtnDeleteAll").button();
		$("#BtnDeleteAll").click(function() {	
			jfcalplugin.deleteAllAgendaItems("#mycal");	
			return false;
		});		
		
	
		/**
		 * Initialize add event modal form
		 */
		$("#add-event-form").dialog({
			autoOpen: false,
			height: 400,
			width: 400,
			modal: true,
			buttons: {
				'일정 추가': function() {
	
					var what = jQuery.trim($("#what").val());//제목
					var pro_name = $('#product').val();//상품명
					var pl_content = $('#pl_content').val();//내용
					
					if(what == "" || pro_name == "" || pl_content == ""){
						alert("Please enter a short event description into fields.");
					}else{
					
						var startDate = $("#startDate").val();
						var startDtArray = startDate.split("-");
						var startYear = startDtArray[0];
						// jquery datepicker months start at 1 (1=January)		
						var startMonth = startDtArray[1];		
						var startDay = startDtArray[2];
						// strip any preceeding 0's		
						startMonth = startMonth.replace(/^[0]+/g,"");
						startDay = startDay.replace(/^[0]+/g,"");
	
						var endDate = $("#endDate").val();
						var endDtArray = endDate.split("-");
						var endYear = endDtArray[0];
						// jquery datepicker months start at 1 (1=January)		
						var endMonth = endDtArray[1];		
						var endDay = endDtArray[2];
						// strip any preceeding 0's		
						endMonth = endMonth.replace(/^[0]+/g,"");
	
						endDay = endDay.replace(/^[0]+/g,"");
						
						//alert("Start time: " + startHour + ":" + startMin + " " + startMeridiem + ", End time: " + endHour + ":" + endMin + " " + endMeridiem);
	
						// Dates use integers
						var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),0,0);
						var endDateObj = new Date(parseInt(endYear),parseInt(endMonth)-1,parseInt(endDay),0,0);
						
						// add new event to the calendar
						jfcalplugin.addAgendaItem(
							"#mycal",
							what,
							startDateObj,
							endDateObj,
							false,
							{
								"상품" : pro_name,
								"내용" : pl_content
							},
							{
								backgroundColor: $("#colorBackground").val(),
								foregroundColor: $("#colorForeground").val()
							}
						);
						
						//DB 등록 작업
						var agi = jfcalplugin.getAgendaItemById("#mycal",++list.length);
						/* var startDate = agi.startDate.toLocaleString().substring(0,12)
										.replace(".","-").replace(".","-").replace(".","")
										.replace(" ","0").replace(" ","0"); */
						var startDate = agi.startDate.toLocaleString().substring(0,12)
						var endDate = agi.endDate.toLocaleString().substring(0,12)
						
						$.ajax({
							url : "scheduleAdd.five",
							data : {
								user_id : user_id,
								pl_startdate : startDate,
								pl_enddate : endDate,
								pl_sub : agi.title,
								pro_name : pro_name,
								pl_content : pl_content
							},
							success : function(data){
								location.href="schedule.five";
							},
							error : function(xhr, status){
								alert(xhr + '/' + status); 
							}
						});
						
						$(this).dialog('close');
					}
					
				},
				'취소': function() {
					$(this).dialog('close');
				}
			},
			open: function(event, ui){
				// initialize start date picker
				$("#startDate").datepicker({
					showOtherMonths: true,
					selectOtherMonths: true,
					changeMonth: true,
					changeYear: true,
					showButtonPanel: true,
					dateFormat: 'yy-mm-dd'
				});
				// initialize end date picker
				$("#endDate").datepicker({
					showOtherMonths: true,
					selectOtherMonths: true,
					changeMonth: true,
					changeYear: true,
					showButtonPanel: true,
					dateFormat: 'yy-mm-dd'
				});
				// initialize with the date that was clicked
				$("#startDate").val(clickDate);
				$("#endDate").val(clickDate);
				// initialize color pickers
				$("#colorSelectorBackground").ColorPicker({
					color: "#333333",
					onShow: function (colpkr) {
						$(colpkr).css("z-index","10000");
						$(colpkr).fadeIn(500);
						return false;
					},
					onHide: function (colpkr) {
						$(colpkr).fadeOut(500);
						return false;
					},
					onChange: function (hsb, hex, rgb) {
						$("#colorSelectorBackground div").css("backgroundColor", "#" + hex);
						$("#colorBackground").val("#" + hex);
					}
				});
				//$("#colorBackground").val("#1040b0");		
				$("#colorSelectorForeground").ColorPicker({
					color: "#ffffff",
					onShow: function (colpkr) {
						$(colpkr).css("z-index","10000");
						$(colpkr).fadeIn(500);
						return false;
					},
					onHide: function (colpkr) {
						$(colpkr).fadeOut(500);
						return false;
					},
					onChange: function (hsb, hex, rgb) {
						$("#colorSelectorForeground div").css("backgroundColor", "#" + hex);
						$("#colorForeground").val("#" + hex);
					}
				});
				//$("#colorForeground").val("#ffffff");				
				// put focus on first form input element
				$("#what").focus();
			},
			close: function() {
				// reset form elements when we close so they are fresh when the dialog is opened again.
				$("#startDate").datepicker("destroy");
				$("#endDate").datepicker("destroy");
				$("#startDate").val("");
				$("#endDate").val("");
				$("#startHour option:eq(0)").attr("selected", "selected");
				$("#startMin option:eq(0)").attr("selected", "selected");
				$("#startMeridiem option:eq(0)").attr("selected", "selected");
				$("#endHour option:eq(0)").attr("selected", "selected");
				$("#endMin option:eq(0)").attr("selected", "selected");
				$("#endMeridiem option:eq(0)").attr("selected", "selected");			
				$("#what").val("");
				$('#product').val("");
				$('#pl_content').val("");
				//$("#colorBackground").val("#1040b0");
				//$("#colorForeground").val("#ffffff");
			}
		});
		
		// 수정 
		$("#edit-event-form").dialog({
		      autoOpen: false,
		      height: 400,
		      width: 400,
		      buttons: {
		         '취소': function() {
		            $(this).dialog('close');
		         },
		         '확인': function(){
		        	
		        	var what = jQuery.trim($("#edit_what").val());//제목
		        	var pro_name = $('#edit_product').val();//상품명
					var pl_content = $('#edit_pl_content').val();//내용
					
					if(what == "" || pro_name == "" || pl_content == ""){
						alert("Please enter a short event description into fields.");
					}else{
						var startDate = $("#edit_startDate").val();
						var startDtArray = startDate.split("-");
						var startYear = startDtArray[0];
						// jquery datepicker months start at 1 (1=January)		
						var startMonth = startDtArray[1];		
						var startDay = startDtArray[2];
						// strip any preceeding 0's		
						startMonth = startMonth.replace(/^[0]+/g,"");
						startDay = startDay.replace(/^[0]+/g,"");
	
						var endDate = $("#edit_endDate").val();
						var endDtArray = endDate.split("-");
						var endYear = endDtArray[0];
						// jquery datepicker months start at 1 (1=January)		
						var endMonth = endDtArray[1];		
						var endDay = endDtArray[2];
						// strip any preceeding 0's		
						endMonth = endMonth.replace(/^[0]+/g,"");
	
						endDay = endDay.replace(/^[0]+/g,"");
						
						
						// Dates use integers
						var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),0,0);
						var endDateObj = new Date(parseInt(endYear),parseInt(endMonth)-1,parseInt(endDay),0,0);
						
						// add new event to the calendar
						jfcalplugin.addAgendaItem(
							"#mycal",
							what,
							startDateObj,
							endDateObj,
							false,
							{
								fname: "Santa",
								lname: "Claus",
								leadReindeer: "Rudolph",
								myDate: new Date(),
								myNum: 42
							},
							{
								backgroundColor: $("#edit_colorBackground").val(),
								foregroundColor: $("#edit_colorForeground").val()
							}
						);
						
						//DB 등록 작업
						var agi = jfcalplugin.getAgendaItemById("#mycal",++clickAgendaItem.agendaId);
		        		
						var startDate = agi.startDate.toLocaleString().substring(0,12);
						var endDate = agi.endDate.toLocaleString().substring(0,12);
						
						$.ajax({
							url : "scheduleEdit.five",
							data : {
								user_id : user_id,
								pl_startdate : startDate,
								pl_enddate : endDate,
								pl_sub : agi.title,
								pro_name : pro_name,
								pl_content : pl_content
							},
							success : function(data){
								location.href="schedule.five";
							},
							error : function(xhr, status){
								alert(xhr + '/' + status); 
							}
						});
						$(this).dialog('close');
	
					}
		    	 }
		      },
		      open: function(event, ui){
		         // initialize start date picker
		         $("#edit_startDate").datepicker({
		            showOtherMonths: true,
		            selectOtherMonths: true,
		            changeMonth: true,
		            changeYear: true,
		            showButtonPanel: true,
		            dateFormat: 'yy-mm-dd'
		         });
		         // initialize end date picker
		         $("#edit_endDate").datepicker({
		            showOtherMonths: true,
		            selectOtherMonths: true,
		            changeMonth: true,
		            changeYear: true,
		            showButtonPanel: true,
		            dateFormat: 'yy-mm-dd'
		         });
		         // initialize with the date that was clicked
		         $("#edit_what").val(clickAgendaItem.title);
		         var startDate = clickAgendaItem.startDate;
		         $("#edit_startDate").val(startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-"+startDate.getDate());
		         var endDate = clickAgendaItem.endDate;
		         $("#edit_endDate").val(endDate.getFullYear()+"-"+(endDate.getMonth()+1)+"-"+endDate.getDate());
		         
		         $('#edit_product').val(clickAgendaItem.data["상품"]);
		         $('#edit_pl_content').val(clickAgendaItem.data["내용"]);
		         
		         // initialize color pickers
		         $("#edit_colorSelectorBackground").ColorPicker({
		            color: "#333333",
		            onShow: function (colpkr) {
		               $(colpkr).css("z-index","10000");
		               $(colpkr).fadeIn(500);
		               return false;
		            },
		            onHide: function (colpkr) {
		               $(colpkr).fadeOut(500);
		               return false;
		            },
		            onChange: function (hsb, hex, rgb) {
		               $("#edit_colorSelectorBackground div").css("backgroundColor", "#" + hex);
		               $("#edit_colorBackground").val("#" + hex);
		            }
		         });
		         //$("#colorBackground").val("#1040b0");      
		         $("#edit_colorSelectorForeground").ColorPicker({
		            color: "#ffffff",
		            onShow: function (colpkr) {
		               $(colpkr).css("z-index","10000");
		               $(colpkr).fadeIn(500);
		               return false;
		            },
		            onHide: function (colpkr) {
		               $(colpkr).fadeOut(500);
		               return false;
		            },
		            onChange: function (hsb, hex, rgb) {
		               $("#edit_colorSelectorForeground div").css("backgroundColor", "#" + hex);
		               $("#edit_colorForeground").val("#" + hex);
		            }
		         });
		         //$("#colorForeground").val("#ffffff");            
		         // put focus on first form input element
		         $("#edit_what").focus();
		      }
		   });
		
		/**
		 * Initialize display event form.
		 */
		$("#display-event-form").dialog({
			autoOpen: false,
			height: 400,
			width: 400,
			modal: true,
			buttons: {		
				'취소': function() {
					$(this).dialog('close');
				},
				'수정': function() {
					//alert("Make your own edit screen or dialog!");
					
					$("#edit-event-form").dialog('open');
					$(this).dialog('close');
				},
				'삭제': function() {
					if(confirm("Are you sure you want to delete this agenda item?")){
						var agi = jfcalplugin.getAgendaItemById("#mycal",clickAgendaItem.agendaId);
						var startDate = agi.startDate.toLocaleString().substring(0,12);
						var endDate = agi.endDate.toLocaleString().substring(0,12);
						
		        		$.ajax({
							url : "scheduleRemove.five",
							data : {
								user_id : user_id,
								pl_startdate : startDate,
								pl_enddate : endDate,
								pl_sub : agi.title,
								pro_name : agi.data["상품"],
								pl_content : agi.data["내용"]
							},
							success : function(data){
								if(data.length>0){
									location.href='schedule.five';
								}else{
									alert('fail');
								}
							},
							error : function(xhr, status){
								alert(xhr + '/' + status); 
							}
						});
		        		
						$(this).dialog('close');
					}
				}			
			},
			open: function(event, ui){
				if(clickAgendaItem != null){
					var title = clickAgendaItem.title;
					var startDate = clickAgendaItem.startDate;
					var endDate = clickAgendaItem.endDate;
					var allDay = clickAgendaItem.allDay;
					var data = clickAgendaItem.data;
					// in our example add agenda modal form we put some fake data in the agenda data. we can retrieve it here.
					$("#display-event-form").append(
						"<br><b>" + title+ "</b><br><br>"		
					);				
					if(allDay){
						$("#display-event-form").append(
							"(All day event)<br><br>"				
						);				
					}else{
						$("#display-event-form").append(
							"<b>Starts:</b> " + startDate + "<br>" +
							"<b>Ends:</b> " + endDate + "<br><br>"				
						);				
					}
					for (var propertyName in data) {
						$("#display-event-form").append("<b>" + propertyName + ":</b> " + data[propertyName] + "<br>");
					}			
				}		
			},
			close: function() {
				// clear agenda data
				$("#display-event-form").html("");
			}
		});	 
	
		/**
		 * Initialize our tabs
		 */
		$("#tabs").tabs({
			/*
			 * Our calendar is initialized in a closed tab so we need to resize it when the example tab opens.
			 */
			show: function(event, ui){
				if(ui.index == 1){
					jfcalplugin.doResize("#mycal");
				}
			}	
		});
		
		//스케쥴에 등록
		$.each(list,function(index,obj){
			// 변수 선언
			var startdate = obj.pl_startdate;
			var enddate = obj.pl_enddate;
			
			// start Date
			var startDtArray = startdate.split("-");
			var startYear = startDtArray[0];
			// jquery datepicker months start at 1 (1=January)		
			var startMonth = startDtArray[1];		
			var startDay = startDtArray[2].replace(" 00:00:00","");
			
			// strip any preceeding 0's		
			startMonth = startMonth.replace(/^[0]+/g,"");
			startDay = startDay.replace(/^[0]+/g,"");
			
			// to integers
			startYear = parseInt(startYear);
			startMonth = parseInt(startMonth)-1;
			startDay = parseInt(startDay);
			
			// end Date
			var endDtArray = enddate.split("-");
			var endYear = endDtArray[0];
			// jquery datepicker months start at 1 (1=January)		
			var endMonth = endDtArray[1];		
			var endDay = endDtArray[2].replace(" 00:00:00","");
			
			// strip any preceeding 0's		
			endMonth = endMonth.replace(/^[0]+/g,"");
			endDay = endDay.replace(/^[0]+/g,"");
			
			// to integers
			endYear = parseInt(endYear);
			endMonth = parseInt(endMonth)-1;
			endDay = parseInt(endDay);

			// Dates use integers
			var startDateObj = new Date(startYear,startMonth,startDay);
			var endDateObj = new Date(endYear,endMonth,endDay);
			jfcalplugin.addAgendaItem(
				"#mycal",
				obj.pl_sub,
				startDateObj,
				endDateObj,
				false,
				{
					"내용":obj.pl_content,
					"상품":obj.pro_name
				},
				{
					backgroundColor: $("#colorBackground").val(),
					foregroundColor: $("#colorForeground").val()
				}
			);
		});
		
	});
	</script>
	
    <section id="contact" class="home-section text-center" style="background:#ffffff;">

		<div id="example" style="margin: auto; width:55%;">
		<se:authorize ifAnyGranted="ROLE_SELLER,ROLE_CONSUMER,ROLE_ADMIN">
			<h3 align="center">${user_id}'s 일정</h3>
		</se:authorize>		
		<div id="toolbar" class="ui-widget-header ui-corner-all" style="padding:3px; vertical-align: middle; white-space:nowrap; overflow: hidden;">
			<button id="BtnPreviousMonth">이전 달</button>
			<button id="BtnNextMonth">다음 달</button>
			&nbsp;&nbsp;&nbsp;
			Date: <input type="text" id="dateSelect" size="20"/>
			&nbsp;&nbsp;&nbsp;
			<button id="BtnDeleteAll">전체 삭제</button>
		</div>

		<br>

		<!--
		You can use pixel widths or percentages. Calendar will auto resize all sub elements.
		Height will be calculated by aspect ratio. Basically all day cells will be as tall
		as they are wide.
		-->
		<div id="mycal"></div>

		</div>

		<!-- debugging-->
		<div id="calDebug"></div>

		<!-- Add event modal form -->
		<style type="text/css">
			label, input.text, select { display:block; }
			fieldset { padding:0; border:0; margin-top:25px; }
			.ui-dialog .ui-state-error { padding: .3em; }
			.validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
		<div id="add-event-form" title="Add New Event">
			<p class="validateTips">모두 채워주세요</p>
			<form>
			<fieldset>
				<label for="name">제목</label>
				<input type="text" name="what" id="what" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
				<label>상품명</label>
				<input type="text" name="product" id="product" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
				<label>내용</label>
				<textarea name="pl_content" id="pl_content" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"></textarea>
				<table style="width:100%; padding:5px;">
					<tr>
						<td colspan="2">
							<label>시작일</label>
							<input type="text" name="startDate" id="startDate" value="" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>				
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
							<label>종료일</label>
							<input type="text" name="endDate" id="endDate" value="" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>				
						</td>
						<td>&nbsp;</td>				
					</tr>			
				</table>
				<table>
					<tr>
						<td>
							<label>Background Color</label>
						</td>
						<td>
							<div id="colorSelectorBackground"><div style="background-color: #333333; width:30px; height:30px; border: 2px solid #000000;"></div></div>
							<input type="hidden" id="colorBackground" value="#333333">
						</td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td>
							<label>Text Color</label>
						</td>
						<td>
							<div id="colorSelectorForeground"><div style="background-color: #ffffff; width:30px; height:30px; border: 2px solid #000000;"></div></div>
							<input type="hidden" id="colorForeground" value="#ffffff">
						</td>						
					</tr>				
				</table>
			</fieldset>
			</form>
		</div>
	<div id="edit-event-form">
		<p class="validateTips">모두 채워주세요</p>
		<form>
			<fieldset>
				<label for="name">제목</label>
				<input type="text" name="edit_what" id="edit_what" class="text ui-widget-content ui-corner-all"
					style="margin-bottom: 12px; width: 95%; padding: .4em;" />
				<label>상품명</label>
				<input type="text" name="edit_product" id="edit_product" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
				<label>내용</label>
				<textarea name="edit_pl_content" id="edit_pl_content" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"></textarea>
				<table style="width: 100%; padding: 5px;">
					<tr>
						<td>
						<label colspan="2">시작일</label>
						<input type="text" name="edit_startDate" id="edit_startDate" value=""
							class="text ui-widget-content ui-corner-all"
							style="margin-bottom: 12px; width: 95%; padding: .4em;" /></td>
					</tr>
					<tr>
						<td>
						<label colspan="2">종료일</label>
						<input type="text" name="edit_endDate" id="edit_endDate" value=""
							class="text ui-widget-content ui-corner-all"
							style="margin-bottom: 12px; width: 95%; padding: .4em;" /></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><label>Background Color</label></td>
						<td>
							<div id="edit_colorSelectorBackground">
								<div
									style="background-color: #333333; width: 30px; height: 30px; border: 2px solid #000000;"></div>
							</div> <input type="hidden" id="edit_colorBackground" value="#333333">
						</td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><label>Text Color</label></td>
						<td>
							<div id="edit_colorSelectorForeground">
								<div
									style="background-color: #ffffff; width: 30px; height: 30px; border: 2px solid #000000;"></div>
							</div> <input type="hidden" id="edit_colorForeground" value="#ffffff">
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div id="display-event-form" title="View Agenda Item"></div>

	<p>&nbsp;</p>
	
	</section>
	
</body>

</html>