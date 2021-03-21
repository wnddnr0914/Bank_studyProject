<%@page import="oracle.net.aso.d"%>
<%@page import="algo.bean"%>
<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id=(String)session.getAttribute("uid");
	String pass=request.getParameter("pass");
	MemberDAO dao=new MemberDAO();
	bean bean=new bean();
	bean=dao.My_info(id);
	System.out.print(bean.getPw1());
	if(!bean.getPw1().equals(pass)){
		%>
		<script type="text/javascript">
		
			alert("비밀번호가 틀렸습니다");
			location.href="Myinfo.jsp";
		<%
	}
%>

</script>
</head>


<body>
<jsp:include page="top.jsp"></jsp:include>
<form action="MemberModifyproc2.jsp" method="post">
	<table>
		<tr>
			<th colspan="2">회원 정보</th>
		</tr>
		<tr>
			<td>아이디</td><td><%=bean.getId()%></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" value="<%=bean.getName()%>" name="name"></td>
		</tr>
		<tr>
			<td>성별</td><%if(bean.getGender()==0){
				
				%>
				<td>남성</td>
				<%
				
			}else{
			%>
				<td>여성</td>
			<%} %>
		</tr>
		<tr>
			<td>나이</td><td><input type="text" value="<%=bean.getYear()%>" name="age"></td>
		</tr>
		<tr>
			<td>비번</td>
			<td>
			<input type="text" value="<%=bean.getPw1()%>" name="pw">
			</td>
		</tr>
	</table>
	<input type="submit" value="수정">
	</form>
</body>
</html>