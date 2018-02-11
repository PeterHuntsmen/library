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
    
    <title>My JSP 'book_updatebook.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <script type='text/javascript' src='js\checkall.js'></script> 
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><br></td>

</tr>
<tr><td><a href=main.jsp>〈〈返回首页</a>&nbsp;&nbsp;<a href="javascript:history.go(-1)">〈〈后退</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>修改图书信息</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
   
request.setCharacterEncoding("gb2312");
 
String bookid=request.getParameter("bookid").trim();

String sql="select * from book  where bookid = "+bookid;
dbCon.getConnection();
////System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String bookname=rs.getString("bookname");
String publish=rs.getString("publish");
String author1=rs.getString("author1");
String author2=rs.getString("author2");
String author3=rs.getString("author3");
String pubdate=rs.getString("pubdate");
String price=rs.getFloat("price")+"";
String photo=rs.getString("photo");
Integer bookclass=rs.getInt("bookclass");
Integer booktype=rs.getInt("booktype");
String demo=rs.getString("abstract");
String ISBN=rs.getString("isbn");

%>
<form  name="f1" action="book/book_update.jsp" method="post" onsubmit="return check()">
<table>
<tr><td> 书名:</td><td><input type=hidden name=bookid value=<%=bookid %>>
<input type=text name="bookname" value=<%=bookname %>><font color="#FF0000">*</font></td>
</tr>
<tr>
<td>作者:</td><td><input type=text name="author1" value=<%=author1 %>><font color="#FF0000">*</font> &nbsp;&nbsp;<input type=text name="author2" <%if (author2 != null && (author2.trim()).length() != 0){%>value=<%=author2 %> <%} %>>&nbsp;&nbsp; <input type=text name="author3" <%if (author3 != null && (author3.trim()).length() != 0){%>value=<%=author3 %> <%} %>></td></tr>
<tr>
<td>出版日期：</td><td><input type=text name="pubdate"<%if (pubdate != null && (pubdate.trim()).length() != 0 && !pubdate.equalsIgnoreCase("null")){%>value=<%=pubdate %> <%} %>>(YYYY-MM-DD)</td></tr>
<tr>
<td>出版社：</td><td><input type=text name="publish" value=<%=publish %>></td></tr>

<tr><td>价格：</td><td><input type=text name="price" value=<%=price %>><font color="#FF0000">*</font></td>
<td>
<input type="hidden" name="photo" value="<%=photo %> ">
</td>
</tr>

<tr><td>封面图片：</td><td><input type="file" size="30" name="file1" onchange="photochange()" ></td>
<td rowspan=4 valign=top><%if (photo!=null && photo.length()>0) {%>
<img name="img1" src="<%=photo %>" width="100" height="140"> <%}else{%><img name="img1" src="images/images.jpeg" width="100" height="140"> <%} %>
</td></tr>

<tr><td>ISBN：</td><td><input type=text name="ISBN" value=<%=ISBN %> ><font color="#FF0000">*</font></td></tr>
<tr><td>学科分类：</td><td><select name="bookclass">
 <option value="">--请选择--</option>
 <%
  String sql2="select * from book_class";
  dbCon.getConnection();
  ResultSet rs2=dbCon.executeQuery(sql2);
  while(rs2.next())
  {
   %>
   <option value=<%=rs2.getInt(1) %><%if(rs2.getInt(1)==bookclass) {%> selected="selected"<%} %>><%=rs2.getString("classname") %></option>
   <%
  }
   %>
  </select><font color="#FF0000">*</font></td></tr>
 <tr><td>藏书分类：</td><td><select name="booktype">
 <option value="">--请选择--</option>
 <%
  String sql3="select * from book_type";
  dbCon.getConnection();
  ResultSet rs3=dbCon.executeQuery(sql3);
  while(rs3.next())
  {
   %>
   <option value=<%=rs3.getInt(1) %> 
   <%if(rs3.getInt(1)==booktype) {%> selected="selected"<%} %>><%=rs3.getString("typename") %></option>
   
   <%
   
  }
   %>
  </select><font color="#FF0000">*</font>
</td></tr>
<tr><td>简介：</td><td><textarea name="abstract" maxLen="800" cols=51 rows=5><%if (demo != null && (demo.trim()).length() != 0 && ! demo.equalsIgnoreCase("null")){%> <%=demo %> <%} %></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="取消" name="cancel" onclick="javascript:history.go(-1)"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
