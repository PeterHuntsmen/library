<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'rule_add.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="..\js\checkall.js"></script>
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><img border="0" src="..\images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=..\main.jsp>����������ҳ</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>��ӹ���</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="rule_addrule.jsp" method=post onsubmit="return checkrule()">
<table>
<tr><td height="25" align="left" valign="middle" class="unnamed1 style1">
  <select name="readertype">
  <option>--��ѡ��--</option> 

 <%
  String sql="select * from reader_type";
  dbCon.getConnection();
  ResultSet rs=dbCon.executeQuery(sql);
  
  while(rs.next())
  {
   %>
   <option value=<%=rs.getInt(1) %>><%=rs.getString("typename") %></option>
   <%
  }
   %>
  </select>����߿��Խ��� <select name="booktype">
 <option>--��ѡ��--</option>
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
  </select>ͼ��<input type=text name="num">��������<input type=text name="days" value=30>�죬��������<input type=text name="renew" value=0>�Σ�
                  ���ڷ���<input type=text name=overtime value=0>Ԫ(ÿ��ÿ��)��
                  </td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="���">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="���" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
