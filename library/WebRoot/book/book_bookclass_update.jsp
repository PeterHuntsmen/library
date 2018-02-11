<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'book_bookclass_update.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><br></td>

</tr>
<tr><td><a href=..\main.jsp>〈〈返回首页</a>&nbsp;&nbsp;<a href="javascript:history.go(-1)">〈〈后退</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>修改学科类型</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
   
request.setCharacterEncoding("gb2312");
 
String classid=request.getParameter("classid").trim();

String sql="select * from book_class where classid = "+classid;
dbCon.getConnection();
////System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String classname=rs.getString("classname");
String demo=rs.getString("demo");



%>
<form  name="f1" action="book_bookclass_updateclass.jsp" method=post onsubmit="return check()">
<table>
<tr><td> 学科类型:</td><td><input type="hidden" name=classid value=<%=classid %>>
<input type=text name="classname" value=<%=classname %>></td>
</tr>
<tr><td>备注：</td><td><textarea name="demo" maxLen="800" cols=51 rows=5><%=demo %></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="取消" name="cancel" onclick="javascript:history.go(-1)"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
