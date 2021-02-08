<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>

	<form action="JoinMemberProc.jsp" method="post">
		<table>
			<tr>
				<td colspan="2"width="40"><h2>회원가입창</h2></td>
			</tr>
			<tr>
				<td>이름<td><td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별<td>
				<td>
					<select  name="gender">
						<option value="0">남성</option>
						<option value="1">여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>나이<td><td><input type="number"  name="year" min="1" max="200"></td>
			</tr>
			<tr>
				<form action="Check_Id.jsp" method="get">
					<td>아이디<td><td><input type="text" name="id"></td>
					<td><input type="submit" value="중복 확인"></td>
				</form>
			</tr>
			<tr>
				<td>비번<td><td><input type="password" name="pw1"></td>
			</tr>
			<tr>
				<td>비번 확인<td><td><input type="password" name="pw2"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입 ">
				</td>
					
			</tr>
		</table>
	</form >
</center>
</body>
</html>