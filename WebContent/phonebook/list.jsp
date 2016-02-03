<%@page import="java.util.List"%>
<%@page import="kr.co.bit.dao.PhoneBookDAO"%>
<%@page import="kr.co.bit.vo.PhoneBookVO"%>
<%@page import="kr.co.bit.result.PhoneBookListResult"%>
<%@page import="kr.co.bit.common.DBUtil"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%
	PhoneBookListResult result = new PhoneBookListResult();

	try {
		List<PhoneBookVO> list = new PhoneBookDAO().getPhoneBookList();
		if (list != null) {
			result.setErrorCode(DBUtil.ERROR_CODE_OK);
			result.setErrorMessage("success");
			result.setPhoneBookList(list);
		} else {
			result.setErrorCode(DBUtil.ERROR_CODE_NO_DATA);
			result.setErrorMessage("자료가 없습니다.");
		}
	} catch(Exception e) {
		result.setErrorCode(DBUtil.ERROR_CODE_INVALID_PARAMETER);
		result.setErrorMessage("검색 값을 확인하세요.");
	}

	out.write( new Gson().toJson(result) );
%>