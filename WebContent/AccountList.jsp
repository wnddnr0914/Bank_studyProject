<%@page import="algo.u_OwnAccount"%>
<%@page import="java.util.Vector"%>
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
	<%
		String id=(String)session.getAttribute("uid");
		if(session.getAttribute("uid")==null){
			%>
				<script type="text/javascript">
				alert("로그인을 해주세요");
				location.href="Login.jsp";
				</script>
				
			<%
		
		}
		MemberDAO mdao = new MemberDAO();
	
		Vector<u_OwnAccount> vec =mdao.allSelectMember(id);
		
	
	%>
	<%@include file="top.jsp" %>
	<center>
		<table width="800" border="1">
			<tr height="50">
				<td align="center" width="150">계좌번호</td>
				<td align="center" width="150">잔액</td>
				<td align="center" width="150">통장종류코드=통장 종류 명</td>
				<td align="center" width="150">사용자 고유 번호</td>
				<td align="center" width="150">비고</td>	
			</tr>
			<%
			for(int i=0;i<vec.size();i++){
				u_OwnAccount a= vec.get(i);
			%>
			<form action="Show_ACC_W_D.jsp" method="get">
			<tr height="50">
				<td align="center" width="150" ><%=a.getAcc_num() %><input type="hidden" name="ACC_NUM" value="<%= a.getAcc_num()%>"></td>
				<td align="center" width="150"><%=a.getBalance() %></td>
				<td align="center" width="150"><%=mdao.return_name(a.getAcc_code()) %></td>
				<td align="center" width="150"><%=a.getId() %></td>
				<td><input type="submit" value="거래내역"></td>>
			</tr>
			</form>
			<% } %>
		</table>
	</center>

</body>
</html>