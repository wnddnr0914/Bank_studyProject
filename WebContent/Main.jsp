<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.a {
        background-image: url( "image/ad.jpg" );
      }
</style>
</head>

<body>
	<center>
	<%@include file="top.jsp" %>
		<table border="1">
		<tr>
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/AccountDeal.jsp">계좌이체</a></td>
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/AccountList.jsp">내 계좌 보기</a></td>
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/MakeAccount.jsp">계좌 만들기</a></td>
			<td style="width: 200px; text-align: center;"><a href="http://localhost:8090/algo/JoinMember.jsp">회원가입</a></td>
		</tr>
		
		<tr>
			<td><div class="a"></div></td>	
		</tr>
		</table>
	<%@include file="bottom.jsp" %>
	</center>
</body>
</html>