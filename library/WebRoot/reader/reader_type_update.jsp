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
    
    <title>My JSP 'reader_type_update.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><br></td>

</tr>
<tr><td><a href=main.jsp>����������ҳ</a>&nbsp;&nbsp;<a href="javascript:history.go(-1)">��������</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>�޸Ķ�������</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
   
request.setCharacterEncoding("gb2312");
 
String typeid=request.getParameter("typeid").trim();

String sql="select * from reader_type where typeid = "+typeid;
dbCon.getConnection();
//System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String typename=rs.getString("typename");
String demo=rs.getString("demo");



%>
<form  name="f1" action="reader\reader_type_updatetype.jsp" method=post onsubmit="return check()">
<table>
<tr><td> ��������:</td><td><input type="hidden" name=typeid value=<%=typeid %>>
<input type=text name="typename" value=<%=typename %>></td>
</tr>
<tr><td>��ע��</td><td><textarea name="demo" maxLen="800" cols=51 rows=5><%=demo %></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="�޸�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="ȡ��" name="cancel" onclick="javascript:history.go(-1)"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
