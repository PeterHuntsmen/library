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
      
    <title>My JSP 'borrow_book_preconcert.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
Integer bookid=Integer.valueOf(request.getParameter("bookid"));
Integer readerid=Integer.valueOf(request.getParameter("readerid"));

dbCon.getConnection();
Connection con=dbCon.getConn();
//判断该书是否在库
String sql1="select * from borrow where bookid="+bookid;
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int y=rs1.getRow();
if(y==0)
{
//该书在库
out.print("<center>该书已在库中!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
else
{

String sql="insert into preconcert(readerid,bookid,predate) values("+
readerid+","+bookid+",sysdate)";

dbCon.executeUpdate(sql);

out.print("<center>预约成功!<a href=javascript:history.go(-1)>继续借书</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
 

%>
  </body>
</html>
