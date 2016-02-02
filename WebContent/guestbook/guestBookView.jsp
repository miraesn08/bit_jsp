<%@page import="kr.co.bit.dao.GuestBookDAO"%>
<%@page import="kr.co.bit.vo.GuestBookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	if (no <= 0) {
		response.sendRedirect("guestbook.jsp");
	}
		
	GuestBookVO vo = (new GuestBookDAO()).getGuestBook(no);
	if (vo == null) {
		response.sendRedirect("guestbook.jsp");
	}
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>방명록 보기</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
	div {
		background-color: skyblue;
	}
	.title {
		padding: 0.5em;
		text-align: right;
		text-weight: bold;
	}
	.content {
		padding: 0.5em;
	}
</style>
</head>
<body>
<div class="container">
  	<div class="jumbotron">
    	<h1>방명록 보기</h1>
  	</div>
	<div class="row">
		<div class="col-sm-2 title">이  름</div>
		<div class="col-sm-10 content"><%=vo.getName() %></div>
	</div>
	<div class="row">
		<div class="col-sm-2 title">아이디</div>
		<div class="col-sm-10 content"><%=vo.getId() %></div>
	</div>
	<div class="row">
		<div class="col-sm-2 title">제  목</div>
		<div class="col-sm-10 content"><%=vo.getTitle() %></div>
	</div>
	<div class="row">
		<div class="col-sm-2 title">내  용</div>
		<div class="col-sm-10 content"><%=vo.getContent().replace("\n","<br>") %></div>
	</div>
	<div class="row">
		<div class="col-sm-2 title">일  자</div>
		<div class="col-sm-10 content"><%=vo.getRegDate() %></div>
	</div>
	<div class="row">
		<div class="col-sm-4"></div>	
		<div class="col-sm-4"></div>	
		<div class="col-sm-4"><input type="button" value="목록보기" onclick="location.href='guestbook.jsp'"></div>
	</div>
</div>
</body>
</html>