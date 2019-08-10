<%@page import="com.management.member.MemberDTO"%>
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
		<%= dto.getDeptname() %>
	</div>
	<div class="listHiddenField pull-right field100" style="width:20%;">
		<%= dto.getRankname() %>
	</div>
	<div class="listTitle" style="text-align:center;">
		<button type = "button" class = "name" name = <%= dto.getName() %> onclick = "click_name(name);"><%= dto.getName() %></button>
	</div>
<%
	}
%>
</body>
</html>