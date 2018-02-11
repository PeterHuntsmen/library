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
      
    <title>My JSP 'user_adduser.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
String username=request.getParameter("name");
String ps=request.getParameter("password");
//检查用户名是否重复
String sql1="select * from admin where username='"+username+"'";
dbCon.getConnection();
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int row=rs1.getRow();
if(row>0)
{
out.print("<center>用户名重复!<a href=javascript:history.go(-1)>重新添加</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
else
{
String sql="insert into admin values(seq_admin.nextval,'"+username+"','"+ps+"')";
try
{
dbCon.executeUpdate(sql);

out.print("<center>添加用户成功!<a href=user_add.jsp>继续添加</a></center>");
out.print("<br><center><a href=user_management.jsp>〈〈返回</a></center>");
}
catch (Exception e)
{
out.print("<center>添加不成功!<a href=user_add.jsp>重新添加</a></center>");
}
}
%>
  </body>
</html>
