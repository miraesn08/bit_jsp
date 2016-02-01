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
<title>방명록 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
	body {
		margin: 0 auto;
	}
	h3 {
		padding-left: 2em;
	}
	.title {
		padding: 0.5em;
		background-color: skyblue;
		text-align: center;
		border: 1px dotted black;
	}
	.content {
		padding: 0.5em;
	}
	
</style>
</head>
<body>
<h3>방명록 보기</h3>
<div style="width:80%;">
<div class="container-fluid" style="background-color:linen;">
	<div class="row">
		<div class="col-md-2 title">이  름</div>
		<div class="col-md-4 content"><%=vo.getName() %></div>
		<div class="col-md-2 title">아이디</div>
		<div class="col-md-4 content"><%=vo.getId() %></div>
	</div>
	<div class="row">
		<div class="col-md-2 title">제  목</div>
		<div class="col-md-10 content"><%=vo.getTitle() %></div>
	</div>
	<div class="row">
		<div class="col-md-2 title">내  용</div>
		<div class="col-md-10 content"><%=vo.getContent().replace("\n","<br>") %></div>
	</div>
	<div class="row">
		<div class="col-md-2 title">일  자</div>
		<div class="col-md-6 content"><%=vo.getRegDate() %></div>
		<div class="col-md-4"><input type="button" value="목록보기" onclick="location.href='guestbook.jsp'"></div>
	</div>
</div>
</div>
</body>
</html>