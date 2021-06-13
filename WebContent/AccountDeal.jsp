<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="java.util.ArrayList"%>
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
		if(session.getAttribute("uid")==null){
			%>
				<script type="text/javascript">
					alert("로그인을 해주세요");
					location.href="Login.jsp";
				</script>
			<%
		
		}
		String id=(String)session.getAttribute("uid");
		MemberDAO mdao=new MemberDAO();
	%>
	<jsp:include page="top.jsp"></jsp:include>
	<center>
	<table border="1">
		<form action="AccountDealProc.jsp" method="get">
			<tr>
				<td colspan="2">입금하기</td>
			</tr>
			<tr>
				<td> 출금 계좌</td>
				<td>
					<select name="give_acc">
						<%
						ArrayList<Integer> give_a=new ArrayList<Integer>();
						give_a=mdao.get_my_account(id);
						
						for(int i=0;i<give_a.size();i++){
							%>
							
							<option value="<%=give_a.get(i)%>"><%=give_a.get(i) %></option>
							<%
						}
							
						%>
					</select>
				</td>
			
			</tr>
			
			<tr>
				<td>입금계좌</td>
				<td><input type="number" name="get_acc"></td>
			</tr>
			<tr>
				<td>입금액</td>
				<td colspan="2"><input type="number" name="money">원</td>
			</tr>
			<tr align="center"><td colspan="2"><input type="submit" name="tp" value="입금하기"></td></tr>
		</form>
	</table>
	</center>
</body>
</html>