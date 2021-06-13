<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check_null(){
		if(document.getElementById("name").value==""){
			alert("회원정보를 입력해 주세요");
			document.getElementById("name").focus();
			return false;
		}else if(document.getElementById("year").value==""){
			alert("회원정보를 입력해 주세요");
			document.getElementById("year").focus();
			return false;
		}else if(document.getElementById("id").value==""){
			alert("회원정보를 입력해 주세요");
			document.getElementById("id").focus();
			return false;
		}else if(document.getElementById("pw1").value==""){
			alert("회원정보를 입력해 주세요");
			document.getElementById("pw1").focus();
			return false;
		}else if(document.getElementById("pw2").value==""){
			alert("회원정보를 입력해 주세요");
			document.getElementById("pw2").focus();
			return false;
		}
		return true;
	
		
	}
</script>

</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<center>
	<form action="JoinMemberProc.jsp" method="post" onsubmit="return check_null()">
		<table>
			<tr>
				<td colspan="2"width="40"><h2>회원가입창</h2></td>
			</tr>
			<tr>
				<td>이름<td><td><input type="text" name="name" id="name"></td>
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
				<td>나이<td><td><input type="number"  name="year" min="1" max="200" id="year"></td>
			</tr>
			
				<tr>
				
					<td>아이디<td><td><input type="text" name="id" id="id"></td>
					
				</tr>
				
	
			<tr>
				<td>비번<td><td><input type="password" name="pw1" id="pw1"></td>
			</tr>
			<tr>
				<td>비번 확인<td><td><input type="password" name="pw2" id="pw2"></td>
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