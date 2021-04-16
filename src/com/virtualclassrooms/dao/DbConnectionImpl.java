package com.virtualclassrooms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionImpl {
	final String dbUrl="jdbc:mysql://localhost:3306/virtualclassrooms";
	final String dbUser="root";
	final String dbPass="Nikhil@79";
	public Connection getConnection() throws SQLException {
		Connection con=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
			System.out.println("Connected to Database");
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Driver not found");
			e.printStackTrace();
		}
		return con;
	}
}
