<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session view</title>
</head>
<body>
<%
	Enumeration e = session.getAttributeNames();
	while (e.hasMoreElements()) {
		String key = (String)e.nextElement();
		Object obj = session.getAttribute(key);
		String value = "";
		if (obj instanceof MemberVO) {
			value = ((MemberVO)obj).toString();
		} else {
			value = (String)obj;
		}
%>
<p>
	<%=key %> : <%=value %>
	<input type="button" value="세션삭제" onclick="location.href='SessionDel.jsp?name=<%=key %>'">
</p>
<%
	}
%>
</body>
</html>