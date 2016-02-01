<%@page import="kr.co.bit.vo.GuestBookVO"%>
<%@page import="kr.co.bit.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	try {
		int no = Integer.parseInt(request.getParameter("no"));
		if (no > 0) {
			GuestBookVO vo = new GuestBookVO();
			
			vo.setNo(no);
			vo.setName(request.getParameter("name"));
			vo.setId(request.getParameter("id"));
			vo.setTitle(request.getParameter("title"));
			vo.setContent(request.getParameter("content"));
			
			(new GuestBookDAO()).updateGuestBook(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	response.sendRedirect("guestbook.jsp");
%>