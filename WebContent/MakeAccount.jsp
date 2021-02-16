<%@page import="java.util.ArrayList"%>
<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		String id="wnddnr";
		MemberDAO mdao=new MemberDAO();
		
	%>
	<table>
	<form action="MakeAccountProc.jsp" method="get" >
		<tr><td><h2>계좌 만들기</h2></td></tr>
		<tr>
			<td>계좌 종류</td>
			<td>
				<select id="AccountKinds">
				<%
					ArrayList<String> list=new ArrayList<String>(); 
					list=mdao.get_AccountKinds();
					for(int i=0;list.size()>i;i++){
						%>
						<option value="<%=i%>"><%=list.get(i)%></option>
						<%
						
					}
				%>
				</select>
			</td>
			
		</tr>
		<tr>
			<td><label>개인정보 동의:<input type="checkbox" id="check1" value="1"></label></td>
		</tr>
		<tr>
			<td><label>두번째 동의:<input type="checkbox" id="check2" value="2"></label></td>
		</tr>
		<tr>
			<td><input type="submit" value="계좌 만들기"></td>
		</tr>
		</form>
	</table>
	
</head>
<body>

</body>
</html>