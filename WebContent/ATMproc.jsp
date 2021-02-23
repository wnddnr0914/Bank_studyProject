<%@page import="java.awt.Window.Type"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	String m=request.getParameter("money");
if(m.length()==0){
	
	%>
		<script type="text/javascript">
		alert("금액을 입력해 주세요");
			history.go(-1);
		</script>
	<%
}else{
	int money=Integer.parseInt(m);
	int acc_num=Integer.parseInt(request.getParameter("acc_num"));
	String type=request.getParameter("type");
	if(type.equals("입금")){
		
	}else if(type.equals("출금")){
	
	}
}
	
	
%>

</body>
</html>