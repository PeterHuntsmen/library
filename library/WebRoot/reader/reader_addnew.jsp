<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'book_addnew.jsp' starting page</title>
    	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">

//��֤���ķǿպ���
function check()
{
	var name = document.f1.name.value;

	if(name==""){
		alert("��������Ϊ��");
		document.f1.name.focus();
		return false;
	}
	
	
	var type = document.f1.readertype;
	var dg = true;
	for(var i=0;i<type.options.length;i++){
	if(type.options[i].value!="" && type.options[i].selected){
		dg = false;
	}
	}
	if(dg){
		alert("��ѡ����߷���");
		document.f1.readertype.focus();
		return false;
	}
	
   
	return true;
}
</script>
  </head>
  
  <body bgcolor="#FFFFFF" topmargin="15" leftmargin="15">
 
<table align=center width=748>
<tr>
<td><img border="0" src="..\images\title.JPG" width="738" height="124"></td>

</tr>
<tr><td><a href=..\main.jsp>����������ҳ</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>��Ӷ���</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="reader_add.jsp" method=post onsubmit="return check()">
<table>
<tr><td> ��������:</td><td><input type=text name="name"><font color="#FF0000">*</font></td>
</tr>
<tr>
<td>��ϵ�绰:</td><td><input type=text name="telephone"></td></tr>
<tr>
<td>���䣺</td><td><input type=text name="email"></td></tr>
<tr>
<td>����Ժϵ��</td><td><input type=text name="dept"></td></tr>


<tr><td>Ȩ�ޣ�</td><td><select name="right">
 

   <option value=0>��ͨ</option>
   <option value=1>�ر�</option>
   
  </select></td></tr>
 <tr><td>���߷��ࣺ</td><td><select name="readertype">
  <option>--��ѡ��--</option> 

 <%
  String sql="select * from reader_type";
  dbCon.getConnection();
  ResultSet rs=dbCon.executeQuery(sql);
  //System.out.println(sql);
  while(rs.next())
  {
   %>
   <option value=<%=rs.getInt(1) %>><%=rs.getString("typename") %></option>
   <%
  }
   %>
  </select><font color="#FF0000">*</font>
</td></tr>
<tr><td>��ע��</td><td><textarea name="demo" maxLen="800" cols=51 rows=5></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="���">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="���" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
