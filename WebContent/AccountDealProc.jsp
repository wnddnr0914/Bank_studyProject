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
	int give_acc=(int)request.getAttribute("give_acc");
	int get_acc=(int)request.getAttribute("get_acc");
	int money=(int)request.getAttribute("money");
	MemberDAO mdao=new MemberDAO();
	mdao.hi(give_acc, get_acc, money);
	
%>

</body>
</html>