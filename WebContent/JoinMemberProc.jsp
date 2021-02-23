<%@page import="algo.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>

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
%>
	
	<jsp:useBean id="mbean" class="algo.bean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>

<% 
	
	if(!mbean.getPw1().equals(mbean.getPw2())){
		%>
		<script type="text/javascript">
			alert("비밀번호 확인과 비밀번호가 다릅니다");
			history.go(-1);
		</script>
		
	<%
	}
	MemberDAO mdao =new MemberDAO();
	mdao.insertMemberJoin(mbean);
	%>
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다");
			location.href="Main.jsp";
		</script>
	<%
%>
값은 정상적으로 들어갔당

</body>
</html>