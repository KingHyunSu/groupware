<%@page import="com.groupware.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	NoticeDTO dto = (NoticeDTO)request.getAttribute("noticeDoc");
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
  
  <style type="text/css">
	#member_info{
		line-height: 31px;
		height: 27px;
 	    border-left: 1px solid #eff2f7;
    	border-right: 1px solid #eff2f7;
	}
	label {
		font-weight: 900;
		color: black;
	}
	
	#button2 {
		float:right; 
		width :100px;
	    border: none;
	    background: #394a59;
	    color: white;
	    border-radius: 5px;
	}
	.form-horizontal .form-group {
		margin-bottom : 0px;
		padding-bottom : 0px;
	}

	</style>
	
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
            <h3 class="page-header"><i class="fa fa-files-o"></i>공지사항 작성</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">메인</a></li>
              <li><i class="icon_document_alt"></i>공지사항</li>
              <li><i class="fa fa-files-o"></i>글쓰기</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
              		<div style="text-align: center">
                		<%= dto.getNum() %>
                	</div>
              </header>
              <div class="panel-body" style="padding:0">
                <div class="form">
                  <form class="form-validate form-horizontal" id="feedback_form" method="post" action="noticeAdd">
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-1">제목</label>
                      <div class="col-lg-10" id="member_info" style = "text-align:center; font-size:15px; border-right:0">
                        	<%= dto.getTitle() %>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="cname" class="control-label col-lg-1">이름</label>
                      <div class="col-lg-2" id="member_info">
                         	<%= dto.getMemberDto().get(0).getName() %>
                      </div>
                      <label for="cname" class="control-label col-lg-1" style="text-align: center">부서</label>
                      <div class="col-lg-2" id="member_info">
                         	<%= dto.getDeptDto().get(0).getDept_name() %>
                      </div>
                      <label for="cname" class="control-label col-lg-1" style="text-align: center">직급</label>
                      <div class="col-lg-2" id="member_info">
                         	<%= dto.getRankDto().get(0).getRank_name() %>
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-1">작성일</label>
                      <div class="col-lg-2" id="member_info">
                         	<%= dto.getDate() %>
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-1">첨부파일</label>
                      <div class="col-lg-10" id="member_info" style="border-right:0">
                        
                      </div>
                    </div>
                    <div class="form-group" style="height: 500px;">
                      <label for="cname" class="control-label col-lg-1" style="padding-top: 13%;">내용</label>
                      <div class="col-lg-10" style="padding-left:5%;">
                       	<%= dto.getContent() %>
                      </div>
                    </div>
                    <div class="form-group">
                      <div style="width:96%; margin:0 auto;">
                      	<button class="btn btn-primary" type="button" id="button2" style="float:left;" 
                      		onclick="location.href='notice'">목록</button>
                        <button class="btn btn-primary" type="button" id="button2" style="background-color:firebrick;"
                        	onclick="location.href='noticeDeleteAction?num=<%=dto.getNum()%>'">삭제</button>	
                        <button class="btn btn-primary" type="button" id="button2" style="background-color:cornflowerblue; margin-right: 20px;"
                        	onclick="location.href='noticeUpdateForm?num=<%=dto.getNum()%>'">수정</button>
                      </div>
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
  <!-- container section end -->

  <!-- javascripts -->
  <script src="resources/origin/js/jquery.js"></script>
  <script src="resources/origin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="resources/origin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/origin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!-- jquery validate js -->
  <script type="text/javascript" src="resources/origin/js/jquery.validate.min.js"></script>

  <!--custome script for all page-->
  <script src="resources/origin/js/scripts.js"></script>


</body>

</html>