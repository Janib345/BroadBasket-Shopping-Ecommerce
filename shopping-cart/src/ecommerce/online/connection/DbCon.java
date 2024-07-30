package ecommerce.online.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbCon {

	private static Connection connection = null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(connection==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_shopping","root","janib123a");
			
				
			 System.out.println("connected");
		}
		return connection;
	}

	public static void close(ResultSet resultSet, PreparedStatement statement, Connection connection2) {
		// TODO Auto-generated method stub
		
	}

	public static void close1(ResultSet resultSet, PreparedStatement statement, Connection connection2) {
		// TODO Auto-generated method stub
		
	}
}
