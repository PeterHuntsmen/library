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
    
    <title>My JSP 'reader_type_delete.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <%String typeid=request.getParameter("typeid").trim();
    String sql="select count(readertype) bc from reader where readertype="+typeid;
     //�ж��Ƿ������ڸ����͵Ķ���
     dbCon.getConnection();
     ResultSet rs=dbCon.executeQuery(sql);
     rs.next();
     int n=rs.getInt("bc");
     ////System.out.print("************n="+n);
     if (n>0)
     out.print("<center>���棡<br><br>�����͵Ķ���Ҳ����ɾ�����Ƿ������ <a href=javascript:history.go(-1) ><br><br>��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     "<a href='reader/reader_type_deletetype.jsp?typeid="+typeid+"'>��</a></center>");
     
      else
      {
      String sql1="delete from reader where readertype="+typeid;
    String sql2="delete from reader_type where typeid="+typeid;
      try
{dbCon.getConnection();
dbCon.executeUpdate(sql1);
dbCon.executeUpdate(sql2);

out.print("<center>ɾ���������ͳɹ�!<a href=javascript:history.go(-1) >����</a></center>");
}
catch (Exception e)
{

out.print("<center>ɾ���������Ͳ��ɹ�!<a href=javascript:history.go(-1)>����</a></center>");
}
 }    %>
  </body>
</html>
