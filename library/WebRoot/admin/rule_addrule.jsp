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

//检查规则是否重复
String sql1="select * from rule where readertype="+readertype+" and booktype="+booktype;
dbCon.getConnection();
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int row=rs1.getRow();
if(row>0)
{
out.print("<center>规则重复!<a href=javascript:history.go(-1)>重新添加</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
else
{
String sql="insert into rule(readertype,booktype,num,days,renew,overtime) values("+
readertype+","+booktype+","+num+","+days+","+renew+","+overtime+")";
try
{
dbCon.executeUpdate(sql);

out.print("<center>添加规则成功!<a href=rule_add.jsp>继续添加</a></center>");
out.print("<br><center><a href=rule_management.jsp>〈〈返回</a></center>");
}
catch (Exception e)
{
out.print("<center>添加不成功!<a href=rule_add.jsp>重新添加</a></center>");
}
}
%>
  </body>
</html>
