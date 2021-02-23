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

	<img src="image/bank.png"; width="100px"; height="90px";>
	<table border="q">
		<tr>
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/AccountDeal.jsp">계좌이체</a></td>
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/AccountList.jsp">내 계좌 보기</a></td>
			
	
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/MakeAccount.jsp">계좌 만들기</a></td>
			<%
				if(session.getAttribute("uid")==null){
					%>
						<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/Login.jsp">로그인</a></a></td>
						
					<%
				}else{
					MemberDAO mdao12=new MemberDAO();
					%>
						<form	action="Logout.jsp" method="post">
						<td style="width: 200px; text-align: center;"><input type="submit" value="로그아웃"></a></a></td>
						</form>
						<td><%=mdao12.select_name((String)session.getValue("uid"))%>님 </td>
					<%
				}
				
			%>
			
	</table>

</body>
</html>