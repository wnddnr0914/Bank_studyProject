<%@page import="java.util.ArrayList"%>
<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	MemberDAO mdao =new MemberDAO();
%>
<body>
<%@include file="top.jsp" %>
<center>
<form action="ATMproc.jsp" method="get">
<table>
	<tr>
		<td colspan="2"><center><h2>ATM</h2></center></td>
	</tr>
	<tr>
		<td colspan="2">거래 계좌<select name="acc_num">
				<%
					ArrayList<Integer> give_a = new ArrayList<Integer>();
					give_a=mdao.get_my_account(id);
					for(int i=0;give_a.size()>i;i++){
						%>
						<option value="<%=give_a.get(i) %>"><%=give_a.get(i) %></option>
						<%
					}
				%>
			</select>
			
			
		</td>
	</tr>
	<tr>
		<td colspan="2">금액: <input max="3000000" min="1000" name=money type="number"></td>
	</tr>
	<tr><td><input name="type" style="width: 120px;" type="submit" value="입금"></td> <td><input name="type" style="width: 120px;"  type="submit" value="출금"></td></tr>
</table>
</form>
</center>

</body>
</html>