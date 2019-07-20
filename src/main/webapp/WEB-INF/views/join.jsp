<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="resources/origin/img/favicon.png">

  <title>Login Page 2 | Creative - Bootstrap 3 Responsive Admin Template</title>

  <!-- Bootstrap CSS -->
  <link href="resources/origin/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/origin/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/origin/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/origin/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="resources/origin/css/style.css" rel="stylesheet">
  <link href="resources/origin/css/style-responsive.css" rel="stylesheet" />
  <!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="resources/modify/js/Ajax.js"></script>
   <!-- zTree -->
  <link href="resources/zTree/zTreeStyle.css" rel="stylesheet">
  <script src="resources/zTree/jquery.ztree.core.js"></script>


<!-- test -->
<script>
	var zNodes = [
		{ id : "1", name : "TEST1", open : true },
		{ id : "11", pId : "1", name : "TEST1.1"},
		{ id : "12", pId : "1", name : "TEST1.2"},
		{ id : "2", name : "TEST2", open : true },
		{ id : "21", pId : "2", name : "TEST2.1"},
		{ id : "22", pId : "2", name : "TEST2.2"},
	];
	var setting = {
			data : {
				simpleData : {
					enable :true
				}
			}
	};
	
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	
	
</script>
</head>

<body class="login-img3-body">

  <div class="container">

    <form class="login-form" action="joinAction" method = "post">
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" class="form-control" name = "id" placeholder="아이디를 입력해주세요.." autofocus
          		id = "idzon" oninput="checkId()">
        </div>
        <div class = "add-text">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" class="form-control" name = "name" placeholder="이름을 입력해주세요.." autofocus>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <ul id = "treeDemo" class = "ztree"></ul>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" class="form-control" name = "pw" placeholder="비밀번호를 입력해주세요..">
          <input id = "csrf" name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
        </div>
        <button class="btn btn-info btn-lg btn-block" type="submit">가입</button>
      </div>
    </form>
  </div>

	
</body>
</html>
