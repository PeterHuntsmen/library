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
//����û����Ƿ��ظ�
String sql1="select * from admin where username='"+username+"'";
dbCon.getConnection();
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int row=rs1.getRow();
if(row>0)
{
out.print("<center>�û����ظ�!<a href=javascript:history.go(-1)>�������</a></center>");
out.print("<br><center><a href=..\\main.jsp>����������ҳ</a></center>");
}
else
{
String sql="insert into admin values(seq_admin.nextval,'"+username+"','"+ps+"')";
try
{
dbCon.executeUpdate(sql);

out.print("<center>����û��ɹ�!<a href=user_add.jsp>�������</a></center>");
out.print("<br><center><a href=user_management.jsp>��������</a></center>");
}
catch (Exception e)
{
out.print("<center>��Ӳ��ɹ�!<a href=user_add.jsp>�������</a></center>");
}
}
%>
  </body>
</html>
