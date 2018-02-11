<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'user_add.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="..\js\checkall.js">


</script>
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
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>添加账户</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="user_adduser.jsp" method=post onsubmit="return checkuser()">
<table>
<tr><td> 用户名:</td><td><input type=text name="name"><font color="#FF0000">*</font></td>
</tr>
<tr>
<td>密码:</td><td><input type=password name="password"><font color="#FF0000">*</font></td></tr>
<tr>
<td>确认密码:</td>
<td><input type="password" name="password2" ><font color="#FF0000">*</font></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="清空" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
