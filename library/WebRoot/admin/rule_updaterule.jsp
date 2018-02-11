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
      
    <title>My JSP 'rule_updaterule.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String readertype=request.getParameter("readertype");
String booktype=request.getParameter("booktype");
String num=request.getParameter("num");
String days=request.getParameter("days");
String renew=request.getParameter("renew");
String overtime=request.getParameter("overtime");


String sql="update rule set num="+num+",days="+days+",renew="+renew+",overtime="+overtime+" where readertype="+
readertype+" and booktype="+booktype;

try
{
dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>修改规则成功!</center>");
out.print("<br><center><a href=rule_management.jsp>〈〈返回</a></center>");
}
catch (Exception e)
{
out.print("<center>修改不成功!<a href=javascript:history.go(-1)>返回</a></center>");
}

%>
  </body>
</html>
