*<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name = request.getParameter("name");
    String uid = request.getParameter("id");
    String ugender = request.getParameter("gender");
    String uyear = request.getParameter("year");
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = "system";
   String pw = "oracle";
   Connection conn =  DriverManager.getConnection(url, id, pw);
   
   String sql = "";
   
   PreparedStatement stmt = conn.prepareStatement(sql);

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>