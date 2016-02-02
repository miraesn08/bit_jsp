<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page import="kr.co.bit.common.LoginUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int stateNoValue = 0;
	final int stateNotMember = 1;
	final int stateIncorrectPassword = 2;
	final int stateLoginOk = 3;
	int isLoginStateCode = stateNoValue;

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// check id/pw
	if (id != null && !id.equals("")) {
		if (pw != null && !pw.equals("")) {
			MemberVO member = (new MemberDAO()).getMember(id);
			if (member != null) {
				if (pw.equals(member.getPassword())) {
					//System.out.println(member.getPassword());
					LoginUtil.setLogin(member, session);
					isLoginStateCode = stateLoginOk;
				} else {
					isLoginStateCode = stateIncorrectPassword;
				}
			} else {
				isLoginStateCode = stateNotMember;
			}
		}
	}
	
	if (isLoginStateCode == stateNoValue) {
	} else if (isLoginStateCode == stateNotMember) {
%>
		가입되지 않은 회원 입니다. 회원 가입 하세요. <a href="../member/joinForm.jsp">회원가입으로 가기</a>	 
<%		
	} else if (isLoginStateCode == stateIncorrectPassword) {
%>
		비밀번호가 일치하지 않습니다. 다시 입력하세요. <a href="loginForm.jsp">로그인 폼으로 가기</a>	 
<%		
	} else if (isLoginStateCode == stateLoginOk) {
		response.sendRedirect("../member/list.jsp");
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>