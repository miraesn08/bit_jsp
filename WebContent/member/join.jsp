<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="kr.co.bit.common.LoginUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등록</title>
</head>
<body>
<%
	// post방식으로 전송된 자료의 한글 처리 설정(utf-8)
	request.setCharacterEncoding("UTF-8");       //한글이 깨지지 않도록 UTF-8으로 받음. getParameter위에 써야함!!
	// get방식으로 전송된 자료의 한글 처리는 server.xml에 설정
	// filter를 설정하여 처리할 수도 있음.
	
	// parameter
	String idValue =  request.getParameter("id");
	String pwValue =  request.getParameter("pw");
	String nameValue = request.getParameter("name");
	String phoneValue = request.getParameter("phone");
	String emailValue = request.getParameter("email");

	// member value
	MemberVO member = new MemberVO();
	member.setId(idValue);
	member.setPassword(pwValue);
	member.setName(nameValue);
	member.setPhone(phoneValue);
	member.setEmail(emailValue);

	// insert table
	MemberDAO dao = new MemberDAO();
	if (dao.setMember(member)) {
		LoginUtil.setLogin(member, session);
%>
<%= member.getName() %>님이 회원가입에 성공하셨습니다.
<%
	} else {
%>
<%= member.getName() %>님이 회원가입에 실패하셨습니다.
<%		
	}
%>
<hr>
<h3>회원정보는</h3>
아이디 : <%=idValue %><br>
비민번호 : <%=pwValue %><br>
이름 : <%=nameValue %><br>
이메일 : <%=emailValue %><br>
전화번호 : <%=phoneValue %><br>
<hr>
<input type="button" value="확인" onclick="location.href='list.jsp'">
</body>
</html>
<%
/* 
	oracle db data type
		number(7,2)
		char(10)
		varchar2(...)
		* utf-8에서 한글 한 글자는 3byte
		
	member table layout
	-------------------------
	table name: member
		id	varchar2(15)	primary key
		password	varchar2(15) not null
		name	varchar2(25) not null
		phone varchar2(15)
		email varchar2(50)
		reg_date date
		
	> create table member (
		id varchar2(15) primary key,
		password varchar2(15) not null,
		name varchar2(25) not null,
		phone varchar2(15),
		email varchar2(50),
		reg_date date);

	> desc member;		-- table description 

	> insert into member(id,password,name,email)
		valuse ('carami','1234','강경미','carami@nate.com');
	> commit; 		-- transaction(***)
	> insert into member
		valuse ('test','1234',test','','test@nate.com',sysdate);
	> insert into member
		valuse ('test1','1234',user,'','test1@nate.com',sysdate);
			-- user : login user name
			-- sysdate: current system date
			
	> select sysdate from dual;		-- dual : 임시 table
	
		
 */
 %>
