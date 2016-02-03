<%@page import="kr.co.bit.dao.PhoneBookDAO"%>
<%@page import="kr.co.bit.vo.PhoneBookVO"%>
<%@page import="kr.co.bit.result.PhoneBookResult"%>
<%@page import="kr.co.bit.common.DBUtil"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%
	PhoneBookResult result = new PhoneBookResult();

	try {
		int id = Integer.parseInt(request.getParameter("id"));
		PhoneBookVO vo = new PhoneBookDAO().getPhoneBook(id);
		if (vo != null) {
			result.setErrorCode(DBUtil.ERROR_CODE_OK);
			result.setErrorMessage("success");
			result.setPhoneBook(vo);
		} else {
			result.setErrorCode(DBUtil.ERROR_CODE_NO_DATA);
			result.setErrorMessage("자료가 없습니다.");
		}
	} catch(Exception e) {
		result.setErrorCode(DBUtil.ERROR_CODE_INVALID_PARAMETER);
		result.setErrorMessage("검색하고자 하는 값을 확인하세요.");
	}

	out.write( new Gson().toJson(result) );
%>