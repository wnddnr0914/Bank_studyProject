<%@page import="oracle.net.aso.n"%>
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
	MemberDAO mdao=new MemberDAO();
	String id=request.getParameter("id");
	String pass=request.getParameter("pw");
	boolean login=mdao.login(id, pass);
	if(login==false){
		
		%>
			<script type="text/javascript">
				alert("로그인이 제대로 이루어지지 않았습니다");
				history.go(-1);
			</script>
		<%
	}else{
		
		Cookie kc = new Cookie("ACC_ID", null) ;
	    kc.setMaxAge(0) ;
	    response.addCookie(kc) ;
		



		
		session.setAttribute("uid", id);
		session.setMaxInactiveInterval(60*30);
	
	
	
	if(request.getParameter("ck")!=null){
		Cookie cookie =new Cookie("ACC_ID",id);
		cookie.setMaxAge(60*60*24*7);
		response.addCookie(cookie);
	}else{
		
		
	}
	response.sendRedirect("Main.jsp");
}
	
%>

</body>
</html>