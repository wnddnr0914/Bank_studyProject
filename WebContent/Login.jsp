<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	Cookie[] cookies =request.getCookies();
	String ids="";
	for(int i=0; i<cookies.length;i++){
		if(cookies[i].getName().equals("ACC_ID")){
			ids=cookies[i].getValue();
			break; 
		}
	}
	
%>
<body>
	<center>
	<form action="LoginProc.jsp" method="get">
	<table>
		<tr>
			<td colspan="2">로그인</td>
		</tr>
		<tr>
			<td>아이디  :  <input type="text" name="id" value="<%=ids %>"></td>
		</tr>
		<tr>
			<td>비번  :  <input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>아이디 저장  <input type="checkbox" name=ck></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
		<tr> <td><a href="http://localhost:8090/algo/JoinMember.jsp">회원가입</a></td></tr>
	</table>
	</form>
</center>
</body>
</html>