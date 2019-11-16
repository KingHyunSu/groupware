<%@page import="com.groupware.dto.MemberDTO"%>
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
	background: #F7F7F7;
	width : 10%;
}
.right-td {
	width : 75%;
}
.left-td-2 {
	width : 10%;
	height : 160px;
	background: #F7F7F7;
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
			<td rowspan = "5"><img src="${pageContext.request.contextPath}/resources/upload/<%=memberInfo.getPhoto()%>" width="160" height="200"></td>
			<td class = "left-td">이름</td>
			<td class = "right-td" colspan="3"><%= memberInfo.getName() %></td>
	
		</tr>
		<tr>
			<td class = "left-td">부서</td>
			<td style="width:40%;"><%= memberInfo.getDeptDto().get(0).getDept_name() %></td>
			<td class = "left-td">직급</td>
			<td style="width:40%;"><%= memberInfo.getRankDto().get(0).getRank_name() %></td>
		</tr>

		<tr>
			<td class = "left-td">휴대전화</td>
			<td class = "right-td" colspan="3"></td>
		</tr>
		<tr>
			<td class = "left-td">이메일</td>
			<td class = "right-td" colspan="3"></td>
		</tr>
		<tr>
			<td class = "left-td">주소</td>
			<td class = "right-td" colspan="3"></td>
		</tr>
		<tr>
			<td class = "left-td-2">특이사항</td>
			<td class = "right-td-2" colspan = "4"></td>
		</tr>
	</table>
</div>

</body>
</html>