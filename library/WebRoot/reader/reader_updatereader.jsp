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
<td><br></td>

</tr>
<tr><td><a href=main.jsp>〈〈返回首页</a>&nbsp;&nbsp;<a href="javascript:history.go(-1)">〈〈后退</a></td>
</tr>
<tr>
<td>
<p align="center"><font color="#000080" face="楷体_GB2312" size="4"><b>修改读者信息</b></font><font color="#000080" face="楷体_GB2312" size="5">
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
<tr><td>读者编号：</td><td><input type=text readonly=readonly name=readerid value="<%=readerid %>"></td></tr>
<tr><td> 读者姓名:</td><td><input type=text name="name" value="<%=name%>"/>
</td>
</tr>
<tr>
<td>电话:</td>
<td><input type="text" name="telephone" value="<%=telephone%>">
</td></tr>
<tr>
<td>邮箱：</td><td><input type=text name="email" value="<%=email %>"/></td></tr>
<tr>
<td>所在院系：</td><td><input type=text name="dept" value="<%=dept%>"></td></tr>

<tr><td>读者分类：</td><td><select name="readertype">
 <option>--请选择--</option>
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
 <tr><td>读者权限：</td><td><select name="right">

 <option value=0  <%if (right==0){%>selected=selected <%} %>>开通</option>
 <option value=1 <%if (right==1){%>selected=selected <%} %> >关闭</option>

  </select>
</td></tr>
<tr><td>备注：</td><td><textarea name="demo" maxLen="800" cols=51 rows=5><%=demo %></textarea></td></tr>
<tr><td colspan=2>
	<p align="center"><input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="取消" name="cancel" onclick="javascript:history.go(-1)"></td></tr></table>
</form>
</td></tr>
</table>
</body>
</html>
