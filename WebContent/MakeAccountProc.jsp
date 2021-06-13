<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id=(String)session.getAttribute("uid");
	if(request.getParameter("AccountKinds")==null){
		%>
			<script type="text/javascript">
				alert("제대로된 경로를 통해 들어와 주세요");
				location.href="index.jsp";
			</script>
		<%
	}
	else{
		
	
	int acc_code=Integer.parseInt(request.getParameter("AccountKinds"));

	
	if((request.getParameter("check1"))==null||(request.getParameter("check2"))==null){
	%>
		<script type="text/javascript">
			alert("약관에 동의 해주세요");
			history.go(-1)
		</script>
	<%
	}
	MemberDAO mdao=new MemberDAO();
	int acc_num =mdao.makeAccount(acc_code, id);
	
	
	
%>
<script type="text/javascript">
	alert("계좌 번호는 <%=acc_num%>입니다");
	location.href='index.jsp';
</script>
</head>
<body>
</body>
</html>
<%
	}
%>