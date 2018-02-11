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

    
    <title>My JSP 'send_email_tourge.jsp' starting page</title>
    
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
    String days=request.getParameter("days").trim();
    String sql="select name,email,to_char(due,'yyyy-mm-dd') due,b.bookname,isbn from borrow br ,book b, reader r where br.bookid=b.bookid and br.readerid=r.readerid and ( abs(sysdate-due)<"+days+" or sysdate>due)";
    dbCon.getConnection();
    ResultSet rs=dbCon.executeQuery(sql);
    String addr="";
    String due="";
    String bookname="";
    String isbn="";
    String note="";
    String name="";
    Connection con=dbCon.getConn();
      CallableStatement a;
      a=con.prepareCall("{call send_mail(?,?,?)}"); 
    while(rs.next())
    {
    name=rs.getString("name");
    addr=rs.getString("email");
    due=rs.getString("due");
    bookname=rs.getString("bookname");
    isbn=rs.getString("isbn");
    note=name+" 读者，您好！您在本馆所借图书<<"+bookname+">> (图书条码 "+isbn+",应还日期 "+due+"，请速归还。谢谢您的合作！";
   
a.setString(1,addr);  
a.setString(2,"图书催还通知");    
a.setString(3,note);
a.execute();  
   
    }
    out.print("<center>通知发送完毕!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
   
     %>
  </body>
</html>
