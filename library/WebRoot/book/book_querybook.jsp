<%@ page language="java"  pageEncoding="gbk"%>
<%@ page language="java" contentType="text/html;charset=gbk" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'book_querybook.jsp' starting page</title>
    
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
<tr><td><a href=..\main.jsp>����������ҳ</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>ͼ���ѯ</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form name="f2" action="book_query.jsp" method="get">
<table align=center>
<tr><td> ����:</td><td><input type=text name="bookname"></td>
</tr>
<tr>
<td>����:</td><td><input type=text name="author"></td></tr>
<tr>
<td>�����磺</td><td><input type=text name="publish"></td></tr>

<tr><td>ISBN��</td><td><input type=text name="ISBN"></td></tr>

<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="����">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="����" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
