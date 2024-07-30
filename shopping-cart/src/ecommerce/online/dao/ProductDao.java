package ecommerce.online.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import ecommerce.online.model.*;


public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public ProductDao(Connection con) {
		super();
		this.con = con;
	}

	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
				try {
					query = "select * from products";
					pst = this.con.prepareStatement(query);
					rs=pst.executeQuery();
					
					while(rs.next()) {
						Product row = new Product();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price"));
						row.setImage(rs.getString("image"));
						
						products.add(row);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return products;
		
	}
	
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		try {
			
		
		if(cartList.size()>0) {
			for(Cart items:cartList) {
				query="select * from products where id=?";
				pst =this.con.prepareStatement(query);
				pst.setInt(1,items.getId());
				rs = pst.executeQuery();
				
				while(rs.next()) {
					Cart row = new Cart();
					row.setId(rs.getInt("id"));
					row.setName(rs.getString("name"));
					row.setCategory(rs.getString("category"));
					row.setPrice(rs.getDouble("price")*items.getQuantity());
					row.setQuantity(items.getQuantity());
					products.add(row);
					  
				}
			}
			
		}
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		finally {
	        // Close ResultSet, PreparedStatement, etc.
	        // Add necessary cleanup code here
	    }
		return products;
		
	}
	public Product getSingleProduct(int id) {
		Product row = null;
		try {
			query = "select * from products where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return row;
	}
	
	public double getTotalPrice(ArrayList<Cart> cartList) {
		double sum=0;
		
		try {
			if(cartList.size()>0) {
				for(Cart items:cartList) {
					query="select price from products where id=?";
					pst =this.con.prepareStatement(query);
					pst.setInt(1,items.getId());
					rs = pst.executeQuery(); 
					
					while(rs.next()) {
						sum+=rs.getDouble("price")*items.getQuantity();
						  
					}
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
	
	// ProductDao.java

	public List<Product> searchProducts(String query) {
        List<Product> products = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM products WHERE name LIKE ? OR category LIKE ?";
            
            try (PreparedStatement pst = this.con.prepareStatement(sql)) {
                pst.setString(1, "%" + query + "%");
                pst.setString(2, "%" + query + "%");
                
                try (ResultSet rs = pst.executeQuery()) {
                    while(rs.next()) {
                        Product product = new Product();
                        product.setId(rs.getInt("id"));
                        product.setName(rs.getString("name"));
                        product.setCategory(rs.getString("category"));
                        product.setPrice(rs.getDouble("price"));
                        product.setImage(rs.getString("image"));
                        
                        products.add(product);
                    }
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return products;
    }
	

		

		    // Fetch products based on search criteria
	public List<Product> getProductsByCategory(String category) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products WHERE category = ?";
        
        try (PreparedStatement preparedStatement = this.con.prepareStatement(query)) {
            preparedStatement.setString(1, category);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                Product product = new Product();
                    
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                products.add(product);
            }
        }
        
        return products;
    }

    public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN ? AND ?";
        
        try (PreparedStatement preparedStatement = this.con.prepareStatement(query)) {
            preparedStatement.setDouble(1, minPrice);
            preparedStatement.setDouble(2, maxPrice);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                Product product = new Product();
                		product.setId(rs.getInt("id"));
                        product.setName(rs.getString("name"));
                        product.setCategory(rs.getString("category"));
                        product.setPrice(rs.getDouble("price"));
                
                products.add(product);
            }
        }
        
        return products;
    }
    public Product getProductById(int productId) throws SQLException {
        Product product = null;
        String sql = "SELECT * FROM products WHERE id = ?";
        
        try (PreparedStatement preparedStatement = this.con.prepareStatement(sql)) {
            preparedStatement.setInt(1, productId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setCategory(resultSet.getString("category"));
                    // Set other product attributes as needed
                }
            }
        }
        return product;
    }
}


		    
		

	
	

	

