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
				<td>나이<td><td><input type="text" name="year"></td>
			</tr>
			<tr>
				<td>아이디<td><td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비번<td><td><input type="text" name="pw1"></td>
			</tr>
			<tr>
				<td>비번 확인<td><td><input type="text" name="pw2"></td>
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