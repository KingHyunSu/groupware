<%@page import="com.management.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDTO memberInfo = (MemberDTO)request.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.member-body {
	height : 400px;
	text-align : center;
}
.member-body table {
	width : 100%;
}
.member-body  td {
	border : 1px solid #CCC;
}
.member-body tr {
	height : 40px;
}
.left-td {
	width : 10%;
}
.right-td {
	width : 75%;
}
.left-td-2 {
	width : 10%;
	height : 160px;
}
.right-td-2 {
	height : 160px
}

</style>
</head>
<body>
<div class = "member-body">
	<table>
		<tr>
			<td class = "left-td">이름</td>
			<td class = "right-td"><%= memberInfo.getName() %></td>
			<td rowspan = "6"><img src="noImage.jpg"></td>
		</tr>
		<tr>
			<td class = "left-td">부서</td>
			<td class = "right-td"><%= memberInfo.getDeptname() %></td>
		</tr>
		<tr>
			<td class = "left-td">직급</td>
			<td class = "right-td"><%= memberInfo.getRankname() %></td>
		</tr>
		<tr>
			<td class = "left-td">H.P</td>
			<td class = "right-td"></td>
		</tr>
		<tr>
			<td class = "left-td">이메일</td>
			<td class = "right-td"></td>
		</tr>
		<tr>
			<td class = "left-td">주소</td>
			<td class = "right-td"></td>
		</tr>
		<tr>
			<td class = "left-td-2">특이사항</td>
			<td class = "right-td-2" colspan = "2"></td>
		</tr>
	</table>
</div>

</body>
</html>