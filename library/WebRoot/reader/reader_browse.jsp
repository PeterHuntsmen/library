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
    
    <title>My JSP 'reader_browse.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><img border="0" src="images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=main.jsp>����������ҳ</a>&nbsp;&nbsp;
<a href="javascript:history.go(-1)">��������</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>�鿴����</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
request.setCharacterEncoding("gb2312");
 
String readerid=request.getParameter("readerid").trim();

String sql="select * from reader r ,reader_type rt where r.readertype=rt.typeid and readerid = '"+readerid+"'";
dbCon.getConnection();
////System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String name=rs.getString("name");
String telephone=rs.getString("telephone");
String email=rs.getString("email");
String dept=rs.getString("dept");
String readertype=rs.getString("typename");
String demo=rs.getString("demo");
int right=rs.getInt("right");
%>

<table>
<tr><td> ���߱��:</td><td><input type=text name="readerid" value="<%=readerid%>" readonly/></td>
</tr>
<tr><td> ��������:</td><td><input type=text name="name" value="<%=name%>" readonly/></td>
</tr>

<tr>
<td>�绰:</td>
<td><input type="text" name="telephone" value="<%=telephone%>" readonly>
</td></tr>
<tr>
<td>���䣺</td><td><input type=text name="email" value="<%=email %>" readonly /></td></tr>
<tr>
<td>����Ժϵ��</td><td><input type=text name="dept" value="<%=dept%>" readonly></td></tr>
<tr><td>���߷��ࣺ</td><td><input type="text" name="readertype" value="<%=readertype%>" readonly=readonly></td></tr>
<tr><td>����Ȩ�ޣ�</td><td><input type="text" name="right" <%String r;if (right==0) r="�ѿ�ͨ";else r="�ѹر�";%>value=<%=r %> readonly=readonly></td></tr>
<tr><td>��ע��</td><td><textarea name="demo" maxLen="800" cols=51 rows=5 ><%=demo%></textarea></td></tr>

</table>

</body>
</html>
