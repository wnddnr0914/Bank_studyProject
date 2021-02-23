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
String Goods=request.getParameter("Goods");
%>
<table>
	<tr>
		<td><h2><%=Goods %> 설명</h2></td>
	</tr>
	<tr>
		<td><a href="MakeAccount.jsp">계좌 만들러 가기</a></td>
	</tr>
</table>

</body>
</html>