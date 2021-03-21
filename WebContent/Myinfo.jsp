<%@page import="algo.bean"%>
<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id=(String)session.getAttribute("uid");
	MemberDAO mdao=new MemberDAO();
	
	bean bean1=mdao.My_info(id);

%>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<%
		if(session.getAttribute("uid")==null){
			%>
				<script type="text/javascript">
					alert("로그인을 해주세여");
					location.href="Login.jsp";
				</script>
			<%
		}else{
	%>
	
	<center>
	<table border="1px">
		<tr>
			<th colspan="2">회원 정보</th>
		</tr>
		<tr>
			<td>아이디</td><td><%=bean1.getId()%></td>
		</tr>
		<tr>
			<td>이름</td><td><%=bean1.getName()%></td>
		</tr>
		<tr>
			<td>성별</td><%if(bean1.getGender()==0){
				
				%>
				<td>남성</td>
				<%
				
			}else{
			%>
				<td>여성</td>
			<%} %>
		</tr>
		<tr>
			<td>나이</td><td><%=bean1.getYear()%></td>
		</tr>
		<tr>
			<td>비번</td>
			<td>
			<%for(int i=0;i<=bean1.getPw1().length();i++){
				out.print("*");
				%>
				
			<%} %>
			</td>
		</tr>
	</table>
	<input type="button" onclick="location.href='MemberModifyproc1.jsp" value="수정">
	<input type="button" onclick="location.href='DeleteMember.jsp?id=<%=id %>'" value="계정 탈퇴">
	</center>
	<%
		}
	%>
</body>
</html>