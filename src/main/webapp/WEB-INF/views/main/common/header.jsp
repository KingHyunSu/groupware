<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.logout {
		    background: none;
		    border: none;
		    color: white;
		    height: 45px;
		}
	</style>
</head>
<body>
<header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>

      <!--logo start-->
      <a href="main" class="logo">그룹 <span class="lite">웨어</span></a>
      <!--logo end-->

      <div class="top-nav notification-row">
        <!-- notificatoin dropdown start-->
        <ul class="nav pull-right top-menu">

          
          <li>
	          	<sec:authorize access="isAuthenticated()">
				    <form action="logout" method="POST">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				        <button class = "logout" type="submit">로그아웃</button>
				    </form>
				</sec:authorize>
          </li>

        </ul>
        <!-- notificatoin dropdown end-->
      </div>
    </header>
</body>
</html>