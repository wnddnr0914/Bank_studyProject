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
		alert("�ݾ��� �Է��� �ּ���");
			history.go(-1);
		</script>
	<%
}else{
	int money=Integer.parseInt(m);
	int acc_num=Integer.parseInt(request.getParameter("acc_num"));
	String type=request.getParameter("type");
	if(type.equals("�Ա�")){
		
	}else if(type.equals("���")){
	
	}
}
	
	
%>

</body>
</html>