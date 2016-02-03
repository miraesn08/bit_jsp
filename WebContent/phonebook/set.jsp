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
		result.setErrorCode(DBUtil.ERROR_CODE_NO_DATA);
		result.setErrorMessage("자료가 없습니다.");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		if (name != null && name.length() >0 ) {
			if (phone != null && phone.length() > 0) {
				PhoneBookDAO dao = new PhoneBookDAO();
				PhoneBookVO vo = new PhoneBookVO();
				
				vo.setName(name);
				vo.setPhone(phone);
				
				if (dao.setPhoneBook(vo)) {
					result.setErrorCode(DBUtil.ERROR_CODE_OK);
					result.setErrorMessage("자료를 등록했습니다.");
					result.setPhoneBook(vo);
				}
			}
		}
	} catch(Exception e) {
		result.setErrorCode(DBUtil.ERROR_CODE_INVALID_PARAMETER);
		result.setErrorMessage("입력 값을 확인하세요.");
	}

	out.write( new Gson().toJson(result) );
%>