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


	int give_acc=Integer.parseInt(request.getParameter("give_acc"));
	int get_acc=Integer.parseInt(request.getParameter("get_acc"));
	int money=Integer.parseInt(request.getParameter("money"));
	
	MemberDAO mdao=new MemberDAO();
	
	boolean check=mdao.hi(give_acc, get_acc, money);
	if(check==false){
		%>
			<script type="text/javascript">
				alert("입금이 정상적으로 이루어지지 않았습니다");
				history.go(-1);
			</script>
		<%
		
	}else{
		%>
		<script type="text/javascript">
			alert("입금 완료되었습니다");
		</script>
		<%
		
	}
	
	
%>


</body>
</html>