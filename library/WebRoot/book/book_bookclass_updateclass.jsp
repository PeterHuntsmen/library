<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'book_bookclass_updateclass.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String classname=request.getParameter("classname");
String demo=request.getParameter("demo");
String classid=request.getParameter("classid");

String sql="update book_class set classname='"+classname+"',demo='"+demo+"' where classid="+classid;
////System.out.println(sql);

try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>数据修改成功!<a href='javascript:history.go(-2)'>返回</a></center>");
out.print("<br><center><a href='..\\main.jsp'>〈〈返回首页</a></center>");
}
catch (Exception e)
{
out.print("<center>修改不成功!<a href='javascript:history.go(-1)'>重新修改</a></center>");
}
%>
  </body>
</html>
