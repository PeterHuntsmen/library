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
    
    
    <title>My JSP 'rule_delete.jsp' starting page</title>
    
	

  </head>
  
  <body>
<%String booktype=request.getParameter("booktype").trim();
String readertype=request.getParameter("readertype").trim();
  String sql="delete from rule where booktype="+booktype+" and readertype="+readertype;
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>删除成功!<a href=javascript:history.go(-1) >返回</a></center>");
}
catch (Exception e)
{

out.print("<center>删除不成功!<a href=javascript:history.go(-1)>返回</a></center>");
}
     %>
  </body>
</html>
