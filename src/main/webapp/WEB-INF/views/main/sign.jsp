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
  <link href="resources/css_modify/PaymentA4_basic.css" rel="stylesheet" />
  <script src="resources/custom/js/sign.js" type="text/javascript"></script>
  	<!-- 템플릿 custom end -->

  	<script>
		$(document).ready(function(){
			
			$.ajax({
				type : "GET",
				url : "signPopup",
				dataType : "text",
				success : function(data) {

					var deptname = $('input#deptname').val();

				}
			})
		})
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
            <h3 class="page-header"><i class="fa fa-files-o"></i> Form Validation</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
              <li><i class="icon_document_alt"></i>Forms</li>
              <li><i class="fa fa-files-o"></i>Form Validation</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                결제 서류 작성
              </header>
              <div class="panel-body">
                <div class="form">
                  <form class="form-validate form-horizontal" id="feedback_form" method="get" action="">
                    결재선 5개 이상 불가
                    <div class = "main-form">
                    	<div class = "form-title">
                    		<h1 style = "text-align : center;">TEST 결재 양식</h1>
                    		<button class = "add-button" type = "button" onclick="click_signPath();">일정 추가</button>
                    	</div>
                    	<div class = "form-head">
                    		<table class = "gian">
                    			<tr>
                    				<td class = "gian-left">부서</td>
                    				<td class = "gian-right"></td>
                    			</tr>
                    			<tr>
                    				<td class = "gian-left">기안자</td>
                    				<td class = "gian-right"></td>
                    			</tr>
                    			<tr>
                    				<td class = "gian-left">기안 날짜</td>
                    				<td class = "gian-right"></td>
                    			</tr>
                    		</table>
                    		<div class = "sign">        
                    			<div class = "sign-left">
                    				결<br>재
                    			</div>
                    			<div id = "sign-zone">
	                 				<div class = "sign-top">
	                 				</div>
	                 				<div class = "sign-bottom">
	                 					결재날짜(임시)
	                 				</div>  
								</div>	
                    		</div>
                    	</div>
                    	<div class = "form-body">
                    		<table class = "sign-table">
                    			<tr>
                    				<td class= "sign-table-left">문서제목</td>
                    				<td><input class= "sign-table-input1" type = "text" name = "title"></td>
                    			</tr>
                    		</table>
                    		<textarea class= "sign-table-textarea1" rows = "35"></textarea>
                    	</div>
                    	<div class = "form-foot">
                    	</div>
                    </div>
                    <div class="form-group">
                      <div class="col-lg-offset-2 col-lg-10">
                        <button class="btn btn-primary" type="submit">Save</button>
                        <button class="btn btn-default" type="button">Cancel</button>
                      </div>
                    </div>
                    
                    		<!-- hidden -->
                 <div id = "hidden-sign">

                  </div>
                  
                  </form>
                </div>

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
