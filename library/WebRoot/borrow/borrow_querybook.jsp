<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'borrow_querybook.jsp' starting page</title>
    
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
<tr><td><%

//返回该页面时刷新数据
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);


    request.setCharacterEncoding("gb2312");
    String name=request.getParameter("name");
    String readerid=request.getParameter("readerid");
    String dept="";
	int right=0;
	String telephone="";
	String email="";
    String sql="select  * from reader where  name like '%"+name+"%'";
    if(readerid != null && (readerid.trim()).length() != 0)
    sql=sql+" and readerid="+readerid;
   
    int row=0;
    
    dbCon.getConnection();
	//System.out.println(sql);
	ResultSet rs=dbCon.executeQuery(sql);
	
	while(rs.next())
	{
	 readerid=rs.getString("readerid");
	 name=rs.getString("name");
	 dept=rs.getString("dept");
	 right=rs.getInt("right");
	 telephone=rs.getString("telephone");
	 email=rs.getString("email");
	 row=rs.getRow();
	}
	if(row==0) {
	response.sendRedirect("notfound.jsp");}
     %> 
     <table>
     <tr><td><font size=2px color=blue><a href=..\main.jsp>〈〈返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;读者编号：<%=readerid %>
    &nbsp;&nbsp;&nbsp;&nbsp;姓名：<%=name %>&nbsp;&nbsp;&nbsp;&nbsp;
     所在院系：<%=dept%>&nbsp;&nbsp;&nbsp;&nbsp;电话：<%=telephone %>&nbsp;&nbsp;&nbsp;&nbsp;邮箱：<%=email %>&nbsp;&nbsp;&nbsp;&nbsp;权限：
     <%if (right==0)out.print("开通");else out.print("关闭");  %></font>
     </td></tr>
     </table></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>图书查询</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form name="f2" action="borrow_book_query.jsp" method=get>
<table align=center>
<tr><td> 书名:</td><td><input type=text name="bookname">
<input type="hidden" name=readerid value=<%=readerid %>></td>
</tr>
<tr>
<td>作者:</td><td><input type=text name="author"></td></tr>
<tr>
<td>出版社：</td><td><input type=text name="publish"></td></tr>

<tr><td>ISBN：</td><td><input type=text name="ISBN"></td></tr>

<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="查找">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="重填" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
