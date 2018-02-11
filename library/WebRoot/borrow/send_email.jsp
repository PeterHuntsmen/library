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
  
    
    <title>My JSP 'send_email.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="..\css\default.css">
	

  </head>
  
  <body>
   <%
 
   
   
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
  <form name=f1 action=send_email_tourge.jsp method=post>
  	<table width="348" border="0" cellpadding="0" cellspacing="0"  align="center"><tr>
        		<td  align=center><font size=2px>发送催还邮件</font></td>
        		
       			</tr>
       			<tr><td height=30>&nbsp;</td></tr>
       			<tr>
        			<td >
       		 			
                       提前<select name=days>
                       <option value=3>3</option>
                       <option value=5>5</option>
                       <option value=10>10</option>
                       </select>天催还图书
                         
                         
   					</td>
   					
  	   			
  	   			<td align=right><input type="submit" name="submit" value="发送邮件">
  	   			</td>
  	   			</tr>
   			</table>
  </form>
   
</body>
</html>
