<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page import="kr.co.bit.common.LoginUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (LoginUtil.isLogin(session)) {
		LoginUtil.setLogout(session);
	}
	
	response.sendRedirect("../index.jsp");
%>