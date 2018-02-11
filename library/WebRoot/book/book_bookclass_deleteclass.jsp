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
  
    
    <title>My JSP 'book_bookclass_deleteclass.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <%String classid=request.getParameter("classid").trim();
    String sql1="delete from book where bookclass="+classid;
    
    String sql2="delete from book_class where classid="+classid;
    
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql1);
dbCon.executeUpdate(sql2);

out.print("<center>删除数据成功!<a href=javascript:history.go(-2) >返回</a></center>");
}
catch (Exception e)
{

out.print("<center>删除不成功!<a href=javascript:history.go(-2)>返回</a></center>");
}
     %>
  </body>
</html>
