<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      
    <title>My JSP 'user_updateuser.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String username=request.getParameter("username");
String ps=request.getParameter("password");
String userid=request.getParameter("userid");

String sql="update admin set password='"+ps+"' where id="+userid;
try
{
dbCon.getConnection();
dbCon.executeUpdate(sql);
////System.out.print(sql);
out.print("<center>�޸��û��ɹ�!<a href=user_management.jsp>����</a></center>");
out.print("<br><center><a href=..\\main.jsp>����������ҳ</a></center>");
}
catch (Exception e)
{
out.print("<center>�޸Ĳ��ɹ�!<a href=javascript:history.go(-1)>����</a></center>");
}

%>
  </body>
</html>
