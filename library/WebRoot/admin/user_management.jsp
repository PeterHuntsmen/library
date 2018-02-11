<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>

<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'user_management.jsp' starting page</title>
    
	
	<link rel="stylesheet" type="text/css" href="..\css\default.css">

  </head>
  
  <body>
    <%
    //返回该页面时刷新数据
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);
    %>
      <p align="center"><img border="0" src="..\images\title.JPG" width="738" height="124"></p>
<a href=..\main.jsp>〈〈返回首页</a>
     
        
    <table width="748" border="0" cellpadding="0" cellspacing="0"  align="center">
    
  <tr>
    
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr><td class=headline colspan=3>查看管理员账户</td></tr>
      
    <tr><td align=right colspan=2><a href="user_add.jsp">添加账户</a></td></tr>
      <tr>
        <td width="12" height="13">&nbsp;</td>
        <td width="632">&nbsp;</td>
        <td width="9">&nbsp;</td>
        </tr><tr><td height="105"></td>
        <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF" >
        
          <tr>
            <td width="20" height="15">&nbsp;</td>
            <td width="582">&nbsp;</td>
            <td width="22">&nbsp;</td>
          </tr>
          <tr>
            <td height="50">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" class=default>
               
                <tr class=title>
                  <td width="193" height="25" align="center" valign="middle" >用户名</td>
                  <td width="193" height="25" align="center" valign="middle" >口令</td>
                  <td width="194" align="center" valign="middle" >操作</td>
                </tr>
             
<%

String sql1="select *from admin order by id";
dbCon.getConnection();

ResultSet rs1=dbCon.executeQuery(sql1);
int row1=0; 
while(rs1.next())
{
int userid=rs1.getInt("id");
String user=rs1.getString("username");
String password=rs1.getString("password");

%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=user%></td>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=password%></td>
                  
                  <td align="center" valign="middle" class="unnamed1">
               
                  <a href="user_update.jsp?userid=<%=userid%>" >修改</a>
                  <a href="user_delete.jsp?userid=<%=userid %>" >| 删除</a>
                  </td>
                </tr>
				<% 
				row1=rs1.getRow();
				}
				dbCon.close();%>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="20"></td>
            
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <!--DWLayoutTable-->
                <tr>
                  <td  height="20" align="center" valign="middle">共有<%=row1%>个账号</td>
                </tr>
            </table></td>
            <td></td>
          </tr>
          <tr>
            <td height="10"></td>
            <td></td>
            <td></td>
          </tr>
        </table></td>
        <td></td>
        </tr><tr><td height="5"></td>
        <td></td>
        <td></td>
        </tr>
      
      
    </table>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="13">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
  </body>
</html>
