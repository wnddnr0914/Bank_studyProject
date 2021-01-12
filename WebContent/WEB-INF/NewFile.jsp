<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<from method="get" action="insertPerson.jsp">
id:<input type="text" name="id"><br>
이름:<input type="text" name="name"><br>
성별:<input type="text" name="gender"><br>
나이:<input type="text" name="year"><br>
<input type="submit" value="회원가입">
</from>
</body>
</html>