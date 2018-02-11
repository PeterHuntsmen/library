<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'borrow_stat.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="..\css\default.css">
	

  </head>
  
  <body>
   <%
 //返回该页面时刷新数据
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);
   
   
   
request.setCharacterEncoding("gb2312");

String sql1="select count(*) from borrow";
String sql2="select count(distinct bookid) from borrow ";
String sql3="select count(distinct readerid) from borrow";
String sql4="select count(*) from reader";
String sql5="select count(*) from book";
dbCon.getConnection();
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int bw_num=rs1.getInt(1);
ResultSet rs2=dbCon.executeQuery(sql2);
rs2.next();
int bb_num=rs2.getInt(1);
ResultSet rs3=dbCon.executeQuery(sql3);
rs3.next();
int br_num=rs3.getInt(1);
ResultSet rs4=dbCon.executeQuery(sql4);
rs4.next();
int r_num=rs4.getInt(1);
ResultSet rs5=dbCon.executeQuery(sql5);
rs5.next();
int b_num=rs5.getInt(1);


%>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 width=748>
 <tr>
    <td align="left" valign="top" height="68">
      <img border="0" src="..\images\title.JPG" width="738" height="124"></td>
  </tr>
 </table>
 	<table width="748" border="0" cellpadding="0" cellspacing="0"  align="center">
  	<tr>
    	<td width="17" height="26">&nbsp;</td>
    	<td width="657"><a href=..\main.jsp>〈〈返回首页</a></td>
    	<td width="16">&nbsp;</td>
  	</tr>
  </table>
  	<table width="748" border="0" cellpadding="0" cellspacing="0"  align="center"><tr>
        		<td  align=center><font size=2px>借 阅 情 况 统 计</font></td>
        		
       			</tr>
       			<tr><td height=30>&nbsp;</td></tr>
       			<tr>
        			<td align="center">
       		 			
                         共有图书<font color=red><%=b_num %></font>本，现出借图书<font color=red><%=bb_num %></font>本，
                         占图书总数<font color=red><%=100*bb_num/b_num %>%</font>。<br>
                         共有读者<font color=red><%=r_num %></font>名，现在借书的读者<font color=red><%=br_num %></font>位，占读者总数<font color=red>
                         <%=100*br_num/r_num %>%</font>。
                         
   					</td>
  	   			</tr>
   			</table>
  
   
</body>
</html>
