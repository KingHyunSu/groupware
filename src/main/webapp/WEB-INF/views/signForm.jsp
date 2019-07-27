<%@page import="com.management.sign.SignDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SignDTO userInfo = (SignDTO)request.getAttribute("userInfo");
%>
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
	
	<script>
		$(document).ready(function(){
			
			$.ajax({
				type : "GET",
				url : "signPopup",
				dataType : "text",
				success : function(data) {
					console.log(data);
					var deptname = $('input#deptname').val();
					console.log(deptname);
				}
			})
		})
	</script>
</head>
<body>

	<button class = "add-button" type = "button" onclick="click_signPath();">일정 추가</button>

<%= userInfo.getName() %>
<%= userInfo.getDeptname() %>
<%= userInfo.getRankname() %>

		<input type = "hidden" id = "deptname" name="deptname" value = "">
		<input type = "hidden" id = "rankname" name="rankname" value = "">
		
		<input type = "hidden" id = "dept" name="dept" value = "">
		<input type = "hidden" id = "rank" name="rank" value = "">
		<input type = "hidden" id = "name" name="name" value = "">
		
		<div id = "signname">
		</div>
</body>
</html>