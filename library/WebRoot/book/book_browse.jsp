<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'book_browse.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><img border="0" src="images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=main.jsp>〈〈返回首页</a>&nbsp;&nbsp;
<a href="javascript:history.go(-1)">〈〈后退</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>查看图书</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
request.setCharacterEncoding("gb2312");
 
String bookid=request.getParameter("bookid").trim();

String sql="select * from book b,book_type bt,book_class bc where b.booktype=bt.typeid and b.bookclass=bc.classid and bookid = "+bookid;
dbCon.getConnection();
////System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String ISBN=rs.getString("ISBN");
String bookname=rs.getString("bookname");
String publish=rs.getString("publish");
String author1=rs.getString("author1");
String author2=rs.getString("author2");
String author3=rs.getString("author3");
String pubdate=rs.getString("pubdate");
if(pubdate!=null&&pubdate.length()>0)
{pubdate=pubdate.substring(0,10);}
String price=rs.getFloat("price")+"";
String bookclass=rs.getString("classname");
String booktype=rs.getString("typename");
String demo=rs.getString("abstract");
String photo=rs.getString("photo");

%>

<table>
<tr><td> 书名:</td><td><input type=text name="bookname" value="<%=bookname%>" readonly/></td>
<td>封面图片：</td><td rowspan=4 valign=top><%if (photo!=null && photo.length()>0) {%>
<img src="<%=photo %>" width="100" height="140"> <%}else {out.print("无");}%>
</td></tr>
<tr>
<td>作者:</td>
<td><input type="text" name="author1" value="<%=author1%>" readonly>
<%if (author2 != null && (author2.trim()).length()!= 0 && !author2.equalsIgnoreCase("null")) 
{%>
<input type="text" name="author2" value="<%=author2%>" readonly>
<%} %>
<%if (author3 != null && (author3.trim()).length()!= 0 && !author3.equalsIgnoreCase("null")) 
{%>
<input type="text" name="author3" value="<%=author3%>" readonly>
<%} %>
</td></tr>
<tr>
<td>出版日期：</td><td><input type=text name="pubdate" value="<%=pubdate %>" readonly/></td></tr>
<tr>
<td>出版社：</td><td><input type=text name="publish" value="<%=publish%>" readonly></td></tr>

<tr><td>价格：</td><td><input type=text name="price" value="<%=price %>"  readonly></td>
</tr>
<tr><td>ISBN：</td><td><input type=text name="ISBN" value="<%=ISBN %>" readonly/></td></tr>
<tr><td>学科分类：</td><td><input type="text" name="bookclass" value="<%=bookclass %>" readonly></td></tr>
<tr><td>藏书分类：</td><td><input type="text" name="booktype" value="<%=booktype %>" readonly></td></tr>
<tr><td>简介：</td><td><textarea name="abstract" maxLen="800" cols=51 rows=5 ><%=demo%></textarea></td></tr>

</table>

</body>
</html>
