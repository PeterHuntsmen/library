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
    
    <title>My JSP 'reader_update.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   request.setCharacterEncoding("gb2312");
   String readerid=request.getParameter("readerid").trim();
String name=request.getParameter("name").trim();
String readertype=request.getParameter("readertype").trim();
String telephone=request.getParameter("telephone").trim(); 
String email=request.getParameter("email").trim(); 
String dept=request.getParameter("dept").trim();
String demo=request.getParameter("demo").trim();
String right=request.getParameter("right");

String sql="update reader set name='"+name+"',readertype="+readertype+",telephone='"+
telephone+"',email='"+email+"',dept='"+dept+"',demo='"+demo+"',right="+
right+" where readerid="+readerid;
//System.out.println(sql);

try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>数据修改成功!<a href='javascript:history.go(-2)'>返回</a></center>");
out.print("<br><center><a href=main.jsp>〈〈返回首页</a></center>");
}
catch (Exception e)
{
out.print("<center>修改不成功!<a href='javascript:history.go(-1)'>重新修改</a></center>");
}
%>
  </body>
</html>
