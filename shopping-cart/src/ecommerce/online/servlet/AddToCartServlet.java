package ecommerce.online.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecommerce.online.model.Cart;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out=response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			
			
			HttpSession session = request.getSession();
			
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list==null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
	}
			else {
//				out.println("Session added");
				cartList = cart_list;
				boolean exist = false;
				
				
			for(Cart c:cartList) {
				if(c.getId()==id) {
					exist = true;
					response.sendRedirect("dif.jsp");
				}
			}
			
			if(!exist) {
				cartList.add(cm);
				response.sendRedirect("index.jsp");
//				out.println("product added");
			}
		}
		
//			for(Cart c:cart_list) {
//				c
////				out.println(c.getId());
//			}
	
	}
	}
}


