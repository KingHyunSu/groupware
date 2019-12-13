<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
   <!-- zTree -->
	<link rel="stylesheet" href="resources/Tree/css/jquery.treeview.css" />
	<link rel="stylesheet" href="resources/Tree/css/screen.css" />
	
	<script src="resources/Tree/lib/jquery.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.treeview.js" type="text/javascript"></script>
	
	<!-- custom -->
	<link href="resources/custom/css/signPopup.css" rel="stylesheet" />
	<script src="resources/custom/js/sign.js" type="text/javascript"></script>

</head>
<body>

	<!-- popupGroup -->
<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 결재경로 지정 </h1>
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
		<div class = "rank">
			<div class = "rank-head">
				직급 목록
			</div>
			<div class = "rank-list">
				
			</div>
		</div>
		<div class = "final">
			<div class = "rank-head">
				결재자
			</div>
				<table id = "signFinal" class = "signFinal">
					

				</table>
		</div>
		<div id="sign-zone">
		</div>


	<div class = "group-foot">
			<button class = "ok-button" type= "button" onclick="click_Ok();">확인</button>
	</div>
</div>
</body>
</html>