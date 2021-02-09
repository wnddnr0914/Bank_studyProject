<%@page import="algo.MemberDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="algo.acc_w_d"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int ACC_NUM=Integer.parseInt(request.getParameter("ACC_NUM"));
		MemberDAO mdao=new MemberDAO();
		Vector<acc_w_d> vec =mdao.acc_record(ACC_NUM);
		acc_w_d a=new acc_w_d(); 
	%>
	<center><h1>거래내역</h1></center>
	<center>
	<table border="1">
		<tr>
			<td>출금 계좌</td>
			<td>입금계좌</td>
			<td>시간</td>
			<td>금액</td>
		</tr>
		<%
			for(int i=0;i<vec.size();i++){
				a=vec.get(i);
				%>
				
					<tr>
						<td><%=a.getGive_acc() %></td>
						<td><%=a.getGet_acc() %></td>
						<td><%=a.getTra_time() %></td>
						<td><%=a.getMoney() %></td>
					</tr>
				<%
			}
		
		%>
	</table>
	</center>

</body>
</html>