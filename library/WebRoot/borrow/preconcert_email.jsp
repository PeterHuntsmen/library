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

    
    <title>My JSP 'preconcert_email.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String readerid=request.getParameter("readerid").trim();
    String bookid=request.getParameter("bookid").trim();
    String sql="select name,email,b.bookname from preconcert br ,book b, reader r where br.bookid=b.bookid and br.readerid=r.readerid and br.bookid="+bookid+" and br.readerid="+readerid;
    String sql2="delete from preconcert where bookid="+bookid+" and readerid="+readerid;
    dbCon.getConnection();
    ResultSet rs=dbCon.executeQuery(sql);
    String addr="";
    
    String bookname="";
 
    String note="";
    String name="";
    Connection con=dbCon.getConn();
      CallableStatement a;
    while(rs.next())
    {
    name=rs.getString("name");
    addr=rs.getString("email");
   
    bookname=rs.getString("bookname");
   
    note=name+" 读者，您好！您在本馆所预约图书<<"+bookname+">> 已到库，欢迎借阅！";
   a=con.prepareCall("{call send_mail(?,?,?)}"); 
a.setString(1,addr);  
a.setString(2,"图书预约答复");    
a.setString(3,note);
a.execute(); 

dbCon.executeUpdate(sql2);
 
  out.print("<center>通知发送完毕!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
    
    }
     %>
  </body>
</html>
