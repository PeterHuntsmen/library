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
    
    <title>My JSP 'book_booktype_delete.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <%String typeid=request.getParameter("typeid").trim();
    
    String sql="select count(booktype) bc from book where booktype="+typeid;
     //�ж��Ƿ������ڸ�ѧ�����͵�ͼ��
     dbCon.getConnection();
     ResultSet rs=dbCon.executeQuery(sql);
     rs.next();
     int n=rs.getInt("bc");
     ////System.out.print("************n="+n);
     if (n>0)
     out.print("<center>���棡<br><br>�����͵�ͼ��Ҳ����ɾ�����Ƿ������ <a href=javascript:history.go(-1) ><br><br>��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     "<a href='book/book_booktype_deletetype.jsp?typeid="+typeid+"'>��</a></center>");
     
      else
      {
      String sql1="delete from book where booktype="+typeid;
    
    String sql2="delete from book_type where typeid="+typeid;
    
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql1);
dbCon.executeUpdate(sql2);

out.print("<center>ɾ�����ݳɹ�!<a href=javascript:history.go(-1) >����</a></center>");
}
catch (Exception e)
{

out.print("<center>ɾ�����ɹ�!<a href=javascript:history.go(-1)>����</a></center>");
}
  
      
      
      }

     %>
  </body>
</html>
