<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/test.css" rel="stylesheet" />

  <!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="resources/modify/js/Ajax.js"></script>
   <!-- zTree -->
  <link href="resources/zTree/zTreeStyle.css" rel="stylesheet">
  <script src="resources/zTree/jquery.ztree.core.js"></script>

	<link rel="stylesheet" href="resources/Tree/css/jquery.treeview.css" />
	<link rel="stylesheet" href="resources/Tree/css/screen.css" />
	
	<script src="resources/Tree/lib/jquery.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.treeview.js" type="text/javascript"></script>

<!-- test -->
<script>

$(function() {
	$("#tree").treeview({
		collapsed: false,
		animated: "medium",
		control:"#sidetreecontrol",
		persist: "location"
	});
});

function click_dept(name) {
	
	var detpNum = name;
	console.log(detpNum);
	
	$.ajax({
		data : detpNum,
		url : "idCheck",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			console.log(data.check);
			
			if(data.check > 0) {
				$("#check").prop("disabled", true);
				$("#idzon").css("background-color", "#FFCECE");
				$(".add-text").css("margin-bottom", "16px");
				$(".add-text").css("color", "rgb(255, 168, 203)");
				$(".add-text").css("text-align", "center");
				$(".add-text").html("이미 사용중인 아이디 입니다.");						
			}else if(data.check == 0){
				$("#idzon").css("background-color", "#B0F6AC");
				$("#check").prop("disabled", false);
				$(".add-text").css("margin-bottom", "16px");
				$(".add-text").css("color", "#34aadc");
				$(".add-text").css("text-align", "center");
				$(".add-text").html("사용 가능한 아이디 입니다.");
				}
			}
		});
	};
</script>
</head>
<body>
<div class = "group">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 부서/직급 선택 </h1>
	</div>
	<div class = "group-body">
		<div class = "dept">
			<div class = "dept-head">
				부서
			</div>
			<div class = "dept-body">
				<div id="sidetree">
					<div class="treeheader">&nbsp;</div>
				
					<div id="sidetreecontrol"></div>
					<ul id="tree">
						<li>
							<strong>test1</strong>
							<ul>
								<li>
									<input class = "tree-button" type = "button" name = "1" value = "test1.1" onclick="click_dept(name);">
								</li>
							</ul>
						</li>
						<li>
							<strong>test2</strong>
							<ul>
								<li>
									<input class = "tree-button" type = "button" name = "2" value = "test2.1" onclick="click_dept(name);">
								</li>
							</ul>
							<ul>
								<li>
									<input class = "tree-button" type = "button" name = "3" value = "test2.2" onclick="click_dept(name);">
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class = "position">
			<div class = "position-head">
				직급
			</div>
			<div class = "position-body">
				<input class= "position-button" type = "button" name = "부장" value = "부장">
				<input class= "position-button" type = "button" name = "과장" value = "과장">
				<input class= "position-button" type = "button" name = "대리" value = "대리">
				<input class= "position-button" type = "button" name = "주임" value = "주임">
				<input class= "position-button" type = "button" name = "사원" value = "사원">
				
				<!-- <ul>
					<li>부장</li>
					<li>과장</li>
					<li>대리</li>
					<li>주임</li>
					<li>사원</li>
				</ul> -->
			</div>
		</div>
		
	</div>
</div>
</body>
</html>