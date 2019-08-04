<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.management.schedule.ScheduleDTO" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>

<%
	List<ScheduleDTO> list = (ArrayList<ScheduleDTO>)request.getAttribute("showSchedule");
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title>Form Validation | Creative - Bootstrap 3 Responsive Admin Template</title>

	<!-- 부트스트랩 기본 템플릿 -->
  <!-- Bootstrap CSS -->
  <link href="resources/origin/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/origin/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/origin/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/origin/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="resources/origin/css/style.css" rel="stylesheet">
  <link href="resources/origin/css/style-responsive.css" rel="stylesheet" />
	
  <!-- container section end -->
  	<!-- 부트스트랩 기본 템플릿 end -->
  
  	<!-- 템플릿 custom -->
	<!-- custom -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<link href="resources/custom/css/schedule.css" rel="stylesheet">
	<script src='resources/custom/js/schedule.js'></script>
	
	<!-- fullcalendar -->
	<link href='resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
	<link href='resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
	<script src='resources/fullcalendar/packages/core/main.js'></script>
	<script src='resources/fullcalendar/packages/interaction/main.js'></script>
	<script src='resources/fullcalendar/packages/daygrid/main.js'></script>
	<script src='resources/fullcalendar/packages/timegrid/main.js'></script>
	<script src='resources/fullcalendar/packages/list/main.js'></script>
	<!-- 템플릿 custom end -->
	
<script>
  document.addEventListener('DOMContentLoaded', function() {
	 
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      locale : "ko",
      //defaultDate: "2019-08-22",
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
<% 
  	  for (int i = 0; i < list.size(); i++) {
  	  	ScheduleDTO dto = (ScheduleDTO)list.get(i);
%>	
  	  {
  	   title : '<%= dto.getSubject() %>',
  	   start : '<%= dto.getStartDate() %>',
  	   end : '<%= dto.getEndDate() %>'
  	   },
<%
	}
%>
		{
		   title : 'defult',
		   start : "2019-01-01",
		   end : "2019-01-01"
		  }
      ]
    });

    calendar.render();
});
</script>
</head>

<body>
  <!-- container section start -->
  <section id="container" class="">
    <!--header start-->
    <jsp:include page = "common/header.jsp"/>
    <!--header end-->

    <!--sidebar start-->
    <jsp:include page = "common/sidebar.jsp"/>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header">
            	<i style = "width:32px;height:32px;background-image:url('resources/custom/img/calendar.png');"></i>
            		 일정 관리
            </h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="">메인</a></li>
              <li><i class="fa fa-files-o"></i>일정 관리</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                	다이어리
              </header>
              <div class="panel-body">
              <!-- schedule start -->
                 <div id='calendar' style="position : relative;">
                 		<div>
                 			<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
                 		</div>
                 </div>

              </div>
            </section>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                	일정 목록
              </header>
              <div class="panel-body">
                <table>
<%
	for(int i = 0; i < list.size(); i++) {
		ScheduleDTO dto = (ScheduleDTO)list.get(i);
%>
                    <tr class="form-group">
                      <td class="control-label col-lg-2">
                      		<%= dto.getSubject() %> 
                      </td>
                      <td class="col-lg-7">
                       	<label><%= dto.getMemo() %></label>
                      </td>
<%
	if (dto.getStartDate().equals(dto.getEndDate())) {
%>
						<td class="col-lg-2">
                        <%= dto.getStartDate() %>
                     </td>
<%
	} else{ 
%>
						<td class="col-lg-2">
                        <%= dto.getStartDate() %> ~ <%= dto.getEndDate() %>
                     </td>
<%
		}
%>    
                    </tr>
<%
	}
%>                   
                </table>
              </div>
            </section>
          </div>
        </div>
        <!-- page end-->
      </section>
    </section>
    <!--main content end-->
    <div class="text-right">
      <div class="credits">
          <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
  </section>
  <!-- 부트스트랩 기본 템플릿 -->
  <!-- container section end -->

  <!-- javascripts -->
  <script src="resources/origin/js/jquery.js"></script>
  <script src="resources/origin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="resources/origin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/origin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!-- jquery validate js -->
  <script type="text/javascript" src="resources/origin/js/jquery.validate.min.js"></script>

  <!-- custom form validation script for this page-->
  <script src="resources/origin/js/form-validation-script.js"></script>
  <!--custome script for all page-->
  <script src="resources/origin/js/scripts.js"></script>
  <!-- 부트스트랩 기본 템플릿 end -->

</body>

</html>