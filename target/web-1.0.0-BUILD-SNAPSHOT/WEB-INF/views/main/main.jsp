<%@page import="com.management.schedule.ScheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.management.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<NoticeDTO> noticeList = (ArrayList<NoticeDTO>)request.getAttribute("noticeList");
	int process = (int)request.getAttribute("signProcessCount");
	int stay = (int)request.getAttribute("signStayCount");
	int finish = (int)request.getAttribute("signFinishCount");
	List<ScheduleDTO> scheduleList = (ArrayList<ScheduleDTO>)request.getAttribute("showSchedule");
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

  <title>Creative - Bootstrap Admin Template</title>

  <!-- Bootstrap CSS -->
  <link href="resources/origin/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/origin/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/origin/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/origin/css/font-awesome.min.css" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="resources/origin/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
  <link rel="resources/origin/stylesheet" href="css/owl.carousel.css" type="text/css">
  <link href="resources/origin/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="resources/origin/stylesheet" href="css/fullcalendar.css">
  <link href="resources/origin/css/widgets.css" rel="stylesheet">
  <link href="resources/origin/css/style.css" rel="stylesheet">
  <link href="resources/origin/css/style-responsive.css" rel="stylesheet" />
  <link href="resources/origin/css/xcharts.min.css" rel=" stylesheet">
  <link href="resources/origin/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
  
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.10.0/css/font-awesome.min.css">

   <link href="resources/sb-admin-2/sb-admin-2.css" rel="stylesheet" />
   
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
		  	  for (int i = 0; i < scheduleList.size(); i++) {
		  	  	ScheduleDTO dto = (ScheduleDTO)scheduleList.get(i);
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
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">메인</a></li>
              <i class="fas fa-file-signature"></i>
            </ol>
          </div>
        </div>

        <div class="row" style ="position:relative;">
          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box blue-bg">
              <i class="fa fa-file-text"></i>
              <div class="count"><a href = "signProcess" style = "color:white;"><%=process %></a></div>
              <div class="title">결재 진행 중인 문서</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box brown-bg">
              <i class="fa fa-file-text"></i>
              <div class="count"><a href = "signStay" style = "color:white;"><%=stay %></a></div>
              <div class="title">결재 대기 중인 문서</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box dark-bg">
              <i class="fa fa-file-text"></i>
              <div class="count"><a href = "signFinish" style = "color:white;"><%=finish %></a></div>
              <div class="title">결재 완료된 문서</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box green-bg" style = "height:580px;">
              <i class="fa fa-cubes"></i>
              <div class="count">채팅 자리</div>
              <div class="title">(예정)</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->
          
			<div class="col-lg-9 col-md-12" style = "position:absolute; top:160px;">

            <div class="panel panel-default">
              <div class="panel-heading">
                <h2><i class="icon_documents_alt"></i><strong><a href="notice">공지사항 바로가기</a></strong></h2>
              </div>
              <div class="panel-body">
                	<div class="listHead">
						<div class="listHiddenField pull-left field60">No.</div>
						<div class="listHiddenField pull-right field130">날짜</div>
						<div class="listHiddenField pull-right field130">글쓴이</div>
						<div class="listTitle">제목</div>
					</div>
<%
	for(int i = 0; i < noticeList.size(); i++){
		NoticeDTO dto = noticeList.get(i);
%>
					<div class="listBody">
						<div class="listHiddenField pull-left field60 textCenter"><%=dto.getNum() %></div>
						<div class="listHiddenField pull-right field130 textCenter"></div>
						<div class="listHiddenField pull-right field130 textCenter"></div>
						<div class="listTitle" style="text-align:center;">
							<a href="noticeDoc?num=<%= dto.getNum() %>">
							<%=dto.getTitle() %></a>
						</div>
					</div>
<%
	}
%>				
				</div>
            </div>
          </div>
          
        </div>
        <!--/.row-->



        <div class="row">

          <div class="col-lg-9 col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h2><i class="icon_table"></i><strong><a href="schedule">일정관리 바로가기</a></strong></h2>
              </div>
              <div class="panel-body">
                <div id='calendar'>
                 </div>
              </div>

            </div>

        </div>

      </section>
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
    <!--main content end-->
  </section>
  <!-- container section start -->

  <!-- javascripts -->
  <script src="resources/origin/js/jquery.js"></script>
  <script src="resources/origin/js/jquery-ui-1.10.4.min.js"></script>
  <script src="resources/origin/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="resources/origin/js/jquery-ui-1.9.2.custom.min.js"></script>
  <!-- bootstrap -->
  <script src="resources/origin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="resources/origin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/origin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!-- charts scripts -->
  <script src="resources/origin/assets/jquery-knob/js/jquery.knob.js"></script>
  <script src="resources/origin/js/jquery.sparkline.js" type="text/javascript"></script>
  <script src="resources/origin/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
  <script src="resources/origin/js/owl.carousel.js"></script>

    <!-- custom select -->
    <script src="resources/origin/js/jquery.customSelect.min.js"></script>
    <script src="resources/origin/assets/chart-master/Chart.js"></script>

    <!--custome script for all page-->
    <script src="resources/origin/js/scripts.js"></script>
    <!-- custom script for this page-->
    <script src="resources/origin/js/sparkline-chart.js"></script>
    <script src="resources/origin/js/easy-pie-chart.js"></script>
    <script src="resources/origin/js/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="resources/origin/js/jquery-jvectormap-world-mill-en.js"></script>
    <script src="resources/origin/js/xcharts.min.js"></script>
    <script src="resources/origin/js/jquery.autosize.min.js"></script>
    <script src="resources/origin/js/jquery.placeholder.min.js"></script>
    <script src="resources/origin/js/gdp-data.js"></script>
    <script src="resources/origin/js/morris.min.js"></script>
    <script src="resources/origin/js/sparklines.js"></script>
    <script src="resources/origin/js/charts.js"></script>
    <script src="resources/origin/js/jquery.slimscroll.min.js"></script>
    <script>
      //knob
      $(function() {
        $(".knob").knob({
          'draw': function() {
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
        $("#owl-slider").owlCarousel({
          navigation: true,
          slideSpeed: 300,
          paginationSpeed: 400,
          singleItem: true

        });
      });

      //custom select box

      $(function() {
        $('select.styled').customSelect();
      });

    </script>

</body>

</html>
