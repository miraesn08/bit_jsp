<%@page import="kr.co.bit.dao.FriendDAOImpl"%>
<%@page import="kr.co.bit.dao.FriendDAO"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%
	try{
		String idStr = request.getParameter("id");
		//System.out.println(idStr);
		int id = Integer.parseInt(idStr);
		FriendDAO dao = new FriendDAOImpl();
		dao.deleteFriend(id);
		out.println("{\"result\":\"ok\"}");
	}catch(Exception ex){
		out.println("{\"result\":\"fail\"}");
	}
%>
