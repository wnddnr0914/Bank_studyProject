<%@page import="algo.MyAccountList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="algo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/top.css">
</head>
<%
MemberDAO mdao12=new MemberDAO();
%>
<body>
<center>
	<a href="index.jsp"><img src="image/bank.png"; width="100px"; height="90px";></a>
	<ul class="myMenu">
    <li class="menu1"><a href="AccountDeal.jsp">계좌 이체</a></li>
    <li class="menu2">
        <a href="AccountList.jsp">내 계좌 보기</a>
        <ul class="menu2_s submenu">
        	 <%
           String idss=(String)session.getAttribute("uid");

           ArrayList<MyAccountList> My_acc=new ArrayList();
            My_acc=mdao12.MyAccount(idss);
           for(int i=0;i<My_acc.size();i++){
           %>
          <li> <a href="Show_ACC_W_D.jsp?ACC_NUM=<%= My_acc.get(i).getAcc_num() %>"><%= mdao12.return_name(My_acc.get(i).getKind()) %>,<%= My_acc.get(i).getAcc_num() %></a> </li>         
           <%
           }
           
        %>
           
        </ul>   
    </li>
    <li class="menu3">
        <a href="MakeAccount.jsp">계좌 만들기</a>
        <ul class="menu3_s submenu">
        	<%
        	ArrayList<Integer> goods=new ArrayList<Integer>();
        	goods=mdao12.Goods_Ex();
        	for(int i=0;i<goods.size();i++){
        		%>
        		<li><a href="Goods.jsp?Goods=<%= mdao12.return_name(goods.get(i)) %>"><%= mdao12.return_name(goods.get(i)) %></li>
        		<%
        	}
        		%>
        </ul>   
   </li>
    <li class="menu4"><a href="Myinfo.jsp">내정보 보기</a></li>
</ul>
	
			<%
				if(session.getAttribute("uid")==null){
					%>
						<a href="Login.jsp"><img src="image/login.png"width="150px"; height="90px";></a>
						
					<%
				}else{
					
					%>
						<a href="Logout.jsp"><img src="image/logout.png"width="150px"; height="90px";></a>
						
					<%
				}
				
			%>
			</center>


</body>
</html>