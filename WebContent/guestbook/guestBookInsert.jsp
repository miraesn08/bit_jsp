<%@page import="kr.co.bit.dao.GuestBookDAO"%>
<%@page import="kr.co.bit.vo.GuestBookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	GuestBookVO vo = new GuestBookVO();
	
	vo.setName(request.getParameter("name"));
	vo.setId(request.getParameter("id"));
	vo.setTitle(request.getParameter("title"));
	vo.setContent(request.getParameter("content"));
	
	(new GuestBookDAO()).setGuestBook(vo);

	response.sendRedirect("guestbook.jsp");
%>