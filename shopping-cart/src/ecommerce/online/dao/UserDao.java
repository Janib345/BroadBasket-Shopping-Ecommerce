package ecommerce.online.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ecommerce.online.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public UserDao(Connection con) {
	
		this.con = con;
	}
	
	
	public User userLogin(String email,String password) {
		User user = null;
		try {
			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1,email);
			pst.setString(2,password);
			rs=pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setName(rs.getString("email"));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
	
	public boolean registerUser(User user) {
		boolean status = false;
		
		try {
			String query = "INSERT INTO users (name, password, email) VALUES (?, ?, ?)";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getEmail());
			
			int rowsInserted = pst.executeUpdate();
			if (rowsInserted > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	
	
	
}
