<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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
    
    <title>My JSP 'reader_type_add.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String typename=request.getParameter("typename");

String demo=request.getParameter("demo");
String sql="insert into reader_type(typeid,typename,demo) values(seq_reader_type.nextval,'"+typename+"','"+demo+"')";

//System.out.println(sql);

try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>添加读者类型成功!<a href=reader/reader_type_addnew.jsp>继续添加</a></center>");
out.print("<br><center><a href=reader/reader_type.jsp>〈〈返回</a></center>");
}
catch (Exception e)
{
out.print("<center>添加读者类型不成功!<a href=reader\reader_type_addnew.jsp>重新添加</a></center>");
}
%>
  </body>
</html>
