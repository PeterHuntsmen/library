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
<%
request.setCharacterEncoding("gb2312");
Integer booktype=Integer.valueOf(request.getParameter("booktype").trim());
Integer readertype=Integer.valueOf(request.getParameter("readertype").trim());

  String sql1="select * from rule where readertype="+readertype+" and booktype="+booktype;
dbCon.getConnection();
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int num=rs1.getInt("num");
int days=rs1.getInt("days");
int renew=rs1.getInt("renew");
Float overtime=rs1.getFloat("overtime");
 
 %>
<form  name="f1" action="rule_updaterule.jsp" method=post onsubmit="return checkrule()">
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
   <option value=<%=rs.getInt(1) %> <%if (rs.getInt(1)==readertype) {
   %>selected=selected<%} %>><%=rs.getString("typename") %></option>
   <%
  }
  dbCon.close();
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
   <option value=<%=rs2.getInt(1) %> <%if (rs2.getInt(1)==booktype) {%>selected<%} %>><%=rs2.getString("typename") %></option>
   <%
  }
  dbCon.close();
   %>
  </select>ͼ��<input type=text name="num" value=<%=num %>>��������<input type=text name="days" value=<%=days %>>�죬��������<input type=text name="renew" value=<%=renew %>>�Σ�
                  ���ڷ���<input type=text name=overtime value=<%=overtime %>>Ԫ(ÿ��ÿ��)��
                  </td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="�޸�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="���" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
