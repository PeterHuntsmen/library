<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>

<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'rule_management.jsp' starting page</title>
    
	
	<link rel="stylesheet" type="text/css" href="..\css\default.css">

  </head>
  
  <body>
    <%
    //���ظ�ҳ��ʱˢ������
  response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "must-revalidate");
response.setDateHeader("Expires",0);
    %>
      <p align="center"><img border="0" src="..\images\title.JPG" width="738" height="124"></p>
<a href=..\main.jsp>����������ҳ</a>
     
     <table  align=center>
     <tr><td>���Ĺ���һ��</td></tr>
      
     </table>
    
    <table width="748" border="0" cellpadding="0" cellspacing="0"  align="center">
 
  <tr><td></td><td align=right><a href="rule_add.jsp">��ӹ���</a></td><td></td></tr>
    <tr><td height="105"></td>
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
               
  <tr><td height="25" width="70"></td>
      <td height="25" width="300"></td>
      <td height="25" width="125"></td>
      </tr>                      
<%

String sql1="select booktype,readertype,bt.typename bname,rt.typename rname,num,days,renew,overtime from rule r,book_type bt,reader_type rt"+
" where r.booktype=bt.typeid and r.readertype=rt.typeid order by readertype";
dbCon.getConnection();

ResultSet rs1=dbCon.executeQuery(sql1);
int row1=0; 
while(rs1.next())
{
int booktype=rs1.getInt("booktype");
int readertype=rs1.getInt("readertype");
String  bn=rs1.getString("bname");
String  rn=rs1.getString("rname");
int num=rs1.getInt("num");
int days=rs1.getInt("days");
int renew=rs1.getInt("renew");
Float overtime=rs1.getFloat("overtime");
row1=rs1.getRow();

%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1">
                  ����<%=row1 %>:
                  </td>
                  <td height="25" align="left" valign="middle" class="unnamed1 style1">
                  <font color=red><%=rn %></font>����߿��Խ��� <font color=red><%=bn%></font>ͼ��<font color=red><%=num %></font>��������<font color=red><%=days %></font>�죬��������<font color=red><%=renew %></font>�Σ�
                  ���ڷ���<font color=red><%=overtime %></font>Ԫ(ÿ��ÿ��)��
                  </td>
                  
                  
                  <td align="center" valign="middle" class="unnamed1">
               
                  <a href="rule_update.jsp?booktype=<%=booktype%>&readertype=<%=readertype%>" >�޸�</a>
                  <a href="rule_delete.jsp?booktype=<%=booktype%>&readertype=<%=readertype%>" >| ɾ��</a>
                  </td>
                </tr>
				<% 
				
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
                  <td width="582" height="20" align="center" valign="middle">����<%=row1%>������</td>
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
    
  </body>
</html>
