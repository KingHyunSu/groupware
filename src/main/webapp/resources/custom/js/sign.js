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
//function click_dept1(name, value) {
//
//	var rank = name;
//
//	
//	 $.ajax({
//			url : 'selectDeptShowMember',
//			type : "POST",
//			data : rank,
//			dataType : 'json',
//			contentType : "application/json; charset=UTF-8",
//			success : function(data) {
//
//				$.each(data.list ,function(idx,val){
//				console.log(idx + "," + val);
//				console.log(val);
//				$(".rank-list").append("<button type='button' class='rank-button'>"
//												+val.name+"&nbsp;&nbsp;&nbsp;"+val.rankname+
//												"</button>"
//												);
//				});
//			}
//		});
//};


function click_dept(name, value) {
	$(".rank-list").load("selectDeptShowMember?dept="+name);
	$('input#dept').val(name);
	$('input#deptname').val(value);
};

function click_rank(name, value) {
	var deptname = $('input#deptname').val();
	var dept = $('input#dept').val();
	var name = name;
	var rank = value;
	
	var signUser = JSON.stringify({name:name, dept:dept, rank:rank});
//	$('input#name').val(name);
//	$('input#rank').val(value);
	
	 $.ajax({
			url : 'selectSignUser',
			type : "POST",
			data : signUser,
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data);
				var result = data.list;
				console.log(result.name);
				console.log(result.rankname);
				console.log(result.deptname);
				$('#signFinal').append("<tr><td><select>" +
							"<option value = '1' selected>결재</option>"+
							"<option value = '2'>합의</option>"+
							"<option value = '3'>협의</option>"+
							"<td class='signFinal-dept'>"
							+result.deptname+
							"</td><td class='signFinal-name'>"
							+result.name+
							"</td><td class='signFinal-rank'>"
							+result.rankname+
							"</td></tr>");
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

