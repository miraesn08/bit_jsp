<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<form action="login.jsp" method="get">
	아이디: <input type="text" name="id" placeholder="아이디를 입력하세요"><br>
	패스워드: <input type="password" name="pw" placeholder="비밀번호를 입력하세요"><br>
	<input type="submit" value="로그인">
	<input type="reset" value="취소">
	<input type="button" value="신규등록" onclick="location.href='../day02/joinForm.jsp'">
</form>
</body>
</html>