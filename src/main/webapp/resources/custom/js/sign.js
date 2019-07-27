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
	var option = "width = 920, height = 460 left = 200, top=30,location=no";
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
							"</td></tr>"		
				);
				
				$('div#hidden-sign',opener.document).append(
						"<input type = 'hidden' name = 'deptname' value = "+result.deptname+">"+
						"<input type = 'hidden' name = 'rankname' value = "+result.rankname+">"+
						"<input type = 'hidden' id = 'signname' name = 'name' value = "+result.name+">"+
						"<input type = 'hidden' name = 'dept' value = "+result.dept+">"+
						"<input type = 'hidden' name = 'rank' value = "+result.rank+">"
						);
			}
		});
};


// 확인 버튼
function click_Ok() {
	var deptname = $('input#deptname').val()
	var rankname = $('input#rankname').val()
	var dept = $('input#dept').val()
	var rank = $('input#rank').val()
	//var name = $('input#name').val()
	
	
	//console.log($('input#signname',opener.document).val());
	var list = new Array();
	$($('input#signname',opener.document).val()).each(function(index, item){
		list.push($(item).val());
	});
	//var list = $('input[name=name]').get();

	for(var i = 0; i < list.length; i++) {
		$('.sign',opener.document).append("<div class = 'sign-top'>"+list[i].innerHTML+"</div");
		alert(list[i]);
	};


	//window.opener.document.getElementById("deptname").value = deptname;
	//window.opener.document.getElementById("rankname").value = rankname;
	//window.opener.document.getElementById("dept").value = dept;
	//window.opener.document.getElementById("rank").value = rank;
	//window.opener.document.getElementById("name").value = name;
	
	//$('div#sign-zone',opener.document).append("<div>"+name+"</div>");

	window.close();
};

// 닫기 버튼
function close_group() {
	$('#popupGroup').hide();
	$(".login-wrap").show();
};



