<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'book_addnew.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type='text/javascript' src='..\js\checkall.js'></script>

  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><img border="0" src="..\images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=..\main.jsp>〈〈返回首页</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>新 书 入 库</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="book_add.jsp" method=post onsubmit="return check()">
<table>
<tr><td> 书名:</td><td><input type=text name="bookname"><font color="#FF0000">*</font></td>
</tr>
<tr>
<td>作者:</td><td><input type=text name="author1"><font color="#FF0000">*</font>&nbsp;&nbsp; <input type=text name="author2">&nbsp;&nbsp; <input type=text name="author3"></td></tr>
<tr>
<td>出版日期：</td><td><input type=text name="pubdate" >(YYYY-MM-DD)</td></tr>
<tr>
<td>出版社：</td><td><input type=text name="publish"></td></tr>

<tr><td>价格：</td><td><input type=text name="price"><font color="#FF0000">*</font></td></tr>
<tr><td>封面图片：</td><td><input type="file" size="30" name="photo" onchange="photochange2()"></td>
<td rowspan=4 valign=top><img name="img1" src="../images/images.jpeg" width="100" height="140"> 
</td></tr>
<tr><td>ISBN：</td><td><input type=text name="ISBN"><font color="#FF0000">*</font></td></tr>
<tr><td>学科分类：</td><td><select name="bookclass">
 <option>--请选择--</option>
 <%
  String sql="select * from book_class";
  dbCon.getConnection();
  ResultSet rs=dbCon.executeQuery(sql);
  while(rs.next())
  {
   %>
   <option value=<%=rs.getInt(1) %>><%=rs.getString("classname") %></option>
   <%
  }
   %>
  </select><font color="#FF0000">*</font></td></tr>
 <tr><td>藏书分类：</td><td><select name="booktype">
 <option>--请选择--</option>
 <%
  String sql2="select * from book_type";
  dbCon.getConnection();
  ResultSet rs2=dbCon.executeQuery(sql2);
  while(rs2.next())
  {
   %>
   <option value=<%=rs2.getInt(1) %>><%=rs2.getString("typename") %></option>
   <%
  }
   %>
  </select><font color="#FF0000">*</font>
</td></tr>
<tr><td>简介：</td><td><textarea name="abstract" maxLen="800" cols=51 rows=5></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="清空" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
