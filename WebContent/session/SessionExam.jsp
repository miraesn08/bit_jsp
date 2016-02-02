<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session</title>
</head>
<body>
<h3>상태유지 하고 싶은 정보를 저장해 주세요.</h3>
<form action="SessionSave.jsp">
세션이름: <input type="text" name="sessionName"><br>
세션 값 : <input type="text" name="sessionValue"><br>
<input type="submit" value="세션저장">
</form>
</body>
</html>