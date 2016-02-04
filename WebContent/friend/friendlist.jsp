<%@page import="kr.co.bit.dao.FriendDAOImpl"%>
<%@page import="kr.co.bit.dao.FriendDAO"%>
<%@page import="kr.co.bit.vo.FriendDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(function() {

    $('.del').on("click", function() {
    	//console.log(this);
    	//alert($(this).parent().attr('id'));
    	var rowid = $(this).parent().attr('id').substring(2);
    	var deleteRow = $(this).parent();
    	// ajax로 rowid를 전달하여 삭제하라고 부탁한다.
        $.ajax({
            type:"GET",
            dataType:'json',
            data: { id: rowid },
            url:"deletefriend.jsp",
            success:function(json){
				deleteRow.remove();
            }
        });     	
    });
    
    $('#addFried').click(function(){
    	var name = $('#name').val();
    	var tel = $('#tel').val();
    	// ajax로 name, tel정보로 insert를 부탁
    	// insert가 성공하면, 새로운 row를 추가한다. (id, name, tel)
         $.ajax({
            type:"GET",
            dataType:'json',
            data: { name: name, tel: tel },
            url:"addfriend.jsp",
            success:function(json){
            	var tbl = $('#friend_table');
            	$(tbl).find('tr:last').after('<tr id="id' + json.id + '"><th>'+ json.name +'</th><th>'+ json.tel +'</th><th class="del">삭제</th></tr>');
            }
        });      	
    });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="700" id="friend_table">
<tr>
	<th>이름</th><th>전화번호</th><th>삭제</th>
</tr>
<%
	FriendDAO dao = new FriendDAOImpl();
	List<FriendDTO> list = dao.getList();
	for(int i = 0; i < list.size(); i++){
		FriendDTO friend = list.get(i);
%>
<tr id="id<%=friend.getId()%>">
	<td><%=friend.getName()%></td><td><%=friend.getTel()%></td><td class="del">삭제</td>
</tr>	
<%
	} // for
%>
</table>
<br>
<br>
<br>
이름 : <input type="text" id="name"><br>
전화번호 :<input type="text" id="tel"><br>
<input type="button" value="확인" id="addFried">
<br>

<div  id="tmp_row">

</div>
</body>
</html>
