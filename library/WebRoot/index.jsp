<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbCon" scope="page" class="db.dbConn"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
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
out.print("<center>����û��������벻��ȷ!<a href=index.htm>������ҳ</a></center>");
%>
