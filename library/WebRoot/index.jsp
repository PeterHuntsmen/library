<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>

</body>
</html>
<%
request.setCharacterEncoding("gb2312");
String name=request.getParameter("username");
String pass=request.getParameter("password");

String sql="select * from admin";
dbCon.getConnection();

ResultSet rs=dbCon.executeQuery(sql);

while(rs.next())
{
////System.out.println(rs.getString("username"));
if(name.equals(rs.getString("username")))
{
if(pass.equals(rs.getString("password")))
{

response.sendRedirect("main.jsp");

}
}

}
out.print("<center>你的用户名或密码不正确!<a href=index.htm>返回首页</a></center>");
%>
