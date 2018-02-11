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
    
    
    <title>My JSP 'book_bookclass_add.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String classname=request.getParameter("classname");

String demo=request.getParameter("demo");
String sql="insert into book_class(classid,classname,demo) values(seq_book_class.nextval,'"+classname+"','"+demo+"')";

////System.out.println(sql);

try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>添加数据成功!<a href=book_bookclass_addnew.jsp>继续添加</a></center>");
out.print("<br><center><a href=book_bookclass.jsp>〈〈返回</a></center>");
}
catch (Exception e)
{
out.print("<center>添加不成功!<a href='book_bookclass_addnew.jsp'>重新添加</a></center>");
}
%>
  </body>
</html>
