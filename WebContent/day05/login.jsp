<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page import="kr.co.bit.common.LoginUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isLogin = false;
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// check id/pw
	if (id != null && !id.equals("")) {
		if (pw != null && !pw.equals("")) {
			MemberVO member = (new MemberDAO()).getMember(id);
			if (member != null) {
				if (pw.equals(member.getPassword())) {
					//System.out.println(member.getPassword());
					LoginUtil.setLogin(member, response);
					isLogin = true;
				}
			}
		}
	}
	
	if (isLogin) {
		response.sendRedirect("../day03/list.jsp");
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>