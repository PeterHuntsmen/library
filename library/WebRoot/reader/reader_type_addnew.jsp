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
    
    <title>My JSP 'reader_type_addnew.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">

//��֤���ķǿպ���
function check()
{
	var name = document.f1.typename.value;
	
	if(name==""){
		alert("�������Ͳ���Ϊ��");
		document.f1.typename.focus();
		return false;
	}
	return true;
	
}
</script>
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><img border="0" src="images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=main.jsp>����������ҳ</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>��Ӷ�������</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="reader\reader_type_add.jsp" method=post onsubmit="return check()">
<table>
<tr><td> ��������:</td><td><input type=text name="typename"><font color="#FF0000">*</font></td>
</tr>

<tr><td>��ע��</td><td><textarea name="demo" maxLen="800" cols=51 rows=5></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="���">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="���" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
