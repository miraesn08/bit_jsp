<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hello jsp</title>
</head>
<body>
	<form action="hello.jsp">
		이름을 입력하세요: <input type="text" name="name"><br>
		반복횟수를 입력하세요: <input type="text" name="count"><br> 
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
	<hr>
	<%
		String name = request.getParameter("name");
		if (name != null && !name.equals("")) {
			int count = Integer.parseInt(request.getParameter("count"));
			for (int i = 0; i < count; i++) {
	%>
	안녕!
	<%=request.getParameter("name")%><br>
	<%
		}
		}
	%>
	<hr>
	<%=getServletInfo()%>
	<hr>
	<%
		Timestamp now = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = format.format(now);
	%>

	오늘은
	<%=strDate%>
	입니다.
	<hr>
	<%
		String names[] = { "프로토콜이름", "서버이름", "Method방식", "컨텍스트 경로", "URI", "접속한 클라이언트의 IP" };
		String values[] = { request.getProtocol(), request.getServerName(), request.getMethod(),
				request.getContextPath(), request.getRequestURI(), request.getRemoteAddr() };

		Enumeration<String> en = request.getHeaderNames();
		String headerName = "";
		String headerValue = "";
	%>
	<h2>웹 브라우저와 웹 서버 정보 표시</h2>
	<%
		for (int i = 0; i < names.length; i++) {
			out.println(names[i] + " : " + values[i] + "<br>");
		}
	%>

	<h2>헤더의 정보 표시</h2>
	<%
		while (en.hasMoreElements()) {
			headerName = en.nextElement();
			headerValue = request.getHeader(headerName);
			out.println(headerName + " : " + headerValue + "<br>");
		}
	%>
</body>
</html>