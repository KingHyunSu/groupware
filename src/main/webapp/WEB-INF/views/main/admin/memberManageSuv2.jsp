<%@page import="com.groupware.dto.MemberDTO"%>
<%@page import="com.groupware.dto.DeptDTO"%>
<%@page import="com.groupware.dto.RankDTO"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDTO memberInfo = (MemberDTO)request.getAttribute("memberInfo");
	List<DeptDTO> deptList = (List<DeptDTO>)request.getAttribute("deptList");
	List<RankDTO> rankList = (List<RankDTO>)request.getAttribute("rankList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
select {
	width: 80px;
    height: 25px;
}
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
	<form action="memberUpdate" method="post">
		<input type="hidden" name="id" value="<%=memberInfo.getId()%>">
		<table>
			<tr>
<%
	if(memberInfo.getPhoto() == null){
%>
				<td rowspan = "5"><img src="${pageContext.request.contextPath}/resources/upload/no.png" width="160" height="200"></td>
<%
	} else {
%>
				<td rowspan = "5"><img src="${pageContext.request.contextPath}/resources/upload/<%=memberInfo.getPhoto()%>" width="160" height="200"></td>
<%
	}
%>
				<td class = "left-td">이름</td>
				<td class = "right-td" colspan="3">
					<input type="text" name="name" value="<%= memberInfo.getName() %>" style="border: 0;">
				</td>
		
			</tr>
			<tr>
				<td class = "left-td">부서</td>
				<td style="width:40%;">
					<select name = "dept_no">
						<option value = "<%=memberInfo.getDept_no()%>" selected="selected">
							<%= memberInfo.getDeptDto().get(0).getDept_name() %>
						</option>
<%
	for(int i = 0; i < deptList.size(); i++){
		DeptDTO dto = deptList.get(i);
%>
						<option value = "<%=dto.getDept_no()%>">
							<%= dto.getDept_name() %>
						</option>
<%
	}
%>
					</select>
				</td>
				<td class = "left-td">직급</td>
				<td style="width:40%;">
					<select name = "rank_no">
						<option value = "<%=memberInfo.getRank_no()%>" selected="selected">
							<%= memberInfo.getRankDto().get(0).getRank_name() %>
						</option>
<%
	for(int i = 0; i < rankList.size(); i++){
		RankDTO dto = rankList.get(i);
%>
						<option value = "<%=dto.getRank_no()%>">
							<%= dto.getRank_name() %>
						</option>
<%
	}
%>
					</select>
				</td>
			</tr>
	
			<tr>
				<td class = "left-td">휴대전화</td>
				<td class = "right-td" colspan="3">
					<input type="text" name="phone" value="<%=memberInfo.getPhone() %>" style="border: 0;">
				</td>
			</tr>
			<tr>
				<td class = "left-td">이메일</td>
				<td class = "right-td" colspan="3">
					<input type="text" name="email" value="<%=memberInfo.getEmail() %>" style="border: 0;">
				</td>
			</tr>
			<tr>
				<td class = "left-td">주소</td>
				<td class = "right-td" colspan="3">
				</td>
			</tr>
			<tr>
				<td class = "left-td-2">특이사항</td>
				<td class = "right-td-2" colspan = "4"></td>
			</tr>
		</table>
		<input type="submit" value="저장">
	</form>
</div>

</body>
</html>