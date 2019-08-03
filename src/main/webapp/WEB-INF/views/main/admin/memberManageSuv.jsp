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
</head>
<body>
<%
	for(int i = 0; i < list.size(); i++) {
		MemberDTO dto = list.get(i);
		
		int no = i+1;
%>
<div class="listHiddenField pull-left field60"><%= no %></div>
<div class="listHiddenField pull-right field60">
	<select name = "delete">
		<option selected>선택</option>
		<option value = "0">삭제</option>
	</select>
</div>
<div class="listHiddenField pull-right field100" style="width:20%;">
	<select name = "dept">
		<option selected><%= dto.getDeptname() %></option>
		<option value = "1">총무</option>
		<option value = "2">회계</option>
		<option value = "3">인사</option>
		<option value = "4">영업본부</option>
		<option value = "5">영업 1팀</option>
		<option value = "6">영업 2팀</option>
		<option value = "7">디자인</option>
		<option value = "8">IT</option>
		<option value = "9">개발 1팀</option>
		<option value = "10">개발 2팀</option>
		<option value = "11">개발 3팀</option>
	</select>
</div>
<div class="listHiddenField pull-right field100" style="width:20%;">
	<select name = "rank">
		<option selected><%= dto.getRankname() %></option>
		<option value = "1">이사</option>
		<option value = "2">부장</option>
		<option value = "3">과장</option>
		<option value = "4">대리</option>
		<option value = "5">주임</option>
		<option value = "6">사원</option>
	</select>
</div>
<div class="listTitle" style="text-align:center;"><%= dto.getName() %></div>
<%
	}
%>
</body>
</html>