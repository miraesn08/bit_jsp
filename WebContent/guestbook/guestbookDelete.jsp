<%@page import="kr.co.bit.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//System.out.println(request.getParameter("no"));
	try {
		int no = Integer.parseInt(request.getParameter("no"));
		if (no > 0) {
			(new GuestBookDAO()).deleteGuestBook(no);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("guestbook.jsp");
%>