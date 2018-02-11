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
    <base href="<%=basePath%>">
    
    <title>My JSP 'preconcert_browse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css\default.css">
	

  </head>
  
  <body>
 <% //返回该页面时刷新数据
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);
%>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 width=748>
  
  <tr>
    <td align="left" valign="top" height="68">
      <img border="0" src="images\title.JPG" width="738" height="124"></td>
  </tr>
  </table>

<table  width="600" border="0" cellpadding="0" cellspacing="0"  align="center">
  <tr>
    
    <td width="357">&nbsp;<a href=main.jsp><font color=red>〈〈返回首页</font></a>&nbsp;</td></tr>
 
  <tr>
    
    <table  bgcolor="#FFFFFF" class=default align=center>
                     
                <tr class=title>
                  <td width="193" height="25" align="center" valign="middle" >读者姓名</td>
              
                   <td width="199" align="center" valign="middle" >图书</td>
                   <td width="199" align="center" valign="middle" >预约日期</td>
                  <td width="194" align="center" valign="middle" >操作</td>
                </tr>
             
<%
int row=0;
dbCon.getConnection();
String sql="select p.readerid rid,name,bookname,p.bookid bid,predate from preconcert p,book b,reader r "+
" where p.bookid=b.bookid and p.readerid=r.readerid";
ResultSet rs=dbCon.executeQuery(sql);
  
while(rs.next())
{

int readerid=rs.getInt("rid");
int bookid=rs.getInt("bid");
String rname=rs.getString("name");
String bname=rs.getString("bookname");
String predate=String.valueOf(rs.getDate("predate"));

%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=rname%></td>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=bname%></td>
                  <td align="center" valign="middle" class="unnamed1 style1"><%=predate %></td>
         
                  <td align="center" valign="middle" class="unnamed1">
               
                  <a href="borrow\preconcert_delete.jsp?bookid=<%=bookid%>&readerid=<%=readerid %>">删除</a>|
                   <a href="borrow\preconcert_email.jsp?bookid=<%=bookid%>&readerid=<%=readerid %>">发送邮件</a>
                  </td>
                </tr>
				<% 
				row=rs.getRow();
				}%>
            </table>
          </tr>
          <tr>
          <table>
               
                <tr>
                  <td width="582" height="20" align="center" valign="middle">共找到<%=row%>个预约信息</td>
                </tr>
            </table>
          </tr>
   
        </table>
 
</body>
</html>
