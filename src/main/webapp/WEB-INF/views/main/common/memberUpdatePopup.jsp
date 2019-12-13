<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.groupware.dto.MemberDTO" %>
<%
	MemberDTO dto = (MemberDTO)request.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>

 <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="resources/origin/img/favicon.png">

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

  <!-- Custom -->
  <link href="resources/custom/css/popupGroup.css" rel="stylesheet" />
  <script src="resources/custom/js/join.js"></script>
  
  <script>
  function check_file(){
  	$(".fileName").text($("#file").val());
  }
  
  function update_submit(){
		var pw = $('input#pw').val();
		var checkPw = $('input#checkPw').val();

		if (pw != "" || pw != null) {
			$(".pw-text").css("margin-bottom", "16px");
			$(".pw-text").css("color", "rgb(255, 120, 203)");
			$(".pw-text").css("text-align", "center");
			$(".pw-text").text("↓ 비밀번호를 한 번 더 입력해주세요.");
		};
		if (pw == checkPw) {
			$("input[name=pw]").css("background-color", "#B0F6AC");
			$(".ok-text").css("margin-bottom", "16px");
			$(".ok-text").css("color", "#34aadc");
			$(".ok-text").css("text-align", "center");
			$(".ok-text").text("사용 가능한 비밀번호입니다.");
			$("input#update").removeAttr("disabled");
		} else if (pw != checkPw) {
			$("input[name=pw]").css("background-color", "#FFCECE");
			$(".ok-text").css("margin-bottom", "16px");
			$(".ok-text").css("color", "rgb(255, 120, 203)");
			$(".ok-text").css("text-align", "center");
			$(".ok-text").text("비밀번호를 확인해주세요.");
		};
  }
  </script>
  <style type="text/css">
	body{
		border: 1px solid #B0B6BE;
    	background: rgba(213,215,222,0.9);
	}
  	table{
  		width: 100%;
  	}

  	.file{
	    margin-top: 5px;
	    margin-bottom: 5px;
  	}
  </style>
	
</head>
<body>
<div class="login-wrap">
    <p>개인정보수정</p>
      	<form action="memberInfoUpdate" method = "post" enctype="multipart/form-data">
			<table>
				<tr>
					<td rowspan = "3" style="width:160px; height:200px;">
<%	
	if(dto.getPhoto() == null){
%>
				<img src="${pageContext.request.contextPath}/resources/upload/no.png" width="160" height="200">
<%
	} else {
%>
				<img src="${pageContext.request.contextPath}/resources/upload/<%=dto.getPhoto()%>" width="160" height="200">
<%
	}
%>
					</td>		
					<td>
						<div class="input-group" style="width:100%;">
				          <span class="input-group-addon"><i class="icon_profile"></i></span>
				          <input type="text" class="form-control" name = "name" value="<%= dto.getName()%>">
				        </div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group" style="width:100%;">
				          <span class="input-group-addon"><i class="icon_profile"></i></span>
				          <input type="text" class="form-control" name = "email" value="<%= dto.getEmail() %>">
				        </div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group" style="width:100%;">
				          <span class="input-group-addon"><i class="icon_profile"></i></span>
				          <input type="text" class="form-control" name = "phone" value="<%= dto.getPhone()%>">
				        </div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" class="file" name = "file" id = "file" onchange="readURL(this);">
						<input type="hidden" name="photoName" value="<%=dto.getPhoto() %>">
					</td>
				</tr>
				<tr>	
					<td colspan="2">
						<div class="input-group" style="width:100%;">
				          <span class="input-group-addon"><i class="icon_profile"></i></span>
				          <input type="text" class="form-control" name = "id" value="<%=dto.getId() %>"
				          		id = "idzon" oninput="check_id();">
				        </div>
				        <div class = "id-text">
				        </div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="input-group" style="width:100%;">
				          	<%=dto.getDeptDto().get(0).getDept_name()%> / <%=dto.getRankDto().get(0).getRank_name() %>
				        </div>
				        <div class = "group-text">
        				</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="input-group" style="width:100%;">
				          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
				          <input type="password" class="form-control" name = "pw" placeholder="비밀번호를 입력해주세요.."
				          		id = "pw" oninput="update_submit()">
				        </div>
				        <div class = "pw-text">
				        </div>
			        </td>
		        </tr>
		        <tr>
			        <td colspan="2">
				        <div class="input-group" style="width:100%;">
				          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
				          <input type="password" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요.."
				          		id = "checkPw" oninput="update_submit()">
				        </div>
				        <div class = "ok-text">
				        </div>
			        </td>
		        </tr>
			</table>
			<input class="btn btn-primary btn-lg btn-block" type="submit" id="update" value="수정" disabled/>
		</form>
</div>

</body>
<script type="text/javascript">
function readURL(input) {     
	if (input.files && input.files[0]) {         
		var reader = new FileReader();         
		reader.onload = function(e) {            
			$('#blah').attr('src', e.target.result)            
			.width(width)            
			.height(height);        
			};       
			reader.readAsDataURL(input.files[0]);     
			} 
	}
</script>
</body>
</html>