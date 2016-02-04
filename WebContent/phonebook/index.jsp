<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 개발은 step by step으로 화면 처리는 jQuery를 이용해서 -->
<!-- browser가 html 문서를 load한 후에 DOM(document object model)을 구성한다. -->
<!-- jQuery는 DOM을 조작한다. --> 
<!-- chrome의 개발자 도구에서 elements를 활용할 것. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>phone book list</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
					// jquery를 이용해서 동적으로 table row를 추가
					$('#friend_table').append('<tr id="id'
	            			+ json.phoneBook.id + '"><td>'
	            			+ json.phoneBook.name +'</td><td>'
	            			+ json.phoneBook.phone +'</td><td><a href="#" class="del">삭제</a></td></tr>'); 
	            	// input text 
					$("#name").val("");
					$("#phone").val("");
					$("#name").focus();
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
	
	showList();

    $('#friend_table').on("click", '.del', function() {
    	console.log($(this));
    	console.log($(this).closest('tr'));
    	console.log($(this).closest('tr').attr('id'));
    	//
    	var deleteRow = $(this).closest('tr');
    	var rowId = deleteRow.attr('id').substring(2);
    	console.log(rowId);
    	//
        $.ajax({
    		url:"del.jsp",
    		method:"GET",
    		url:"del.jsp",
    		data:{ id:rowId },
    		success:function(json){
				deleteRow.remove();
    			},
    		fail:function() {
    			$("#setResult").html("<strong>ajax 전송 오류 입니다.</strong>");
    			}
        });     	
    });
	
	// 동적으로 생성된 element는 click 이벤트 처리할 수 없음
	// 그리고, table은 동적으로 생성하면 되지 않는다.
	/* $('.del').click(function(){
		console.log("click bntDelete");
	}); */

});

function showList() {
	console.log("call showList()");
	// call ajax
	$.ajax({
		method:"GET",
		url:"list.jsp",
		success:function(json){
			makeListTable(json);
			},
		fail:function() {
			$("#setResult").html("<strong>ajax 전송 오류 입니다.</strong>");
			}
	});
}

function makeListTable(dataList) {
	for (i = 0; i < dataList.phoneBookList.length; i++) {
		var idValue = dataList.phoneBookList[i].id;
		var tag = "<tr id='id" + dataList.phoneBookList[i].id+ "'>";
			tag += "<td>" + dataList.phoneBookList[i].name + "</td>";
			tag += "<td>" + dataList.phoneBookList[i].phone + "</td>";
			tag += "<td><a href='#' class='del'>삭제</a></td>";
		tag += "</tr>";
		$('#friend_table').append(tag);		
	}
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
	<table id='friend_table'>
		<tr><th>이름</th><th>전화번호</th><th></th></tr>
	</table>
</div>
<hr>
<!-- 입력 -->
<div id="setForm">
	<span>이름:</span><input type="text" name="name" id="name" class="inputText"><br>
	<span>전화번호:</span><input type="text" name="phone" id="phone" class="inputText"><br>
	<input type="button" value="확인" id="btnSend">
	<div id="setResult"></div>
</div>
</body>
</html>
