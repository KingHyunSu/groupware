function click_dept(name) {
	var dept = name;
	$(".listBody").load("selectDept?dept="+dept);
};

function click_name(name) {
	$("#suv2").load("selectName?name="+name);
}