<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<center>
<form action="MemberModify.jsp" method="post">
	<label>비밀번호를 입력하세요<input type="password" name="pass"></label>
	<input type="submit" value="확인">
	</form>
</center>
</body>
</html>