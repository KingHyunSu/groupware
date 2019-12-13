<%@page import="com.groupware.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberDTO> list = (ArrayList<MemberDTO>)request.getAttribute("deptMemberList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.name {
	 border: none;
    background: white;
    color: blue;
	}
</style>
</head>
<body>
<%
	for(int i = 0; i < list.size(); i++) {
		MemberDTO dto = list.get(i);
		
		int no = i+1;
%>
	<div class="listHiddenField pull-left field60"><%= no %></div>
	<div class="listHiddenField pull-right field100" style="width:20%;">
		<%= dto.getDeptDto().get(0).getDept_name()%>
	</div>
	<div class="listHiddenField pull-right field100" style="width:20%;">
		<%= dto.getRankDto().get(0).getRank_name() %>
	</div>
	<div class="listTitle" style="text-align:center;">
		<button type = "button" class = "name" name = <%= dto.getId() %> onclick = "click_name(name);"><%= dto.getName() %></button>
	</div>
<%
	}
%>
</body>
</html>