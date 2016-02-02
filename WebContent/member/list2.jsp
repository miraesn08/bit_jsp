<%@page import="java.util.List"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list (bootstrap)</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>
<body>
<div class="container">
<table class="table table-striped table-bordered table-hover">
	<tr>
		<th>ID</th>
		<th>NAME</th>
		<th>PASSWORD</th>
		<th>PHONE</th>
		<th>E-MAIL</th>
		<th>DATE</th>
	</tr>
<%
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.getMemberList();
	for (MemberVO member : list) {
		out.print("<tr>");
			out.print("<td>" + member.getId() + "</td>");
			out.print("<td>" + member.getName() + "</td>");
			out.print("<td>" + member.getPassword() + "</td>");
			out.print("<td>" + member.getPhone() + "</td>");
			out.print("<td>" + member.getEmail() + "</td>");
			out.print("<td>" + member.getRegDate() + "</td>");
		out.println("</tr>");
	}
%>
</table>
</div>
</body>
</html>