<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<style>
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	th {
		background: lightgray;
	}
	th, tr {
		line-height: 30px;
	}
	tr:nth-child(even) {
    	background: linen;
	}
	th, td {
		padding: 5px;
	}
</style>
</head>
<body>
<table>
	<tr>
		<th>id</th>
		<th>name</th>
		<th>password</th>
		<th>phone</th>
		<th>email</th>
		<th>regDate</th>
	</tr>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.getMemberList();
	for (int i = 0; i < list.size(); i++) {
		out.print("<tr>");
			out.print("<td>" + list.get(i).getId() + "</td>");
			out.print("<td>" + list.get(i).getName() + "</td>");
			out.print("<td>" + list.get(i).getPassword() + "</td>");
			out.print("<td>" + list.get(i).getPhone() + "</td>");
			out.print("<td>" + list.get(i).getEmail() + "</td>");
			out.print("<td>" + list.get(i).getRegDate() + "</td>");
		out.println("</tr>");
	}
%>
</table>
</body>
</html>