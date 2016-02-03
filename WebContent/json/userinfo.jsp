<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user info</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#btnGetUserInfo").click(function(){
		console.log("click");	/* 개발자 도구 창에서 console에 출력됨(debugging) */
		/* alert("hello"); */
		$.ajax({
			method: "GET",
			dataType: "json",
			url: "memberJson.jsp",
			success: function(json){
				console.log(json);
				$("#id").html(json.id);
				$("#name").html(json.name);
				}
		});
	});	
});
</script>
</head>
<body>
id: <span id="id"></span><br>
name: <span id="name"></span><br>
<input type="button" value="읽어오기" id="btnGetUserInfo">
</body>
</html>
<!-- http://cafe.naver.com/happyprogramming -->
<!-- youtube: 즐거운자바 -->