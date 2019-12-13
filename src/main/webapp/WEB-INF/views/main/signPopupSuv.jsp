<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.groupware.dto.MemberDTO" %>
<%
	List<MemberDTO> list = (ArrayList<MemberDTO>)request.getAttribute("list");
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

</head>
<body>

<table>
<%
	for(int i=0; i < list.size(); i++) {
		MemberDTO dto = list.get(i);
%>
	<tr>
		<td class = "right-td">
			<div class = "rank-list">
				<button type = "button" class = "rank-button-none" name = <%=dto.getRankDto().get(0).getRank_name() %> value = <%=dto.getRank_no() %> 
					disabled >
					<%=dto.getRankDto().get(0).getRank_name() %>
				</button>
			</div>
		</td>
		<td>
				<button type = "button" class = "rank-button" name = <%=dto.getName() %> value = <%=dto.getId() %> 
					onclick="click_rank(name,value);">
					<%=dto.getName()%> 
				</button>
		</td>
	</tr>

<%
	}
%>
</table>


</body>
</html>