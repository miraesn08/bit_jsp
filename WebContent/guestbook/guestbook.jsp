<%@page import="java.util.List"%>
<%@page import="kr.co.bit.vo.GuestBookVO"%>
<%@page import="kr.co.bit.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});

/* $(".table td a").popover({ 
    trigger: 'hover',
    placement: function(pop,ele){
        if($(ele).parent().is('td:last-child')){
        return 'left'
        }else{
        return 'top'
        }
    }
}); */
</style>
</head>
<body style="margin: 20px auto;">
<div class="container">
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th>NO</th>
			<th>NAME</th>
			<th>ID</th>
			<th>TITLE</th>
			<th>DATE</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
<%
	GuestBookDAO dao = new GuestBookDAO();
	List<GuestBookVO> list = dao.getGuestBookList();
	for (GuestBookVO vo : list) {
%>
		<tr>
			<td><%=vo.getNo() %></td>
			<td><a href="#" data-toggle="popover" title="<%=vo.getContent() %>"><%=vo.getName() %></a></td>
			<td><%=vo.getId() %></td>
			<td><a href="guestBookView.jsp?no=<%=vo.getNo() %>"><%=vo.getTitle() %></a></td>
			<td><%=vo.getRegDate() %></td>
			<td><a href="guestBookUpdateForm.jsp?no=<%=vo.getNo() %>">수정</a></td>
			<td><a href="guestbookDelete.jsp?no=<%=vo.getNo() %>">삭제</a></td>
		</tr>
<%	
	}
%>
	</table>
	<input type="button" class="btn btn-primary" value=" 글쓰기 " onclick="location.href='guestBookUpdateForm.jsp'">
</div>
</body>
</html>