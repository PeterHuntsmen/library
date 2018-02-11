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
      
    <title>My JSP 'borrow_book_borrow.jsp' starting page</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("gbk");
Integer bookid=Integer.valueOf(request.getParameter("bookid"));
Integer readerid=Integer.valueOf(request.getParameter("readerid"));

dbCon.getConnection();
Connection con=dbCon.getConn();
//判断该书是否在库
String sql1="select * from borrow where bookid="+bookid;
ResultSet rs1=dbCon.executeQuery(sql1);
rs1.next();
int y=rs1.getRow();
if(y>0)
{
//该书未还
out.print("<center>该书未还!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
else
{
//判断该读者还能借几本书
CallableStatement  a=con.prepareCall("{call p_can_borrow(?,?,?)}"); 
a.setInt(1,readerid);  
a.setInt(2, bookid);    
a.registerOutParameter(3, Types.INTEGER);//输出
a.execute();  
int  num=a.getInt(3); 

 if(num>0)
 {

 //计算到期日期

// 调用有一个in参数的函数; the function returns a VARCHAR
CallableStatement cs = con.prepareCall("{? = call f_date_is_due(?,?)}");
cs.registerOutParameter(1, Types.VARCHAR);

cs.setInt(2, readerid);
cs.setInt(3, bookid);

cs.execute();
String due = cs.getString(1);

String sql="insert into borrow(readerid,bookid,borrowdate,due) values("+
readerid+","+bookid+",sysdate,to_date('"+due+"','yyyy-mm-dd'))";
////System.out.println(sql);

dbCon.executeUpdate(sql);

out.print("<center>出借成功!<a href=javascript:history.go(-1)>继续借书</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
 else 
{
//该书不能出借
out.print("<center>出借限额已满或读者无权限!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");

}
}
%>
  </body>
</html>
