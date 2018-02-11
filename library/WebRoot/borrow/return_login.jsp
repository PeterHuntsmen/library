<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ page language="java" contentType="text/html;charset=gbk" %>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>―读者还书系统-</title>
<script type="text/javascript" src="..\js\checkall.js"></script>
</head>

<body bgcolor="#FFFFFF" topmargin="0" leftmargin="20">
<p align="center"><img border="0" src="..\images\title.JPG" width="738" height="124"></p>
<a href=..\main.jsp><font size=1px color=blue>〈〈返回首页</font></a>

<table height=200 cellspacing=0 cellpadding=0 width=325 background=L_bg2.gif border=0 align=center>

<tr>
   	<td><div style="padding-top: 1px; padding-bottom: 3px; background-repeat: no-repeat; background-attachment: fixed; background-position: center">
	<p align="center"><font color="#000080" face="楷体_GB2312" size="4">
	<b>还&nbsp;书&nbsp;读&nbsp;者&nbsp;信&nbsp;息</b></font><p align="center">　</div></td>
</tr>
<tr>
		<td>
		<form name=f1 method="get" action="return_queryreader.jsp" onSubmit="return checkreader()">
		<table align="center" width="254">
			<tr>
			<td align="left" nowrap><font face="楷体_GB2312" color="#000080"> 读者编号：</font></td>
			<td><input type="text" name="readerid" size="20"></td>
			</tr>
			<tr>
			<td align="center"><font face="楷体_GB2312" color="#000080">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</font></td>
			<td><input type="text" name="name"  size="21"></td>
			</tr>
			<tr>
			<td align="right" colspan=2><input type="submit" value="登录" name="B1">&nbsp;&nbsp; <input type="reset" value="重置" name="B2"></td>
			</tr>
		</table>
		</form>
		</td>
</tr>
</table>
</body>

</html>