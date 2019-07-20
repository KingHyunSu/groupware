	function checkId(){
		
			var idCheck = 0;
			
			var inputed = $('input#idzon').val();
			var csrf = $('input#csrf').val();
			console.log(inputed);
			console.log(csrf);
			
			$.ajax({
				data : {inputed,csrf},
				url : "idCheck",
				type : "POST",
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data.check);
					
					if(data.check > 0) {
						$("#check").prop("disabled", true);
						$("#idzon").css("background-color", "#FFCECE");
						$(".add-text").css("margin-bottom", "16px");
						$(".add-text").css("color", "rgb(255, 168, 203)");
						$(".add-text").css("text-align", "center");
						$(".add-text").html("이미 사용중인 아이디 입니다.");						
					}else if(data.check == 0){
						$("#idzon").css("background-color", "#B0F6AC");
						$("#check").prop("disabled", false);
						$(".add-text").css("margin-bottom", "16px");
						$(".add-text").css("color", "#34aadc");
						$(".add-text").css("text-align", "center");
						$(".add-text").html("사용 가능한 아이디 입니다.");
						}
					}
				});
			};
			

