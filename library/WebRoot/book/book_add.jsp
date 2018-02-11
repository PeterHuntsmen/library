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
String bookname=request.getParameter("bookname");
String booktype=request.getParameter("booktype");
String author1=request.getParameter("author1"); 
String author2=request.getParameter("author2"); 
String author3=request.getParameter("author3"); 
String photo=request.getParameter("photo");

String book_content=request.getParameter("abstract");
String pubdate=request.getParameter("pubdate");
String ISBN=request.getParameter("ISBN");
String price=request.getParameter("price");
String bookclass=request.getParameter("bookclass");
String publish=request.getParameter("publish");
String sql="insert into book(bookid,bookname,booktype,bookclass,author1,abstract,pubdate,publish,ISBN,price,photo) values(seq_book.nextval,'"+bookname+"','"+booktype+"','"+bookclass+"','"+author1+"','"+book_content+"',to_date('"+pubdate+"','yyyy-mm-dd'),'"+publish+"','"+ISBN+"',"+price+",'"+photo+"')";


try
{dbCon.getConnection();
dbCon.executeUpdate(sql);

out.print("<center>添加数据成功!<a href=book_addnew.jsp>继续添加</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
catch (Exception e)
{
out.print("<center>添加不成功!<a href=book_addnew.jsp>重新添加</a></center>");
}
%>
  </body>
</html>
