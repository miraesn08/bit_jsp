<%@ page import="java.util.List"%>
<%@ page import="kr.co.bit.common.LoginUtil"%>
<%@ page import="kr.co.bit.dao.MemberDAO"%>
<%@ page import="kr.co.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isMember = false;
	MemberVO loginMember = null;
	String loginId = "";
	
	if (LoginUtil.isLogin(session)) {
		loginId = LoginUtil.getLoginId(session);
		if (loginId.length() > 0) {
			loginMember = (new MemberDAO()).getMember(loginId);
			if (loginMember != null) {
				isMember = true;
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<style>
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	th {
		background: lightgray;
	}
	th, tr {
		line-height: 30px;
	}
	tr:nth-child(odd) {
    	background: linen;
	}
	th, td {
		padding: 5px;
	}
</style>
</head>
<body>
<%
if (isMember) {
%>
<table>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>비밀번호</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>가입일</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
<%
	MemberDAO dao = new MemberDAO();
	List<MemberVO> memberList = dao.getMemberList();
	for (int i = 0; i < memberList.size(); i++) {
		MemberVO member = memberList.get(i);
%>
	<tr>
		<td><%=member.getId() %></td>		
		<td><%=member.getName() %></td>		
		<td><%=member.getPassword() %></td>		
		<td><%=member.getPhone() %></td>		
		<td><%=member.getEmail() %></td>		
		<td><%=member.getRegDate() %></td>
<% 		if (member.getId().equals(loginId)) { %>
			<td><a href="updateForm.jsp?id=<%=member.getId() %>">수정</a></td>
			<td><a href="delete.jsp?id=<%=member.getId() %>">삭제</a></td>
<% 		} else { %>
			<td></td>
			<td></td>
<% 		} %>
	</tr>
<%  } %>	
</table>
<hr>	
<input type="button" value="방명록" onclick="location.href='../guestbook/guestbook.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
아이디:<b><%=loginMember.getId() %></b>&nbsp;&nbsp;
이 름 :<b><%=loginMember.getName() %></b>&nbsp;&nbsp;
<input type="button" value="로그아웃" onclick="location.href='../login/logout.jsp'">
<% } else { %>
<h3>회원만 볼 수 있는 페이지 입니다.</h3> <a href="../login/loginForm.jsp">로그인 폼으로 가기</a>
<% } %>
</body>
</html>