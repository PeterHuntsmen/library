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
      
    <title>My JSP 'return_book_return.jsp' starting page</title>
    
	
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

String sql="delete from borrow where readerid="+readerid+" and bookid="+bookid;


//判断该书是否超期
CallableStatement  a=con.prepareCall("{call p_days_from_due(?,?,?)}"); 
a.setInt(1,readerid);  
a.setInt(2, bookid);    
a.registerOutParameter(3, Types.INTEGER);//输出
a.execute();  
int  num=a.getInt(3); 


 if(num>=0)
 {
 //还书未超期

dbCon.executeUpdate(sql);
out.print("<center>还书成功!<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");
}
 else 
{

//计算超期罚款金额
// 调用有一个OUT参数的存储过程; the procedure returns a NUMBER
CallableStatement cs = con.prepareCall("{ call p_timeover_money(?,?,?)}");
cs.setInt(1, readerid);
cs.setInt(2, bookid);
cs.registerOutParameter(3, Types.INTEGER);

cs.execute();
int m = cs.getInt(3);

dbCon.executeUpdate(sql);
out.print("<center>出借已超期!需缴纳罚款"+m+"元<a href=javascript:history.go(-1)>后退</a></center>");
out.print("<br><center><a href=..\\main.jsp>〈〈返回首页</a></center>");


}
%>
  </body>
</html>
