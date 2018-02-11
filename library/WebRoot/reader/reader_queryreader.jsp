<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ page language="java" contentType="text/html;charset=gbk" %>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'reader_queryreader.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#FFFFFF" topmargin="0" leftmargin="20">
 
<table align=center width=748>
<tr>
<td><img border="0" src="..\images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=..\main.jsp>〈〈返回首页</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>读者查询</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form name="f2" action="reader_query.jsp" method=get>
<table align=center>
<tr><td> 读者姓名:</td><td><input type=text name="name"></td>
</tr>
<tr><td> 所在院系:</td><td><input type=text name="dept"></td>
</tr>
<tr>
<td>读者分类：</td><td><select name="readertype">
  <option value="">--请选择--</option> 

 <%
  String sql="select * from reader_type";
  dbCon.getConnection();
  ResultSet rs=dbCon.executeQuery(sql);
  ////System.out.println(sql);
  while(rs.next())
  {
   %>
   <option value=<%=rs.getInt(1) %>><%=rs.getString("typename") %></option>
   <%
  }
   %>
  </select>
</td>
</tr>

<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="查找">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="重填" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
