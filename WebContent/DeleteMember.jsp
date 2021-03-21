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
			location.href="Main.jsp";
			</script>
		<%
	}else{
		String id=request.getParameter("id");
	
%>
<script type="text/javascript">
	
	result=confirm("한번 계정을 삭제하면 복구할수 없습니다 삭제하시겠습니까?");
	if (result==true) {
		location.href="DeleteMemberproc.jsp?id=<%=id%>";
	}else {
		alert("계정 삭제를 취소하였습니다");
		location.href="Main.jsp";
	}
</script>
<%
	}
%>
<body>

</body>
</html>