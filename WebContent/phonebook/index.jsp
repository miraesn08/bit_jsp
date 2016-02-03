<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>phone book list</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnSend").click(function(){
		// get data
		var nameValue = $("#name").val();
		var phoneValue = $("#phone").val();
		// check data
		if (nameValue.length > 0 && phoneValue.length > 0) {
			console.log("name:" + nameValue + "," + "phone:" + phoneValue);
			// call ajax
			$.ajax({
				method:"GET",
				url:"set.jsp",
				data:{ name:nameValue, phone:phoneValue },
				statusCode: {
				    404: function() {
				    	$("#setResult").html("page not found");
				    	}
				  	},
				success:function(json){
					$("#setResult").html(json.errorMessage);
					},
				fail:function() {
					$("#setResult").html("<strong>ajax 전송 오류 입니다.</strong>");
					}
			});
		} else {
			$("#setResult").html("<strong>이름과 전화번호를 입력하세요.</strong>");
			$("#name").focus();
		}
		
	});
	
});
</script>
<style>
#setForm {
	float: left;
	display: inline-block;
}
#setForm .inputText {
	margin: 0 10px;
	width: 150px;
}
</style>
</head>
<body>
<!-- 목록 -->
<div id="listResult">

</div>
<hr>
<!-- 입력 -->
<div id="setForm">
	<span>이름:</span><input type="text" name="name" id="name" class="inputText">
	<span>전화번호:</span><input type="text" name="phone" id="phone" class="inputText">
	<input type="button" value="확인" id="btnSend">
</div>
<div id="setResult"></div>
</body>
</html>