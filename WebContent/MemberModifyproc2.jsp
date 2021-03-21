<%@page import="algo.MemberDAO"%>
<%@page import="algo.bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("회원정보가 수정되었습니다");
	location.href="Myinfo.jsp"
</script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao=new MemberDAO();
	bean bean=new bean();
	bean.setName(request.getParameter("name"));
	bean.setYear(Integer.parseInt(request.getParameter("age")));
	bean.setPw1(request.getParameter("pw"));
	bean.setId((String)session.getAttribute("uid"));
	dao.UpadteMember(bean);
	
%>

<body>

</body>
</html>