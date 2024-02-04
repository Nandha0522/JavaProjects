package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	protected Connection connection;
	public DBconnect()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","access");
		}
		catch(ClassNotFoundException | SQLException e)
		{
			System.err.println(e);
		}
	}
}











