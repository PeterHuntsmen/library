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
      
    <title>My JSP 'rule_addrule.jsp' starting page</title>
    
	
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

//�������Ƿ��ظ�
String sql1="select * from rule where readertype="+readertype+" and booktype="+booktype;
dbCon.getConnection();
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int row=rs1.getRow();
if(row>0)
{
out.print("<center>�����ظ�!<a href=javascript:history.go(-1)>�������</a></center>");
out.print("<br><center><a href=..\\main.jsp>����������ҳ</a></center>");
}
else
{
String sql="insert into rule(readertype,booktype,num,days,renew,overtime) values("+
readertype+","+booktype+","+num+","+days+","+renew+","+overtime+")";
try
{
dbCon.executeUpdate(sql);

out.print("<center>��ӹ���ɹ�!<a href=rule_add.jsp>�������</a></center>");
out.print("<br><center><a href=rule_management.jsp>��������</a></center>");
}
catch (Exception e)
{
out.print("<center>��Ӳ��ɹ�!<a href=rule_add.jsp>�������</a></center>");
}
}
%>
  </body>
</html>
