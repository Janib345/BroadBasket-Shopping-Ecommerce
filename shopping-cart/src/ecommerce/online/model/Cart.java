package ecommerce.online.model;

import java.util.List;

public class Cart  extends Product{
	
	private int quantity;
	private List<Product> products;
	
	
	
public Cart() {
	
}



public int getQuantity() {
	return quantity;
}



public void setQuantity(int quantity) {
	this.quantity = quantity;
}



public List<Product> getProducts() {
	return products;
}



public void setProducts(List<Product> products) {
	this.products = products;
}



}
