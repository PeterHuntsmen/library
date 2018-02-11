<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>

<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'return_queryreader.jsp' starting page</title>
    
	
	<link rel="stylesheet" type="text/css" href="..\css\default.css">

  </head>
  
  <body>
    <%
    //返回该页面时刷新数据
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);
    
    request.setCharacterEncoding("gbk");
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
     <p align="center"><img border="0" src="..\images\title.JPG" width="738" height="124"></p>

     
     <table  align=center>
     <tr><td align=center>读者编号：<%=readerid %>
    &nbsp;&nbsp;&nbsp;&nbsp;姓名：<%=name %>&nbsp;&nbsp;&nbsp;&nbsp;
     所在院系：<%=dept%>&nbsp;&nbsp;&nbsp;&nbsp;电话：<%=telephone %>&nbsp;&nbsp;&nbsp;&nbsp;邮箱：<%=email %>&nbsp;&nbsp;&nbsp;&nbsp;权限：
     <%if (right==0)out.print("开通");else out.print("关闭");  %>
     &nbsp;&nbsp;&nbsp;&nbsp;<a href=..\main.jsp>〈〈返回首页</a></td></tr>
     </table>
    
    <table width="748" border="0" cellpadding="0" cellspacing="0"  align="center">
 
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
                  <td width="193" height="25" align="center" valign="middle" >书名</td>
                  <td width="193" height="25" align="center" valign="middle" >出借日期</td>
                  <td width="199" align="center" valign="middle" >应还日期</td>
                 
                  <td width="194" align="center" valign="middle" >操作</td>
                </tr>
             
<%

String sql1="select borrow.bookid,readerid,bookname,borrowdate,due from borrow ,book where borrow.bookid=book.bookid and readerid="+readerid;
dbCon.getConnection();
//System.out.println(sql1);
ResultSet rs1=dbCon.executeQuery(sql1);
int row1=0; 
while(rs1.next())
{
String bookid=rs1.getInt("bookid")+"";
String bookname=rs1.getString("bookname");
String borrowdate=rs1.getDate("borrowdate").toString();
String due=rs1.getDate("due").toString();


%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=bookname%></td>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=borrowdate%></td>
                  <td align="center" valign="middle" class="unnamed1 style1"><%=due%></td>
                   
                  <td align="center" valign="middle" class="unnamed1">
               
                  <a href="return_book_return.jsp?readerid=<%=readerid%>&bookid=<%=bookid %>" >归还</a>
                  <a href="return_book_renew.jsp?readerid=<%=readerid%>&bookid=<%=bookid %>" >| 续借</a>
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
                  <td width="582" height="20" align="center" valign="middle"><%=name %>共借阅<%=row1%>本书</td>
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
