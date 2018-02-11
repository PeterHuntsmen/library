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
      
    <title>My JSP 'book_add.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String name=request.getParameter("name");
String readertype=request.getParameter("readertype");
String telephone=request.getParameter("telephone"); 
String email=request.getParameter("email"); 
String dept=request.getParameter("dept"); 
String demo=request.getParameter("demo");
String right=request.getParameter("right");

String sql="insert into reader(readerid,name,readertype,telephone,email,dept,demo,right) "+
"values(seq_reader.nextval,'"+name+"',"+readertype+",'"+telephone+"','"+email+"','"+
dept+"','"+demo+"',"+right+")";

//System.out.println(sql);

try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>添加数据成功!<a href=reader_addnew.jsp>继续添加</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
catch (Exception e)
{
out.print("<center>添加不成功!<a href=reader_addnew.jsp>重新添加</a></center>");
}
%>
  </body>
</html>
