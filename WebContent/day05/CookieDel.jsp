<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie(request.getParameter("name"),"");
	cookie.setPath("/");	// 자료를 Client가 가지고 있으므로
	cookie.setMaxAge(0);	// 같은 이름으로 쿠키를 만들고	
							// 쿠키 유지 시간을 0으로 설정하여 cookie값을 삭제

	response.addCookie(cookie);
	
	response.sendRedirect("CookieView.jsp");
	
%>