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
	if(session.getAttribute("uid")==null){
		%>
			alert("로그인을 해주세요");
			location.href="login.jsp";
		<%
	}

	if(request.getParameter("give_acc")!=null){
		
	
	int give_acc=Integer.parseInt(request.getParameter("give_acc"));
	int get_acc=Integer.parseInt(request.getParameter("get_acc"));
	int money=Integer.parseInt(request.getParameter("money"));
	String id=(String)session.getAttribute("uid");
	
	MemberDAO mdao=new MemberDAO();
	
	boolean check=mdao.hi(give_acc, get_acc, money, id);
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
			location.href="index.jsp"
		</script>
		<%
		
	}
	}else{
		%>
		<script type="text/javascript">
		alert("제대로된 경로를 통해 들어와 주세요");
		location.href="index.jsp";
		</script>
			
		<%
	}
	
%>


</body>
</html>