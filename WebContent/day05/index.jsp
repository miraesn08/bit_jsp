<%@ page import="kr.co.bit.common.LoginUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (LoginUtil.isLogin(request)) {
		response.sendRedirect("../day03/list.jsp");
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>