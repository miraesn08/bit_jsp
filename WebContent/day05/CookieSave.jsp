<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("cookieName");
	String value = request.getParameter("cookieValue");
	
	Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
	// 같은 이름으로 값이 존재할 수 없다. 즉, 값을 수정할 수 있다.
	// 쿠키는 한글을 직접 저장할 수 없으므로 URLEncoder.encode() 클래스를 이용해서 저장
	// 읽을 때는 URLDecoder.decode()을 사용
	cookie.setPath("/");		// domain별로 cookie를 관리하므로
								// "/"로 설정하면 전체에 적용됨
								// 반드시 설정해야 함.
	cookie.setMaxAge(-1);		// -1 -> browser가 열려있는 동안		
								// 설정 가능한 최대유지기간이 2~3년(?)
								// 은행사이트는 특정 이벤트에서 쿠키유지시간을 재설정
	response.addCookie(cookie);	// 만든 cookie를 사용자에게 반드시 전송해야 됨									

	response.sendRedirect("CookieView.jsp");
%>