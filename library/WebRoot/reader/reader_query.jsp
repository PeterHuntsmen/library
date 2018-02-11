<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ page language="java" contentType="text/html;charset=gbk" %>
<%@page import="db.dbConn;"%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'reader_query.jsp' starting page</title>
    
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
String name=request.getParameter("name");

//String name=new String(request.getParameter("name").getBytes("8859_1"),"gbk");
String dept=request.getParameter("dept").trim(); 
String readertype=request.getParameter("readertype").trim();


int row=0;

String sql="select * from reader where name like '%"+name+"%'";
if (dept != null && (dept.trim()).length() != 0)
{sql=sql+"and dept like '%"+dept+"%'";
}
if (readertype != null && (readertype.trim()).length() != 0)
{
////System.out.println(readertype);
sql=sql+"and readertype ="+readertype;
}
sql=sql+" order by readerid";
////System.out.println(sql);

%>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 width=748>
  
  <tr>
    <td align="left" valign="top" height="68">
      <img border="0" src="..\images\title.JPG" width="738" height="124"></td>
  </tr>
  <tr>
<table width="748" border="0" cellpadding="0" cellspacing="0"  align="center">
  <tr>
    <td width="17" height="26">&nbsp;</td>
    <td width="657"><a href=..\main.jsp>〈〈返回首页</a></td>
    <td width="16">&nbsp;</td>
  </tr>
  <tr>
    <td height="123">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="12" height="13">&nbsp;</td>
        <td width="632">&nbsp;</td>
        <td width="9">&nbsp;</td>
        </tr><tr><td height="105"></td>
        <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF" >
         <tr><td colspan=3 align=center class=headline>查看读者信息</td></tr>
          <tr>
            <td width="20" height="15">&nbsp;</td>
            <td width="582">&nbsp;</td>
            <td width="22">&nbsp;</td>
          </tr>
          <tr>
            <td height="50">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" class=default>
                <!--DWLayoutTable-->
                <tr class=title>
                  <td width="193" height="25" align="center" valign="middle" >读者编号</td>
                  <td width="193" height="25" align="center" valign="middle" >读者姓名</td>
                  <td width="199" align="center" valign="middle" >所在院系</td>
                   <td width="199" align="center" valign="middle" >权限</td>
                  <td width="194" align="center" valign="middle" >操作</td>
                </tr>
             
<%
dbCon.getConnection();
//System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
while(rs.next())
{
int readerid=rs.getInt("readerid");
name=rs.getString("name");
dept=rs.getString("dept");
int right=rs.getInt("right");
%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=readerid%></td>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=name%></td>
                  <td align="center" valign="middle" class="unnamed1 style1"><%=dept%></td>
                   <td align="center" valign="middle" class="unnamed1 style1"><%if (right==0) out.print("开通");else out.print("关闭");%></td>
                  <td align="center" valign="middle" class="unnamed1">
               
                  <a href="reader_browse.jsp?readerid=<%=readerid%>" onMouseOver="window.status='欢迎使用图书馆后台管理系统';return true;">查看</a>
                    </tr>
				<% 
				row=rs.getRow();
				}%>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="20"></td>
            
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <!--DWLayoutTable-->
                <tr>
                  <td  height="20" align="center" valign="middle">共找到<%=row%>个信息</td>
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
   </tr>
                </table>
</body>
</html>
