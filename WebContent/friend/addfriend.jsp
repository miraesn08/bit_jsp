<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.bit.dao.FriendDAOImpl"%>
<%@page import="kr.co.bit.dao.FriendDAO"%>
<%@page import="kr.co.bit.vo.FriendDTO"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%
	try{
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		FriendDAO dao = new FriendDAOImpl();
		FriendDTO dto = dao.addFriend(name, tel);
		String dtostr = new Gson().toJson(dto);
		out.println(dtostr);
	}catch(Exception ex){
		out.println("{\"result\":\"fail\"}");
	}
%>
