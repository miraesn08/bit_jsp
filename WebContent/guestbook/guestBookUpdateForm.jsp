<%@page import="kr.co.bit.dao.GuestBookDAO"%>
<%@page import="kr.co.bit.vo.GuestBookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isNew = false;
	String noValue = request.getParameter("no");
	String titleName = "";
	String actionFormName = "";
	String submitButtonName = "";
	GuestBookVO vo = null;
	
	if (noValue == null || noValue.equals("")) {
		isNew = true;
		titleName = "방병록 쓰기"; 
		actionFormName = "guestBookInsert.jsp";
		submitButtonName = "등록";
		
		vo = new GuestBookVO();
		vo.setName("");
		vo.setId("");
		vo.setTitle("");
		vo.setContent("");
	} else {
		int no = Integer.parseInt(noValue);
		if (no <= 0) {
			response.sendRedirect("guestbook.jsp");
		}
		
		vo = (new GuestBookDAO()).getGuestBook(no);
		if (vo != null) {
			isNew = false;
			titleName = "방병록 수정"; 
			actionFormName = "guestBookUpdate.jsp";
			submitButtonName = "수정";
		} else {
			response.sendRedirect("guestbook.jsp");
		}
	}
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=titleName %></title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<h3><%=titleName %></h3>	
<form action="<%=actionFormName %>" method="post">
	<input type="hidden" name="no" value="<%=vo.getNo()%>">
<% if (isNew) { %>
   	<div class="form-group">
		<label>이름:</label>
		<input type="text" class="form-control" name="name" placeholder="이름을 입력하세요">
	</div>
	<div class="form-group">
		<label>아이디:</label>
		<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요"> 
	</div>
<% }  else { %>
   	<div class="form-group">
		<label>이름:</label>
		<input type="text" readonly class="form-control" name="name" placeholder="이름을 입력하세요" value="<%=vo.getName()%>">
	</div>
	<div class="form-group">
		<label>아이디:</label>
		<input type="text" readonly class="form-control" name="id" placeholder="아이디를 입력하세요" value="<%=vo.getId()%>"> 
	</div>
<% } %>	
   	<div class="form-group">
		<label>제목:</label>
		<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" value="<%=vo.getTitle()%>">
	</div>
   	<div class="form-group">
		<label>내용:</label>
		<textarea class="form-control" name="content" rows="3"><%=vo.getContent()%></textarea>
	</div>
	<div class="form-group">
		<input type="submit" class="btn btn-primary" value="<%=submitButtonName%>">
		<input type="button" class="btn btn-default" value="취소" onclick="location.href='guestbook.jsp'">
	</div>
</form>
</div>
</body>
</html>