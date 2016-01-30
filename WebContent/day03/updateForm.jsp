<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>
<body>
<%
	String id = request.getParameter("id");
	if (id == null || id.equals("")) {
		response.sendRedirect("list.jsp");
	}
	MemberVO vo = (new MemberDAO()).getMember(id);
	if (vo != null) {
%>
<div class="container">
<form action="update.jsp" method="post">
	<div class="form-group">
		<label>아이디:</label>
		<input type="text" readonly class="form-control" name="id" placeholder="아이디를 입력하세요" value="<%=vo.getId()%>">
	</div>
   	<div class="form-group">
		<label>이름:</label>
		<input type="text" class="form-control" name="name" placeholder="이름을 입력하세요" value="<%=vo.getName()%>">
	</div>
   	<div class="form-group">
		<label>비밀번호:</label>
		<input type="password" class="form-control" name="pw" placeholder="패스워드를 입력하세요" value="<%=vo.getPassword()%>">
	</div>
   	<div class="form-group">
		<label>전화번호:</label>
		<input type="text" class="form-control" name="phone" placeholder="전화번호를 입력하세요" value="<%=vo.getPhone()%>">
	</div>
   	<div class="form-group">
		<label>이메일:</label>
		<input type="text" class="form-control" name="email" placeholder="이메일을 입력하세요" value="<%=vo.getEmail()%>">
	</div>
	<div class="form-group">
		<input type="submit" class="btn btn-primary" value="수정">
		<input type="button" class="btn btn-default" value="취소" onclick="location.href='list.jsp'">
	</div>
</form>
</div>
<%	
	} else {
		response.sendRedirect("list.jsp");	
	}
%>
</body>
</html>