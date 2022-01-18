package com.connection;
import java.sql.*;
public class DbConnect {
   private static Connection conn;
   public static Connection getConn()
   {
	   try {
		   Class.forName("com.mysql.cj.jdbc.Driver");
		   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","Moinuddin@6204");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	   return conn;
   }
}
