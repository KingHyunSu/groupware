<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/test.css" rel="stylesheet" />

  <!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="resources/modify/js/Ajax.js"></script>
   <!-- zTree -->
  <link href="resources/zTree/zTreeStyle.css" rel="stylesheet">
  <script src="resources/zTree/jquery.ztree.core.js"></script>

	<link rel="stylesheet" href="resources/Tree/css/jquery.treeview.css" />
	<link rel="stylesheet" href="resources/Tree/css/screen.css" />
	
	<script src="resources/Tree/lib/jquery.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="resources/Tree/lib/jquery.treeview.js" type="text/javascript"></script>

<!-- test -->
<script>

$(function() {
	$("#tree").treeview({
		collapsed: false,
		animated: "medium",
		control:"#sidetreecontrol",
		persist: "location"
	});
});

function click_dept(name) {
	
	var deptNum = name;
		
	$.ajax({
		data : deptNum,
		url : "selectDeptName",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			var result = JSON.parse(data);
			$(".result-dept").html("<" + result.deptname);
			$("input#dept").val(deptNum);
			}
		});
	};
	
	
	function click_rank(name) {
		
		var rankNum = name;
			
		$.ajax({
			data : rankNum,
			url : "selectRankName",
			type : "POST",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				var result = JSON.parse(data);
				$(".result-rank").html(result.rankname + ">");
				$("input#rank").val(rankNum);
				}
			});
		};
		
		function click_Ok() {
		//	var realDept = $("input#dept").val(rankNum);
		//	var realRank = $("input#rank").val(rankNum);
			
		//	$("input#realDept").val(realDept);
		//	$("input#realRank").val(realRank);
		$('body').css("background", "rgba(0,0,0,0)");
		$('#popupGroup').hide();
			};
		
		function click_group(){
		    if($("#popupGroup").css("display") == "none"){   
		    	 $('body').css("background", "rgba(0,0,0,0.2)");
		        $('#popupGroup').show();  
		    } else {  
		    	 $('body').css("background", "rgba(0,0,0,0)");
		        $('#popupGroup').hide();  
		    }
		};
		
		function close_group(){
			$('#popupGroup').hide();
		};
</script>
</head>
<body>

<div>
	<button type = "button" id = "choiseGroup" onclick="click_group();">선택</button>
</div>

<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "zTree-h1"> 부서/직급 선택 </h1>
		<button class = "close-button" type = "button" onclick="close_group();">닫기</button>
	</div>
	<div class = "group-body">
		<div class = "dept">
			<div class = "dept-head">
				부서 목록
			</div>
			<div class = "dept-body">
				<div id="sidetree">
					<div class="treeheader">&nbsp;</div>
	
					<ul id="tree"> 
						<h3 class= "zTree-h3"> 목록 </h3>
						<li>
							<input class = "tree-button" type = "button" name = "1" value = "총무" onclick="click_dept(name);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "2" value = "회계" onclick="click_dept(name);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "3" value = "인사" onclick="click_dept(name);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "4" value = "영업본부" onclick="click_dept(name);">
								<ul>
									<li>
										<input class = "tree-button" type = "button" name = "5" value = "영업1팀" onclick="click_dept(name);">
									</li>
								</ul>
								<ul>
									<li>
										<input class = "tree-button" type = "button" name = "6" value = "영업2팀" onclick="click_dept(name);">
									</li>
								</ul>
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "7" value = "디자인" onclick="click_dept(name);">
						</li>
						<li>
							<input class = "tree-button" type = "button" name = "8" value = "IT" onclick="click_dept(name);">
								<ul>
									<li>
										<input class = "tree-button" type = "button" name = "9" value = "개발1팀" onclick="click_dept(name);">
									</li>
								</ul>
								<ul>
									<li>
										<input class = "tree-button" type = "button" name = "10" value = "개발2팀" onclick="click_dept(name);">
									</li>
								</ul>
								<ul>
									<li>
										<input class = "tree-button" type = "button" name = "11" value = "개발3팀" onclick="click_dept(name);">
									</li>
								</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class = "position">
			<div class = "position-head">
				직급 목록
			</div>
			<div class = "position-body">
				<input class= "position-button" type = "button" name = "1" value = "이사" onclick="click_rank(name);">
				<input class= "position-button" type = "button" name = "2" value = "부장" onclick="click_rank(name);">
				<input class= "position-button" type = "button" name = "3" value = "과장" onclick="click_rank(name);">
				<input class= "position-button" type = "button" name = "4" value = "대리" onclick="click_rank(name);">
				<input class= "position-button" type = "button" name = "5" value = "주임" onclick="click_rank(name);">
				<input class= "position-button" type = "button" name = "6" value = "사원" onclick="click_rank(name);">
				
				<!-- <ul>
					<li>부장</li>
					<li>과장</li>
					<li>대리</li>
					<li>주임</li>
					<li>사원</li>
				</ul> -->
			</div>
		</div>
		<div class = "group-foot">
			<div class = "result-view-zone">
				<div class = "result-dept">
				</div>
				<div class = "result-rank">
				</div>
			</div>
		</div>
		<button class = "check-button" type= "button" onclick="click_Ok();">확인</button>
		
		<input type = "hidden" name = "dept" id = "dept" value = "">
		<input type = "hidden" name = "rank" id = "rank" value = "">
	</div>	
</div>


</body>
</html>