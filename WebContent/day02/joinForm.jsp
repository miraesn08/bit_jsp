<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
	.item {
		height: 40px;
	}
	.item_label {
		display: inline-block;
		width: 100px;
		text-align: right;
  		font-weight: bold;
  	} 
</style>
</head>
<body>
<form action="join.jsp" method="post">
   <div class="item">
		<span class="item_label">아이디:</span>
		<input type="text" name="id" placeholder="아이디를 입력하세요">
	</div>
   <div class="item">
		<span class="item_label">비밀번호:</span>
		<input type="password" name="pw" placeholder="패스워드를 입력하세요">
	</div>
   <div class="item">
		<span class="item_label">이름:</span>
		<input type="text" name="name" placeholder="이름을 입력하세요">
	</div>
   <div class="item">
		<span class="item_label">전화번호:</span>
		<input type="text" name="phone" placeholder="전화번호를 입력하세요">
	</div>
   <div class="item">
		<span class="item_label">이메일:</span>
		<input type="text" name="email" placeholder="이메일을 입력하세요">
	</div>
	<div class="item">
		<input type="submit" value="회원가입">
		<input type="reset" value="취소">
	</div>
</form>
</body>
</html>