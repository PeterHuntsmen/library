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
    
    <title>My JSP 'book_update.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   
request.setCharacterEncoding("gbk");
String bookid=request.getParameter("bookid");
String bookname=request.getParameter("bookname");
String booktype=request.getParameter("booktype");
String author1=request.getParameter("author1"); 
String author2=request.getParameter("author2"); 
String author3=request.getParameter("author3"); 
String photo=request.getParameter("photo").trim();
String demo=request.getParameter("abstract");
String pubdate=request.getParameter("pubdate").trim();
String ISBN=request.getParameter("ISBN");
String price=request.getParameter("price");
String bookclass=request.getParameter("bookclass");
String publish=request.getParameter("publish");

String sql="update book set bookname='"+bookname+"',booktype='"+booktype+"',bookclass='"
+bookclass+"',author1='"+author1+"',author2='"+author2+"',author3='"+author3+"',abstract='"+demo+"'";

if (pubdate !=null && ! pubdate.equalsIgnoreCase("null")   && pubdate.length()!=0)
{sql=sql+",pubdate=to_date('"+pubdate+"','yyyy-mm-dd')";}

sql=sql+",publish='"+publish+"',price="+price+",isbn='"+ISBN+"'";
if (photo !=null && ! photo.equals("null"))
{sql=sql+",photo='"+photo+"'"; }
sql=sql+" where bookid="+bookid;

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
