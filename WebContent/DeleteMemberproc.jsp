<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	
	if(request.getParameter("id")==null){
		%>
			<script type="text/javascript">
			alert("제대로된 경로로 들어와 주세요");
			location.href="index.jsp";
			</script>
		<%
	}else{
		String id=request.getParameter("id");
		MemberDAO dao=new MemberDAO();
		dao.DisableMember(id);
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
%>






<body>

</body>
</html>