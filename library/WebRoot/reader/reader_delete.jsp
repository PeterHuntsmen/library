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
    <base href="<%=basePath%>">
    
    <title>My JSP 'reader_delete.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <%String readerid=request.getParameter("readerid").trim();
    String sql="delete from reader where readerid='"+readerid+"'";
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql);
//System.out.println(sql);
out.print("<center>ɾ�����ݳɹ�!<a href=javascript:history.go(-1) >����</a></center>");
}
catch (Exception e)
{

out.print("<center>ɾ�����ɹ�!<a href=javascript:history.go(-1)>����</a></center>");
}
     %>
  </body>
</html>
