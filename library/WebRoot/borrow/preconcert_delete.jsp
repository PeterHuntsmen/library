<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      
    <title>My JSP 'preconcert_delete.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
Integer bookid=Integer.valueOf(request.getParameter("bookid"));
Integer readerid=Integer.valueOf(request.getParameter("readerid"));




String sql="delete from preconcert where readerid="+readerid+" and bookid="+bookid;
//System.out.println(sql);
try{
dbCon.getConnection();
dbCon.executeUpdate(sql);



out.print("<center>删除成功!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}catch(Exception e)
{
 
out.print("<center>失败！<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");


}
%>
  </body>
</html>
