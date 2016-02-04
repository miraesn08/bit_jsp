<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="test.CalResult"%>
<%
// postman 확장 프로그램 추가
	
	CalResult result = new CalResult();
	try {
		int v1 = Integer.parseInt(request.getParameter("v1"));
		int v2 = Integer.parseInt(request.getParameter("v2"));
		int v3 = v1 + v2;
		
		result.setResult(v3);
	} catch (Exception ex) {
		result.setErrorCode(-1);
		result.setErrorMessage(ex.toString());
	}
	out.write(new Gson().toJson(result));	
%>