<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var newJQ = jQuery.noConflict();
</script>
<style type="text/css">
.check-i {
		float : right;
		margin-right : 5px;
		color : springgreen;
	}
.sidebar-my {
		border : 1px solid white;
	}
.sidebar-my button{
		font-size : 11px;
	}
.my-content{
	    width: 80px;
	    position: absolute;
	    top: 68px;
	    left: 95px;
	    color: white;
	}
.my-update {
	    background: #2e3b46;
	    border: 1px solid #6d859a;
	    color: white;
	}
</style>
<script>	
newJQ(function(){
	newJQ.ajax({
		type : "GET",
		url : "userInfo",
		success : function(data){
			if(data.userInfo.photo == null){
				newJQ("#side-photo").attr('src','${pageContext.request.contextPath}/resources/upload/no.png');
			}else{
				newJQ("#side-photo").attr('src','${pageContext.request.contextPath}/resources/upload/'+data.userInfo.photo);
			}
			newJQ("#side-photo").text(data.userInfo.photo);
			newJQ("#side-name").text(data.userInfo.name);
			newJQ("#side-dept").text(data.userInfo.deptDto[0].dept_name);
			newJQ("#side-rank").text(data.userInfo.rankDto[0].rank_name);
		}
	});
})
function showCount() {
	newJQ.ajax({
			type : "GET",
			url : "sidebar",
			success : function(data) {
				$("i#process").text(data.signProcessCount);
				$("i#stay").text(data.signStayCount);
				$("i#finish").text(data.signFinishCount);
			}
		});
};

function update_popup() {
	var url = "memberUpdatePopup";
	var name = "memberUpdatePopup";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)
};
</script>
</head>
<body>
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->

        <ul class="sidebar-menu">
        	<li class="sidebar-my">
			<img id = "side-photo" src="" width="90" height="120">
        		<div class="my-content">
        			<h5 style="font-weight: 500;" id="side-name"></h5>
        			<h6 id="side-dept"></h6>
        			<h6 id="side-rank"></h6>
        			<button type="button" class="my-update" onclick="update_popup()">개인정보수정</button>
        		</div>
        	</li>
			
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