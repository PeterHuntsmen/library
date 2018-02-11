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
  <base href="<%=basePath%>">
    
    <title>My JSP 'book_bookclass_delete.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <%String classid=request.getParameter("classid").trim();
    
    String sql="select count(bookclass) bc from book where bookclass="+classid;
     //判断是否有属于该学科类型的图书
     dbCon.getConnection();
     ResultSet rs=dbCon.executeQuery(sql);
     rs.next();
     int n=rs.getInt("bc");
     ////System.out.print("************n="+n);
     if (n>0)
     out.print("<center>警告！<br><br>该类型的图书也将被删除，是否继续？ <a href=javascript:history.go(-1) ><br><br>否</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     "<a href='book/book_bookclass_deleteclass.jsp?classid="+classid+"'>是</a></center>");
     
      else
      {
      String sql1="delete from book where bookclass="+classid;
    
    String sql2="delete from book_class where classid="+classid;
    
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql1);
dbCon.executeUpdate(sql2);

out.print("<center>删除数据成功!<a href=javascript:history.go(-1) >返回</a></center>");
}
catch (Exception e)
{

out.print("<center>删除不成功!<a href=javascript:history.go(-1)>返回</a></center>");
}
  
      
      
      }

     %>
  </body>
</html>
