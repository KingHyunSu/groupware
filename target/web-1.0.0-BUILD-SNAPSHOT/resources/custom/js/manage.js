function click_dept(name) {
	var dept = name;
	$(".listBody").load("selectDept?dept="+dept);
};