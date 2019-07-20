function checkId(){

	var idCheck = 0;
	
	var inputed = $('input#idzon').val();
	console.log(inputed);
	
	$.ajax({
		data : inputed,
		url : "idCheck",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			var result = JSON.parse(data);
			//console.log(result.check);
			//console.log(data.check);
			
			if(result.check > 0) {
				$("#idzon").css("background-color", "#FFCECE");
				$(".add-text").css("margin-bottom", "16px");
				$(".add-text").css("color", "rgb(255, 168, 203)");
				$(".add-text").css("text-align", "center");
				$(".add-text").text("이미 사용중인 아이디 입니다.");			
			}else if(result.check == 0){
				$("#idzon").css("background-color", "#B0F6AC");
				$(".add-text").css("margin-bottom", "16px");
				$(".add-text").css("color", "#34aadc");
				$(".add-text").css("text-align", "center");
				$(".add-text").text("사용 가능한 아이디 입니다.");
				}
			}
		});
	};
	
function click_group(){
    if($("#popupGroup").css("display") == "none"){   
    	 $(".login-wrap").hide();
        $('#popupGroup').show();  
    } else {  
        $('#popupGroup').hide();
        $(".login-wrap").show();
    }
};

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
		url : "join/selectDeptName",
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
		url : "join/selectRankName",
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
		var realDept = $("input#dept").val();
		var realRank = $("input#rank").val();
			
		$("input#realDept").val(realDept);
		$("input#realRank").val(realRank);
		$('#popupGroup').hide();
		$(".login-wrap").show();
};

function close_group(){
	$('#popupGroup').hide();
	$(".login-wrap").show();
};

			

