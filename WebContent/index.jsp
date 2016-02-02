<%@ page import="kr.co.bit.common.LoginUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (LoginUtil.isLogin(request)) {
		response.sendRedirect("member/list.jsp");
	} else {
		response.sendRedirect("login/loginForm.jsp");
	}
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>

</body>
</html>