<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="com.sun.beans.util.Cache"%>
<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
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
	String name= request.getParameter("name");
	String gender= request.getParameter("gender");
	String id= request.getParameter("id");
	String pw1= request.getParameter("pw1");
	String pw2= request.getParameter("pw2");
	if(!pw1.equals(pw2)){
		%>
		<script type="text/javascript">
			alert("비밀번호 확인과 비밀번호가 다릅니다");
			history.go(-1);
		</script>
	<%
	}
	String id="system";
	String pass="123456";
	String url="jdbc:oracle:thin:localhost:1521:XE";
	try{
		//1.해당 데이터 베이스를 사용한다고 선언(쿨래스를 등록=오라클을 사용)
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.해당 데이터 베이스에 접속	
		Connection con =DriverManager.getConnection(url,id,pass);
		//3접속후 쿼리준비하여 쿼리 사용하도록 설정
		String sql="";
		//쿼리를 사용하도록 설정
		PreparedStatement pstmt = con.prepareStatement(sql);
		//?에 맞게 데이터를 맵핑
		pstmt.setString(1,);
					  //1번째?에 넣는다는거임
							  
		pstmt.executeUpdate();//insert,update,delete 시 사용하는 메소드
		
		con.close();
					  
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>