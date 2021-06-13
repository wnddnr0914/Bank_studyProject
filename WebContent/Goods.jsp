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
	request.setCharacterEncoding("UTF-8");
String Goods=request.getParameter("Goods");
%>
<jsp:include page="top.jsp"></jsp:include>
<div width="100px" height="500px";>
<center>
<table>
	<tr>
		<td><h2><%=Goods %> 설명</h2></td>
	</tr>
	<tr>
		<td><a href="MakeAccount.jsp">계좌 만들러 가기</a></td>
	</tr>
</table>
</center>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>