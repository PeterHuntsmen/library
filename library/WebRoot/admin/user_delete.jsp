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
    
    
    <title>My JSP 'user_delete.jsp' starting page</title>
    
	

  </head>
  
  <body>
<%String userid=request.getParameter("userid").trim();
  String sql="delete from admin where id='"+userid+"'";
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>ɾ���û��ɹ�!<a href=javascript:history.go(-1) >����</a></center>");
}
catch (Exception e)
{

out.print("<center>ɾ�����ɹ�!<a href=javascript:history.go(-1)>����</a></center>");
}
     %>
  </body>
</html>
