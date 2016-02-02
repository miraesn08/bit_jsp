<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("sessionName");
	String value = request.getParameter("sessionValue");

	// 서블릿에서 사용할 경우 생성하는 것이 아니라 생성되어 있는 session 구한다.(세션은 내부적으로 처리된다.)
	//HttpSession session2 = request.getSession();
	// Scope - Page / Request / Session / Application
	
	// 세선 저장, 브라우저가 유지되는 동안(기본값)
	session.setAttribute(name, value);		

	response.sendRedirect("SessionView.jsp");
%>