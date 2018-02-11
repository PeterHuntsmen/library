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
  
    
    <title>My JSP 'borrow_book_query.jsp' starting page</title>
    
	
	<link rel="stylesheet" type="text/css" href="..\css\default.css">
	

  </head>
  
  <body>
   <%
 //返回该页面时刷新数据
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);
   
   
   
//request.setCharacterEncoding("gb2312");
String readerid=request.getParameter("readerid");
String bookname=request.getParameter("bookname");
String author=request.getParameter("author").trim(); 
String ISBN=request.getParameter("ISBN").trim();
String publish=request.getParameter("publish").trim();

int row=0;

String sql="select * from book,borrow where book.bookid=borrow.bookid(+) and bookname like '%"+bookname+"%'";
if (author != null && (author.trim()).length() != 0)
{sql=sql+"and author1 like '%"+author+"%'";
}
if (publish != null && (publish.trim()).length() != 0)
{sql=sql+"and publish like '%"+publish+"%'";
}
if (ISBN != null && (ISBN.trim()).length() != 0)
{sql=sql+"and ISBN='"+ISBN+"'";
}
//System.out.println(sql);

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
    <td width="657"><a href=..\main.jsp>〈〈返回首页</a><a href="javascript:history.go(-1)">〈〈后退</a></td>
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
                  <td width="193" height="25" align="center" valign="middle" >书籍名称</td>
                   <td width="199" align="center" valign="middle" >ISBN</td>
                  <td width="199" align="center" valign="middle" >作者</td>
                   <td width="199" align="center" valign="middle" >出版社</td>
                   <td width="199" align="center" valign="middle" >状态</td>
                  <td width="250" align="center" valign="middle" >操作</td>
                </tr>
             
<%
dbCon.getConnection();
//System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
while(rs.next())
{
String bookid=rs.getInt("bookid")+"";
bookname=rs.getString("bookname");
author=rs.getString("author1");
publish=rs.getString("publish");
String borrowdate=rs.getString("borrowdate");
ISBN=rs.getString("ISBN");
%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=bookname%></td>
                  <td align="center" valign="middle" class="unnamed1 style1"><%=ISBN%></td>
                   <td align="center" valign="middle" class="unnamed1 style1"><%=author%></td>
                   <td align="center" valign="middle" class="unnamed1 style1"><%=publish%></td>
                   <td align="center" valign="middle" class="unnamed1 style1"><%if(borrowdate != null && (borrowdate.trim()).length() != 0)
                   out.print("未还");else out.print("在库");%></td>
                  <td align="center" valign="middle" class="unnamed1">
               
                  <a href="..\book\book_browse.jsp?bookid=<%=bookid%>" >查看</a>
                  <a href="borrow_book_borrow.jsp?bookid=<%=bookid%>&readerid=<%=readerid %>" >|借阅</a>
                  <a href="borrow_book_preconcert.jsp?bookid=<%=bookid%>&readerid=<%=readerid %>" >|预约</a></td>
                </tr>
				<% 
				row=rs.getRow();
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
                  <td width="582" height="20" align="center" valign="middle">共找到<%=row%>个信息</td>
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
