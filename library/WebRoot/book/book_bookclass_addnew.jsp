<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'book_bookclass_addnew.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">

//验证表单的非空函数
function check()
{
	var name = document.f1.classname.value;
	
	if(name==""){
		alert("学科类型不能为空");
		document.f1.classname.focus();
		return false;
	}
	return true;
	
}
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
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>新增学科类型</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="book_bookclass_add.jsp" method=post onsubmit="return check()">
<table>
<tr><td> 学科类型:</td><td><input type=text name="classname"><font color="#FF0000">*</font></td>
</tr>

<tr><td>备注：</td><td><textarea name="demo" maxLen="800" cols=51 rows=5></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="取消" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
