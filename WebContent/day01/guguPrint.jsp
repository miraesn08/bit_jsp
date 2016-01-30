<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구구단</title>
</head>
<body>
<form action="guguPrint.jsp">
	단을 입력하세요: <input type="text" name="dan">
	<input type="submit" value="전송">
	<input type="reset" value="취소">
</form>
<hr>
<%
String danStr = request.getParameter("dan");
if (danStr != null && !danStr.equals("")) {
	int dan = Integer.parseInt(danStr);
	for (int i = 1; i <= 9; i++) {
		int r = i * dan;
%>
<%= dan %> * <%= i %> = <%= r %><br>
<% } %>
<hr>
<%
	for (int i = 1; i <= 9; i++) {
		int r = i * dan;
		out.print(dan + " * " + i + " = " + (dan * i) + "<br>");
	}
%>	
<% } %>
</body>
</html>