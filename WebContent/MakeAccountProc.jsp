<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id="wnddnr";
	int acc_code=Integer.parseInt(request.getParameter("AccountKinds"));

	
	if((request.getParameter("check1"))==null||(request.getParameter("check2"))==null){
	%>
		<script type="text/javascript">
			alert("약관에 동의 해주세요");
			history.go(-1)
		</script>
	<%
	}
	MemberDAO mdao=new MemberDAO();
	int acc_num =mdao.makeAccount(acc_code, id);
	

%>
</head>
<body>
	<table>
		<tr><td>계좌가 만들어 졌습니다</td></tr>
		<tr><td>종류</td><td><%= acc_code%></td></tr>
		<tr><td>ㄱㅖ좌번호</td><td><%= acc_num%></td></tr>
	</table>
</body>
</html>