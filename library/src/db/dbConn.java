package db;
import java.sql.*;
public class dbConn
{
  
   Connection conn=null;
   Statement stmt=null;
   ResultSet rs=null;
   public Connection getConn()
   {return conn;}
   public dbConn(){}
   public  void getConnection()
	{
	  try{ 
		   Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		   String url="jdbc:oracle:thin:@localhost:1521:orcl";
		   String user="scott";
		   String password="tiger";
		   conn=DriverManager.getConnection(url, user, password);
	       	  
	 
	     }catch(Exception e)
		   {
	         e.printStackTrace();
		    }
    }

public  ResultSet executeQuery(String sql)throws SQLException
 {
       try{
  		stmt=conn.createStatement();
        rs= stmt.executeQuery(sql);
		  }
		  catch(SQLException e)
	      {
		   e.printStackTrace();
		  }
		return rs;
 }
   
public void executeUpdate(String sql)
 {
       try{
  	      stmt=conn.createStatement();

           stmt.executeUpdate(sql);
		  }
		  catch(SQLException e)
	      {
		   e.printStackTrace();
		  }
		
 }  
public void close()
		{      try{
	                  rs.close();
                      stmt.close();
                      conn.close();
	              }
                   catch(Exception e)
		            {
	                    e.printStackTrace();
	                 }
		} 
}

