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

//验证表单的非空函数
function check()
{
	var name = document.f1.name.value;

	if(name==""){
		alert("姓名不能为空");
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
		alert("请选择读者分类");
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
<tr><td><a href=..\main.jsp>〈〈返回首页</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>添加读者</b></font><font color="#000080" face="楷体_GB2312" size="5">
</font>
</td></tr>
<tr>
<td>
<form  name="f1" action="reader_add.jsp" method=post onsubmit="return check()">
<table>
<tr><td> 读者姓名:</td><td><input type=text name="name"><font color="#FF0000">*</font></td>
</tr>
<tr>
<td>联系电话:</td><td><input type=text name="telephone"></td></tr>
<tr>
<td>邮箱：</td><td><input type=text name="email"></td></tr>
<tr>
<td>所属院系：</td><td><input type=text name="dept"></td></tr>


<tr><td>权限：</td><td><select name="right">
 

   <option value=0>开通</option>
   <option value=1>关闭</option>
   
  </select></td></tr>
 <tr><td>读者分类：</td><td><select name="readertype">
  <option>--请选择--</option> 

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
<tr><td>备注：</td><td><textarea name="demo" maxLen="800" cols=51 rows=5></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="清空" name="reset"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
