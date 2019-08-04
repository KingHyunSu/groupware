//jquery tree
$(function() {
	$("#tree").treeview({
		collapsed : false,
		animated : "medium",
		control : "#sidetreecontrol",
		persist : "location"
	});
});

//signForm 결재경로 지정 클릭
function click_signPath() {
	var url = "signPopup";
	var name = "signPopup";
	var option = "width = 945, height = 460 left = 200, top=30,location=no";
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

//부서 클릭
function click_dept(name, value) {
	$(".rank-list").load("selectDeptShowMember?dept="+name);
	$('input#popup-dept').val(name);
	$('input#popup-deptname').val(value);
};

//직원 클릭
function click_rank(name, value) {
	var deptname = $('input#popup-deptname').val();
	var dept = $('input#popup-dept').val();
	var name = name;
	var rank = value;
	
	var signUser = JSON.stringify({name:name, dept:dept, rank:rank});
	
	 $.ajax({
			url : 'selectSignUser',
			type : "POST",
			data : signUser,
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			success : function(data) {

				var result = data.list;

				$('#signFinal').append("<tr id = 'tr'><td><select>" +
							"<option value = '1' selected>결재</option>"+
							"<option value = '2'>합의</option>"+
							"<option value = '3'>협의</option>"+
							"<td class='signFinal-dept'>"+
							"<button class='path-button' name='buttondept' value="+result.deptname+">"+result.deptname+"</button>"+
							"</td><td class='signFinal-name'>"+
							"<button class='path-button' name='buttonname' value="+result.name+">"+result.name+"</button>"+
							"</td><td class='signFinal-rank'>"+
							"<button class='path-button' name='buttonrank' value="+result.rankname+">"+result.rankname+"</button>"+
							"</td><td><button type='button' class='cancle-button' onclick='cancle(name);'>취소</buttom>"+
							"</td></tr>"		
				);

				$('div#sign-zone').append(
						"<input type = 'hidden' id = 'deptname' name = 'deptname' value = "+result.deptname+">"+
						"<input type = 'hidden' id = 'rankname' name = 'rankname' value = "+result.rankname+">"+
						"<input type = 'hidden' id = 'name' name = 'name' value = "+result.name+">"+
						"<input type = 'hidden' id = 'dept' name = 'dept' value = "+result.dept+">"+
						"<input type = 'hidden' id = 'sign' name = 'rank' value = "+result.rank+">"
						);
				
			}
		});
};

//확인 클릭
function click_Ok() {
	var deptname = $('input#deptname').val()
	var rankname = $('input#rankname').val()
	var name = $('input#name').val()
	var dept = $('input#dept').val()
	var rank = $('input#rank').val()
	
	$("#sign-add",opener.document).append("<li>"+
									"<div class = 'sign-left'>"+
	                    				"결<br>재" +
	                    			"</div>"+
	                    		"</li>");
	
	$("button[name=buttonname]").each(function(idx){
			var eqValue = $("button[name=buttonname]:eq("+idx+")").val();
		$('#sign-add',opener.document).append("<li>" +
									"<div class='sign'>" +
										"<div class='sign-top'>"+eqValue+"</div>" +
										"<div class='sign-middle'></div>" +
										"<div class='sign-bottom'></div>" +
									"</div>"+
								"</li>");
		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'signName' value = "+eqValue+">");
		});
	
	$("button[name=buttondept]").each(function(idx){
		var eqValue = $("button[name=buttondept]:eq("+idx+")").val();

		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'signDept' value = "+eqValue+">");
		});
	
	$("button[name=buttonrank]").each(function(idx){
		var eqValue = $("button[name=buttonrank]:eq("+idx+")").val();
		console.log(eqValue);
		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'signRank' value = "+eqValue+">");
		});


	window.close();
};

//결재 경로 취소
function cancle(name) {
	$('#tr'+name).remove();
}

//결재 하기
function click_signOK(){
	
	var pageNum = $('input#docNum').val();
	
	$.ajax({
		url : "signOK",
		data : pageNum,
		type : "POST",
		dataType : 'json',
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			alert("결재가 완료되었습니다.");
			location.href="signStayList";
			
		}
	})
}