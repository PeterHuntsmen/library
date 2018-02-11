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
  
    
    <title>My JSP 'book_stat.jsp' starting page</title>
    
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

String sql="select typename,countall, priceall,countnew,pricenew from "+
"(select booktype,count(*) countall,sum(price) priceall from book group by booktype) b1,"+
"(select booktype,count(*) countnew,sum(price) pricenew from book where extract(year from pubdate)=extract(year from sysdate) group by booktype) b2,"+
"book_type bt where b1.booktype(+)=bt.typeid and b2.booktype(+)=bt.typeid";



////System.out.println(sql);
////System.out.println(sql1);
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
        
          <tr>
            <td width="20" height="15">&nbsp;</td>
            <td width="582">&nbsp;</td>
            <td width="22">&nbsp;</td>
          </tr>
          <tr>
            <td height="50">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" class=default>
              
                <tr class=title>
                <td width="193" height="25" align="center" valign="middle" >藏书类型</td>
                  <td width="193" height="25" align="center" valign="middle" >总册数</td>
                  <td width="199" align="center" valign="middle" >总价格</td>
                   <td width="199" align="center" valign="middle" >今年新书</td>
                  <td width="194" align="center" valign="middle" >新书总价</td>
                </tr>
             
<%
dbCon.getConnection();
////System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
while(rs.next())
{

String typename=rs.getString("typename");
String countall=rs.getInt("countall")+"";
String priceall=rs.getFloat("priceall")+"";
String countnew=rs.getInt("countnew")+"";
String pricenew=String.valueOf(rs.getFloat("pricenew"));
%>
                <tr>
                  <td height="25" align="center" valign="middle" class="unnamed1 style1"><%=typename%></td>
                  <td align="center" valign="middle" class="unnamed1 style1"><%if (countall != null && (countall.trim()).length() != 0) out.print(countall);else out.print("0");%></td>
                  <td align="center" valign="middle" class="unnamed1 style1"><%if (priceall != null && (priceall.trim()).length() != 0) out.print(priceall);else out.print("0");%></td>
                   <td align="center" valign="middle" class="unnamed1 style1"><%if (countnew != null && (countnew.trim()).length() != 0) out.print(countnew);else out.print("0");%></td>
                   <td align="center" valign="middle" class="unnamed1 style1"><%if (pricenew != null && (pricenew.trim()).length() != 0) out.print(pricenew);else out.print("0");%></td>
                </tr>
<%} %>				
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="20"></td>
            
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
               
                
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
