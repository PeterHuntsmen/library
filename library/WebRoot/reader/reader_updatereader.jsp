<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reader_updatereader.jsp' starting page</title>
    	
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
<td><br></td>

</tr>
<tr><td><a href=main.jsp>����������ҳ</a>&nbsp;&nbsp;<a href="javascript:history.go(-1)">��������</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="����_GB2312" size="4"><b>�޸Ķ�����Ϣ</b></font><font color="#000080" face="����_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<%
   
request.setCharacterEncoding("gb2312");
 
String readerid=request.getParameter("readerid").trim();

String sql="select * from reader  where readerid = '"+readerid+"'";
dbCon.getConnection();
//System.out.println(sql);
ResultSet rs=dbCon.executeQuery(sql);
  
rs.next();

String name=rs.getString("name");
String telephone=rs.getString("telephone");
String email=rs.getString("email");
String dept=rs.getString("dept");
int readertype=rs.getInt("readertype");
String demo=rs.getString("demo");
int right=rs.getInt("right");

%>
<form  name="f1" action="reader\reader_update.jsp" method=post onsubmit="return check()">
<table>
<tr><td>���߱�ţ�</td><td><input type=text readonly=readonly name=readerid value="<%=readerid %>"></td></tr>
<tr><td> ��������:</td><td><input type=text name="name" value="<%=name%>"/>
</td>
</tr>
<tr>
<td>�绰:</td>
<td><input type="text" name="telephone" value="<%=telephone%>">
</td></tr>
<tr>
<td>���䣺</td><td><input type=text name="email" value="<%=email %>"/></td></tr>
<tr>
<td>����Ժϵ��</td><td><input type=text name="dept" value="<%=dept%>"></td></tr>

<tr><td>���߷��ࣺ</td><td><select name="readertype">
 <option>--��ѡ��--</option>
 <%
  String sql2="select * from reader_type";
  dbCon.getConnection();
  ResultSet rs2=dbCon.executeQuery(sql2);
  while(rs2.next())
  {
   %>
   <option value=<%=rs2.getInt(1) %><%if(rs2.getInt(1)==readertype) {%> selected="selected"<%} %>><%=rs2.getString("typename") %></option>
   <%
  }
   %>
  </select></td></tr>
 <tr><td>����Ȩ�ޣ�</td><td><select name="right">

 <option value=0  <%if (right==0){%>selected=selected <%} %>>��ͨ</option>
 <option value=1 <%if (right==1){%>selected=selected <%} %> >�ر�</option>

  </select>
</td></tr>
<tr><td>��ע��</td><td><textarea name="demo" maxLen="800" cols=51 rows=5><%=demo %></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="�޸�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="ȡ��" name="cancel" onclick="javascript:history.go(-1)"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
