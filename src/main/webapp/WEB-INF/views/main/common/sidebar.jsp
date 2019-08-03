<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.check-i {
		float : right;
		margin-right : 5px;
		color : springgreen;
	}
</style>
<script>	
function showCount() {
		$.ajax({
			type : "GET",
			url : "sidebar",
			success : function(data) {
				$("i#process").text(data.signProcessCount);
				$("i#stay").text(data.signStayCount);
				$("i#finish").text(data.signFinishCount);
			}
		});
};
</script>
</head>
<body>
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="main">
                          <i class="icon_house_alt"></i>
                          <span>메인</span>
                      </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="" onclick="showCount();">
                          <i class="icon_document_alt"></i>
                          <span>결재</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="sign">기안문서 작성</a></li>
              <li><a class="" href="signProcess">결재 진행 <i class="check-i" id="process"></i>
              	</a></li>
              <li><a class="" href="signStay">결재 대기 <i class="check-i" id="stay"></i>
              	</a></li>
              <li><a class="" href="signFinish">결재 완료 <i class="check-i" id ="finish"></i>
              	</a></li>
            </ul>
          </li>        
          <li>
            <a class="" href="schedule">
                          <i class="icon_table"></i>
                          <span>일정 관리</span>
                      </a>
          </li>         
          <li>
            <a class="" href="notice">
                          <i class="icon_documents_alt"></i>
                          <span>공지사항</span>
                      </a>
          </li>
        <sec:authorize access = "hasAnyRole('ADMIN')">
          <li class="sub-menu">
            <a href="javascript:;" class="" onclick="showCount();">
                          <i class="fa fa-group"></i>
                          <span>직원 관리</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="joinManage">회원가입 요청</a></li>
              <li><a class="" href="memberManage">부서/직급 변경</a></li>
            </ul>
          </li>   
		</sec:authorize>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
</body>
</html>