<%@page import="com.google.gson.Gson"%>
<%@ page import="kr.co.bit.vo.MemberVO" %>
<%@ page import="kr.co.bit.dao.MemberDAO" %>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%
	String id = "carami";
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.getMember(id);
	if (member != null) {
		Gson gson = new Gson();
		String json = gson.toJson(member);
		out.write(json);
	}
%>