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
					showList();
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
	
	$("#btnRefresh").click(function(){
		showList();
	});


	showList();

	$(".btnDelete").click(function(){
		console.log("click bntDelete");
	});
});

function showList() {
	console.log("call showList()");
	// call ajax
	$.ajax({
		method:"GET",
		url:"list.jsp",
		success:function(json){
			$("#listResult").html(json.errorMessage);
			makeListTable(json);
			},
		fail:function() {
			$("#setResult").html("<strong>ajax 전송 오류 입니다.</strong>");
			}
	});
}

function makeListTable(dataList) {
	var tag = "<table>";
	tag += "<tr><th>ID</th><th>이름</th><th>전화번호</th><th></th></tr>";

	for (i = 0; i < dataList.phoneBookList.length; i++) {
		var idValue = dataList.phoneBookList[i].id;
		tag += "<tr>";
			tag += "<td>" + idValue + "</td>";
			tag += "<td>" + dataList.phoneBookList[i].name + "</td>";
			tag += "<td>" + dataList.phoneBookList[i].phone + "</td>";
			//tag += "<td><input type='button' value='삭제' onclick='console.log(\"" + idValue + "\");'></td>";
			tag += "<td><input type='button' value='삭제' onclick='deletePhoneBook(\"" + idValue + "\");'></td>";
		tag += "</tr>";
	}
	
	tag += "</table>";
	$("#listResult").html(tag);
}

function deletePhoneBook(idValue) {
	console.log("delete: id=" + idValue);
	// call ajax
	$.ajax({
		method:"GET",
		url:"del.jsp",
		data:{ id:idValue },
		success:function(json){
			showList(json);
			},
		fail:function() {
			$("#setResult").html("<strong>ajax 전송 오류 입니다.</strong>");
			}
	});
}
</script>
<style>
#listResult table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
#listResult th, td {
	padding: 0.2em 0.4em;	
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
	<span>이름:</span><input type="text" name="name" id="name" class="inputText"><br>
	<span>전화번호:</span><input type="text" name="phone" id="phone" class="inputText"><br>
	<input type="button" value="확인" id="btnSend">
	<input type="button" value="새로고침" id="btnRefresh"><br>
	<div id="setResult"></div>
</div>
</body>
</html>