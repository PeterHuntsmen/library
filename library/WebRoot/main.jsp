<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>数字图书馆</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="cache-control" content="must-revalidate">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
<STYLE type=text/css>
<!--
a:link { text-decoration: none}
a:visited { text-decoration: none; color: #484307}
a:hover { text-decoration: underline; color: #FF6600}
-->
.style1 {
	COLOR: #003300; font-size: 12px}
.style2 {
	COLOR: #ff7c19
; font-size: 12px}
.style3 {  font-size: 12px; line-height: 18px; color: #000000}
</STYLE>
<META content="MSHTML 6.00.2800.1515" name=GENERATOR>
</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 width=748>
  <TBODY>
    <tr>
    <td align="left" valign="top" height="68"><img border="0" src="images\title.JPG" width="738" height="124"></td>
    </tr>
       
    <TR>
    <TD bgColor=#ffffff height="296" valign="top" align="center" width="584">
      <table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="210" height="293">
            <table width="210" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="300" width="210" valign="top">
                  <table width="210" border="0" cellspacing="0" cellpadding="0" height="290">
                    <tr>
                      <td height="8"></td>
                    </tr>
                    <tr>
                      <td valign="bottom"><img src="images\notice.gif" width="210" height="51"></td>
                    </tr>
                    <tr>
                      <td background="images\L_bg.gif" height="225" valign="top" align="center">
                        <table width="95%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="213" valign="top"><MARQUEE id=info onmouseover=info.stop()
                        onmouseout=info.start() scrollAmount=1 scrollDelay=1
                        direction=up width="100%" height=180 >
                                <table width="95%" border="0" cellspacing="0" cellpadding="0" class="style2">
                                  <tr>
                                    <td><strong>
									<br><br>    图书馆“端午节”期间开馆时间公布如下：
<br> 1.5月28日为国家法定假日农历端午节，图书馆闭馆一天；；
<br> 2.5月29日、30日，中心阅览室A5 301照常开放， A5 101书库关闭；
<br> 3.其他自习室照常开放，时间为7：00-22：00；
<br>     以上内容，望周知。
<br>     祝全体师生端午节快乐！
									<br><br>
									</strong></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                  </tr>
                                </table></MARQUEE>

                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td height="293">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top" height="295" align="right">&nbsp; </td>
                <td height="295" align="right">
                  <table height=300 cellspacing=0 cellpadding=0 width=525
            background=images\M_bg.jpg border=0>
                      
                    	<tr valign=top>
                      		<td width=10>　</td>
                     		 <td width=127>
                       			 <table width="80%" border="0" cellspacing="0" cellpadding="0">
                         			 <tr>
                            			<td height="40"  align="center"><font face="华文楷体" color="#003300" ><br>图书管理</font></td>
                          			</tr>
                        		 </table>
                       			 <table class=style1 cellspacing=0 cellpadding=0 width=120
                  background=images\M1.gif border=0>
                         			 <tbody>
                          				<tr valign=bottom>
                            				<td height=28 width="27" >　</td>
                            				<td width=91 height=28 ><a href="book\book_addnew.jsp"><font color="#003300">新书入库</font></a></td>
                          				</tr>
                          				<tr valign=bottom>
                            				<td height=28 width="27">　</td>
                            				<td height=28 width="91" >
												<a href="book\book_listbook.jsp"><font color="#003300">维护图书</font></a></td>
                          				</tr>
                          				<tr valign=bottom>
                           					 <td height=27 width="27" >　</td>
                           					 <td height=28 width="91" >
												<a href="book\book_querybook.jsp">
													<font color="#003300">查询图书</font></a></td>
                          				</tr>
                           				<tr valign=bottom>
                            				<td height=27 width="27" >　</td>
                            				<td height=28 width="91" ><a href="book\book_booktype.jsp">藏书类别</a></td>
                          				</tr>
                          <tr valign=bottom>
                            <td height=27 width="27" >　</td>
                            <td height=28 width="91" > <a href="book\book_bookclass.jsp">学科分类</a></td>
                          </tr>
                          <tr valign=bottom>
                            <td height=28 width="27" >　</td>
                            <td height=28 width="91" > <a href="book\book_stat.jsp">图书统计</a></td>
                          </tr>
                          
                        </table>
                    
                      <td width=127>
                        <table width="80%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="40">
							<p align="center"><font face="华文楷体" color="#003300">
							<span style="vertical-align: middle"><br>读者管理</span></font></td>
                          </tr>
                        </table>
                        <table cellspacing=0 cellpadding=0 width=120
                  background=images\M2.gif border=0>
                          <tbody>
                          <tr valign=bottom>
                            <td height=28 width="27">&nbsp;&nbsp;&nbsp;</td>
                            <td height=28 >
							<a href="reader\reader_addnew.jsp">
							<font color="#003300" size="2">添加读者</font></a></td>
                          </tr>
                          <tr valign=bottom>
                            <td height=28 width="27">　</td>
                            <td height=28 >
							<a href="reader\reader_listreader.jsp">
							<font size="2" color="#003300">维护读者</font></a></td>
                          </tr>
                          <tr valign=bottom>
                            <td height=28 width="27">　</td>
                            <td height=28 >
							<a href="reader\reader_queryreader.jsp">
							<font color="#003300" size="2">查询读者</font></a></td>
                          </tr>
                          <tr valign=bottom>
                            <td height=28 width="27">　</td>
                            <td height=28 >
							<a href="reader\reader_type.jsp">
							<font color="#003300" size="2">读者类别</font></a></td>
                          </tr>
                          <tr valign=bottom>
                            <td height=28 width="27">　</td>
                            <td height=28 >
							<a href="reader\reader_stat.jsp">
							<font color="#003300" size="2">读者统计</font></a></td>
                          </tr>
                          </tbody>
                        </table>
                      </td>
                          <td width=127>
                            <table width="80%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="40">
							<p align="center"><font face="华文楷体" color="#003300">
							<span style="vertical-align: middle"><br>借阅管理</span></font></td>
                          </tr>
                        </table>
                        <table cellspacing=0 cellpadding=0 width=121
                  background=images\M3.gif border=0  >
                          <tbody>
                          <tr valign=bottom>
                                  <td width=27 height=28>　</td>
                                  <td width=94 height=28 >
									<font color="#003300" size="2"><a href="borrow/borrow_login.jsp">借书管理</a></font></td>
                          </tr>
                          <tr valign=bottom>
                                  <td height=28 width="27">　</td>
                                  <td width="94" height=28  >
									<font color="#003300" size="2"><a href="borrow/return_login.jsp">还书管理</a></font></td>
                          </tr>
        
                          <tr valign=bottom>
                                  <td height=28 width="27">　</td>
                                  <td width="94" height=28  >
									<font color="#003300" size="2"><a href="borrow/preconcert_browse.jsp">预约确认</a></font></td>
                          </tr>
 <tr valign=bottom>
                                  <td height=28 width="27">　</td>
                                  <td width="94" height=28  >
									<font color="#003300" size="2"><a href="borrow/send_email.jsp">邮件催还</a></font></td>
                          </tr>
                           <tr valign=bottom>
                                  <td height=28 width="27">　</td>
                                  <td width="94" height=28  >
									<font color="#003300" size="2"><a href="borrow/borrow_stat.jsp">出借统计</a></font></td>
                          </tr>
                          </tbody>
                        </table>
                          </td>
                      <td width=127>
                        <table width="80%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="40">
							<p align="center"><font face="华文楷体" color="#003300">
							<span style="vertical-align: middle"><br>系统管理</span></font></td>
                          </tr>
                        </table>
                        <table cellspacing=0 cellpadding=0 width=121
                  background=images\M4.gif border=0 id="table1"  >
                          <tbody>
                          <tr valign=bottom>
                                  <td width=27 height=28>　</td>
                                  <td width=94 height=28 >
									<font size="2" color="#003300"><a href=admin/rule_management.jsp>规则管理</a></font></td>
                          </tr>
                          <tr valign=bottom>
                                  <td height=29 width="27">　</td>
                                  <td width="94" height=29  >
									<font size="2" color="#003300"><a href=admin/user_management.jsp>账户管理</a></font></td>
                          </tr>
        
                          </tbody>
                        </table>
                          <p>　</td>
                   
                   
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </TD>
  </TR>
  <TR>
    <TD align="center" width="584" height="2"></TD>
  </TR>
  </TBODY>
</TABLE>
<table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td  height="24" width="20">
      <div align="center"></div>
    </td>
    <td  height="24">
      <div align="center" class="style1">图书馆电话：84835091&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail：<a href="mailto:library@neusoft.edu.cn" class="style1">library@neusoft.edu.cn</a></div>
    </td>
    <td  height="24" width="20">　</td>
  </tr>
</table>
</BODY></HTML>
