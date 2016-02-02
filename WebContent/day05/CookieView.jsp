<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookie view</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();	// 저장된 모든 쿠키를 전송받음
	for (Cookie cookie : cookies) {
		out.print(cookie.getName() + ":");
		out.print(cookie.getValue() + "<br>");
	}

%>
</body>
</html>