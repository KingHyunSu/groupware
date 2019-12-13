<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<!--  <script src="resources/origin/js/jquery.js"></script> -->
  <!-- Tree -->
  	<link rel="stylesheet" href="resources/Tree/css/jquery.treeview.css" />
	<link rel="stylesheet" href="resources/Tree/css/screen.css" />
	
	<script src="resources/Tree/lib/jquery.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.treeview.js" type="text/javascript"></script>
	<script src="resources/custom/js/manage.js" type="text/javascript"></script>
	
	<link href="resources/custom/css/popupGroup.css" rel="stylesheet" />
  <link href="resources/sb-admin-2/sb-admin-2.css" rel="stylesheet" />
  	<!-- 템플릿 custom end -->

<script type="text/javascript">
$(function() {
	$("#tree").treeview({
		collapsed : false,
		animated : "medium",
		control : "#sidetreecontrol",
		persist : "location"
	});
});
</script>

</head>
<body>
  <!-- container section start -->
  <section id="container" class="">
    <!--header start-->
    <jsp:include page = "../common/header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page = "../common/sidebar.jsp"/>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-user"></i>부서/직급 변경</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="">메인</a></li>
              <li><i class="fa fa-group"></i>직원 관리</li>
              <li><i class="fa fa-user"></i>부서/직급 변경</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-4">
            <section class="panel">
              <header class="panel-heading">
                	부서 목록
              </header>
              <div class="panel-body" style = "padding-top:0;">
					<div id="sidetree">
						<ul id="tree"> 
							
							<li>
								<input class = "tree-button" type = "button" name = "1" value = "총무" onclick="click_dept(name);">
							</li>
							<li>
								<input class = "tree-button" type = "button" name = "2" value = "회계" onclick="click_dept(name);">
							</li>
							<li>
								<input class = "tree-button" type = "button" name = "3" value = "인사" onclick="click_dept(name);">
							</li>
							<li>
								<input class = "tree-button" type = "button" name = "4" value = "영업본부" onclick="click_dept(name);">
									<ul>
										<li>
											<input class = "tree-button-sub" type = "button" name = "5" value = "영업1팀" onclick="click_dept(name);">
										</li>
									</ul>
									<ul>
										<li>
											<input class = "tree-button-sub" type = "button" name = "6" value = "영업2팀" onclick="click_dept(name);">
										</li>
									</ul>
							</li>
							<li>
								<input class = "tree-button" type = "button" name = "7" value = "디자인" onclick="click_dept(name);">
							</li>
							<li>
								<input class = "tree-button" type = "button" name = "8" value = "IT" onclick="click_dept(name);">
									<ul>
										<li>
											<input class = "tree-button-sub" type = "button" name = "9" value = "개발1팀" onclick="click_dept(name);">
										</li>
									</ul>
									<ul>
										<li>
											<input class = "tree-button-sub" type = "button" name = "10" value = "개발2팀" onclick="click_dept(name);">
										</li>
									</ul>
									<ul>
										<li>
											<input class = "tree-button-sub" type = "button" name = "11" value = "개발3팀" onclick="click_dept(name);">
										</li>
									</ul>
							</li>
						</ul>
					</div>
              </div>
            </section>
          </div>
          
          <div class="col-lg-8">
            <section class="panel">
              <header class="panel-heading">
                	직원 목록
              </header>
              <div class="panel-body">
                	<div class="listHead">
						<div class="listHiddenField pull-left field60">No.</div>
						<div class="listHiddenField pull-right field100" style="width:20%;">부서</div>
						<div class="listHiddenField pull-right field100" style="width:20%;">직급</div>
						<div class="listTitle">이름</div>
					</div>
					
					<div class="listBody">
				
					</div>
              </div>
            </section>
            
          </div>       
        </div>
        
        <div class="row">
        	<div class="col-lg-12">
          		<section class="panel">
              <header class="panel-heading">
                	직원 정보
              </header>
              <div class="panel-body" id = "suv2">
                	
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