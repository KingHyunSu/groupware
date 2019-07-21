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
   <!-- Tree -->
  <link rel="stylesheet" href="resources/Tree/css/jquery.treeview.css" />
  <link rel="stylesheet" href="resources/Tree/css/screen.css" />
  <script src="resources/Tree/lib/jquery.js" type="text/javascript"></script>
  <script src="resources/Tree/lib/jquery.cookie.js" type="text/javascript"></script>
  <script src="resources/Tree/lib/jquery.treeview.js" type="text/javascript"></script>
  <!-- Custom -->
  <link href="resources/custom/css/popupGroup.css" rel="stylesheet" />
  <script src="resources/custom/js/Ajax.js"></script>
  
</head>

<body class="login-img3-body">

  <div class="container">

    <form class="login-form" name = "joinForm" action="joinAction" method = "post" onsubmit="return formCheck();">
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" class="form-control" name = "id" placeholder="아이디를 입력해주세요.." autofocus
          		id = "idzon" oninput="check_id();">
        </div>
        <div class = "id-text">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" class="form-control" name = "name" placeholder="이름을 입력해주세요.." autofocus>
        </div>
        <div class="input-group">
          <input type="button" class="form-control" name = "group" autofocus onclick="click_group();"
          		style="border:0; margin-left:50px; background:#D6E3F4; border-radius:10px; color:white;" 
          		value = "부서/직급 선택하기">
        </div>
        <div class = "group-text">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" class="form-control" name = "pw" placeholder="비밀번호를 입력해주세요.."
          		id = "pw" oninput="check_pw();">
        </div>
        <div class = "pw-text">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" class="form-control" name = "pw" placeholder="비밀번호를 한번 더 입력해주세요.."
          		id = "checkPw" oninput="check_pw();">
        </div>
        <div class = "ok-text">
        </div>
        <button class="btn btn-primary btn-lg btn-block" type="submit" id = "joinSubmit" disabled>가입</button>
      </div>
      <input type = "hidden" id = "dept" name = "formDept" value = "">
      <input type = "hidden" id = "rank" name = "formRank" value = "">
    </form>
  </div>


	<!-- popupGroup -->
<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 부서/직급 선택 </h1>
		<button class = "close-button" type = "button" onclick="close_group();">닫기</button>
	</div>
	<div class = "group-body">
		<div class = "dept">
			<div class = "dept-head">
				부서 목록
			</div>
			<div class = "dept-body">
				<div id="sidetree">
					<ul id="tree"> 
						
						<li>
							<input class = "tree-button" type = "button" name = "1" value = "총무" onclick="click_dept(name,value);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "2" value = "회계" onclick="click_dept(name,value);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "3" value = "인사" onclick="click_dept(name,value);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "4" value = "영업본부" onclick="click_dept(name,value);">
								<ul>
									<li>
										<input class = "tree-button-sub" type = "button" name = "5" value = "영업1팀" onclick="click_dept(name,value);">
									</li>
								</ul>
								<ul>
									<li>
										<input class = "tree-button-sub" type = "button" name = "6" value = "영업2팀" onclick="click_dept(name,value);">
									</li>
								</ul>
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "7" value = "디자인" onclick="click_dept(name,value);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "8" value = "IT" onclick="click_dept(name,value);">
								<ul>
									<li>
										<input class = "tree-button-sub" type = "button" name = "9" value = "개발1팀" onclick="click_dept(name,value);">
									</li>
								</ul>
								<ul>
									<li>
										<input class = "tree-button-sub" type = "button" name = "10" value = "개발2팀" onclick="click_dept(name,value);">
									</li>
								</ul>
								<ul>
									<li>
										<input class = "tree-button-sub" type = "button" name = "11" value = "개발3팀" onclick="click_dept(name,value);">
									</li>
								</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class = "position">
			<div class = "position-head">
				직급 목록
			</div>
			<div class = "position-body">
				<input class= "position-button" type = "button" name = "1" value = "이사" onclick="click_rank(name,value);">
				<input class= "position-button" type = "button" name = "2" value = "부장" onclick="click_rank(name,value);">
				<input class= "position-button" type = "button" name = "3" value = "과장" onclick="click_rank(name,value);">
				<input class= "position-button" type = "button" name = "4" value = "대리" onclick="click_rank(name,value);">
				<input class= "position-button" type = "button" name = "5" value = "주임" onclick="click_rank(name,value);">
				<input class= "position-button" type = "button" name = "6" value = "사원" onclick="click_rank(name,value);">
				
				<!-- <ul>
					<li>부장</li>
					<li>과장</li>
					<li>대리</li>
					<li>주임</li>
					<li>사원</li>
				</ul> -->
			</div>
		</div>
		<div class = "group-foot">
			<div class = "result-view-zone">
				<div class = "result-dept">
				</div>
				<div class = "result-rank">
				</div>
			</div>
		</div>
		<button class = "ok-button" type= "button" onclick="click_Ok();">확인</button>
		
		<input type = "hidden" name = "dept" id = "dept" value = "">
		<input type = "hidden" name = "rank" id = "rank" value = "">
		<input type = "hidden" name = "deptName" id = "deptName" value = "">
		<input type = "hidden" name = "rankName" id = "rankName" value = "">
	</div>	
</div>

</body>
</html>
