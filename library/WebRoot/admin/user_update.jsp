<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'user_update.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">

//��֤���ķǿպ���
function check()
{
	var name = document.f1.username.value;
    var ps = document.f1.password.value;
    var ps2 = document.f1.password2.value;
	if(name==""){
		alert("�û�������Ϊ��");
		document.f1.username.focus();
		return false;
	}
	
	if(ps==""){
		alert("���벻��Ϊ��");
		document.f1.password.focus();
		return false;
	}
	if(ps!=ps2)
	{
	alert("�����������벻һ��");
		document.f1.password2.focus();
		return false;
	}
	
   
	return true;
}
</script>
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><br></td>

</tr>
<tr><td><a href=../main.jsp>����������ҳ</a>&nbsp;&nbsp;<a href="javascript:history.go(-1)">��������</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>�޸��û���Ϣ</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
   
request.setCharacterEncoding("gb2312");
 
String userid=request.getParameter("userid").trim();

String sql="select * from admin  where id = '"+userid+"'";
dbCon.getConnection();
////System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String name=rs.getString("username");
String ps=rs.getString("password");

%>
<form  name="f1" action="user_updateuser.jsp" method=post onsubmit="return check()">
<table>
<tr><td>�û���ţ�</td><td><input type=text readonly=readonly name=userid value="<%=userid %>" readonly=readonly></td></tr>
<tr><td> �û���:</td><td><input type=text name="username" value="<%=name%>" readonly=readonly/>
</td>
</tr>
<tr>
<td>����:</td>
<td><input type="password" name="password" value="<%=ps%>">
</td></tr>
<tr>
<td>ȷ������:</td>
<td><input type="password" name="password2" value="<%=ps%>">
</td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="�޸�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="ȡ��" name="cancel" onclick="javascript:history.go(-1)"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
