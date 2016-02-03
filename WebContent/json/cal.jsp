<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cal</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnGetResult").click(function() {
		console.log("click");
		var val1 = $("#v1").val();
		var val2 = $("#v2").val();
		console.log("data: " + val1 + "," + val2);
		$.ajax({
			method: "GET",
			url: "calact.jsp",
			data: { v1:val1,v2:val2 },
			success: function(json) {
				console.log("ajax success");
				if (json.errorCode==0) {
					$("#result").html(json.result);
				} else {
					console.log("error: " + json.errorMessage);
				}
			}
		});
	});
});
</script>
</head>
<body>
<input type="text" id="v1"> + <input type="text" id="v2"> = <span id="result"></span><br>
<input type="button" value=" 확인 " id="btnGetResult">
</body>
</html>