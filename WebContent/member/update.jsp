<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글이 깨지지 않도록 UTF-8으로 받음. getParameter 위에 반드시!!(post)
	request.setCharacterEncoding("UTF-8");

	// 출력할 내용이 없으면 html tag가 필요없음.
	String id = request.getParameter("id");
	if (id != null && !id.equals("")) {
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPassword(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		(new MemberDAO()).updateMember(member);
	}

	response.sendRedirect("list.jsp");
%>