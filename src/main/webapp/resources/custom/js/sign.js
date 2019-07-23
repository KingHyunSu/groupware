//jquery tree
$(function() {
	$("#tree").treeview({
		collapsed : false,
		animated : "medium",
		control : "#sidetreecontrol",
		persist : "location"
	});
});

//add schedule popup open
function click_add() {
	var url = "schedulePopup";
	var name = "schedulePopup";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)
};

// 패스워드 체크
function check_pw() {

	var pw = $('input#pw').val();
	var checkPw = $('input#checkPw').val();

	if (pw != "" || pw != null) {
		$(".pw-text").css("margin-bottom", "16px");
		$(".pw-text").css("color", "rgb(255, 120, 203)");
		$(".pw-text").css("text-align", "center");
		$(".pw-text").text("↓ 비밀번호를 한 번 더 입력해주세요.");
	};
	if (pw == checkPw) {
		$("input[name=pw]").css("background-color", "#B0F6AC");
		$(".ok-text").css("margin-bottom", "16px");
		$(".ok-text").css("color", "#34aadc");
		$(".ok-text").css("text-align", "center");
		$(".ok-text").text("사용 가능한 비밀번호입니다.");
		$("button#joinSubmit").removeAttr("disabled");
	} else if (pw != checkPw) {
		$("input[name=pw]").css("background-color", "#FFCECE");
		$(".ok-text").css("margin-bottom", "16px");
		$(".ok-text").css("color", "rgb(255, 120, 203)");
		$(".ok-text").css("text-align", "center");
		$(".ok-text").text("비밀번호를 확인해주세요.");
		$("button#joinSubmit").attr("disabled", "true");
	}
	;
};

// 부서/직급 선택하기 클릭
function click_group() {
	if ($("#popupGroup").css("display") == "none") {
		$(".login-wrap").hide();
		$('#popupGroup').show();
	} else {
		$('#popupGroup').hide();
		$(".login-wrap").show();
	}
};

// 부서 클릭
function click_dept(name, value) {

	var rank = name;

	
	 $.ajax({
			url : 'selectDeptShowMember',
			type : "POST",
			data : rank,
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			success : function(data) {

				$.each(data.list ,function(idx,val){
				console.log(idx + "," + val);
				console.log(val);
				$(".rank-list").append("<button type='button' class='rank-button'>"
												+val.name+"&nbsp;&nbsp;&nbsp;"+val.rankname+
												"</button>"
												);
				});
			}
		});
};

// 직급 클릭
function click_rank(name, value) {
	console.log(name);
	console.log(value);
	var rank = name;
	
	console.log(rank);
	
	 $.ajax({
			url : 'selectDeptShowMember',
			type : "POST",
			data : rank,
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
					alert("성공");
					//var result = data.json;
					$.each(data, function(key, val){
						//alert(key+":"+val.subject);
						//console.log(key+":"+val.subject);
						$("#result").append("<tr><th>"+val.name+"</th><th>"+val.rankname+"</th></tr>");
					});
				},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);
			}
		});
};

// 확인 버튼
function click_Ok() {
	var realDept = $("input#dept").val();
	var realRank = $("input#rank").val();
	var deptName = $("input#deptName").val();
	var rankName = $("input#rankName").val();

	$("input#realDept").val(realDept);
	$("input#realRank").val(realRank);

	$(".group-text").css("margin-bottom", "16px");
	$(".group-text").css("color", "#34aadc");
	$(".group-text").css("text-align", "center");
	$(".group-text").text(deptName + "/" + rankName);

	$('#popupGroup').hide();
	$(".login-wrap").show();

};

// 닫기 버튼
function close_group() {
	$('#popupGroup').hide();
	$(".login-wrap").show();
};


function formSubmit(){
	
	var dept = name
	
	 $.ajax({
			url : 'selectDeptShowMember',
			type : "POST",
			data : dept,
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
					alert("성공");
					//var result = data.json;
					$.each(data, function(key, val){
						//alert(key+":"+val.subject);
						//console.log(key+":"+val.subject);
						$("#result").append("<tr><th>"+val.name+"</th><th>"+val.rankname+"</th></tr>");
					});
				},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);
			}
		});
	}
