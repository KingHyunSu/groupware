<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.management.sign.SignDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<SignDTO> list = (ArrayList<SignDTO>)request.getAttribute("list");
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

  <title>기안</title>

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
  <!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- custom -->
  <link href="resources/sb-admin-2/sb-admin-2.css" rel="stylesheet" />
  <script src="resources/custom/js/sign.js" type="text/javascript"></script>
  	<!-- 템플릿 custom end -->

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
            <h3 class="page-header"><i class="fa fa-files-o"></i> 결재 완료함</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="">메인</a></li>
              <li><i class="icon_document_alt"></i>결재</li>
              <li><i class="fa fa-files-o"></i>결재 완료</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                결재 완료 목록
              </header>
              <div class="panel-body">
                	<div class="listHead">
						<div class="listHiddenField pull-left field60">No.</div>
						<div class="listHiddenField pull-right field100">상태</div>
						<div class="listHiddenField pull-right field130">결재 날짜</div>
						<div class="listHiddenField pull-right field130">기안 날짜</div>
						<div class="listHiddenField pull-right field130">기안자</div>
						<div class="listTitle">제목</div>
					</div>
<%
	for (int i = 0; i < list.size(); i++) {
		SignDTO dto = list.get(i);
		
		if(dto.getSignCheck().equals("0")) {
			dto.setSignCheck("대기");
		} else {
			dto.setSignCheck("결재");
		}
%>
	              <div class="listBody">
						<div class="listHiddenField pull-left field60 textCenter"><%=dto.getNum() %></div>
						<div class="listHiddenField pull-right field100 textCenter"><%=dto.getSignCheck() %></div>
						<div class="listHiddenField pull-right field130 textCenter"></div>
						<div class="listHiddenField pull-right field130 textCenter"><%=dto.getDate() %></div>
						<div class="listHiddenField pull-right field130 textCenter"><%=dto.getName() %></div>
						<div class="listTitle" style="text-align:center;">
							<a href="signFinishDoc?num=<%= dto.getNum() %>">
							<%=dto.getTitle() %></a>
						</div>
					</div>
<%
	}
%>					
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
	<!--ckeditor-->
  <script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
  <!-- 부트스트랩 기본 템플릿 end -->
</body>

</html>