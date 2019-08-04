<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
<!-- Tree -->
  	<link rel="stylesheet" href="resources/Tree/css/jquery.treeview.css" />
	<link rel="stylesheet" href="resources/Tree/css/screen.css" />
	
	<script src="resources/Tree/lib/jquery.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.treeview.js" type="text/javascript"></script>
	
	<link href="resources/custom/css/popupGroup.css" rel="stylesheet" />
	
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

</body>