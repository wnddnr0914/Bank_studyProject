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
		//MemberDAO mDao=new MemberDAO();
		String check=request.getParameter("id");
		System.out.println("중욱ㅇ;1");
		//boolean check_id=mDao.check_id(check);
		//System.out.println("중욱ㅇ;2");
		//if(check_id){
			%>
			<script type="text/javascript">
				alert("사용 가능한 아이디 입니다");
				history.go(-1)
			</script>
			
			<%
		//}else{
			%>
			<script type="text/javascript">
				alert("이미 있는 아이디 입니다");
				history.go(-1)
			</script>
			
			<%
		//}
	%>

</body>
</html>