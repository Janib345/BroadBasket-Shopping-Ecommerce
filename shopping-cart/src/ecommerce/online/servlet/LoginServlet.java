package ecommerce.online.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.online.connection.DbCon;
import ecommerce.online.dao.UserDao;
import ecommerce.online.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			
			
				try {
					UserDao udao = new UserDao(DbCon.getConnection());
					User user = udao.userLogin(email, password);
					
					if(user!=null) {
						response.sendRedirect("index.jsp");
						request.getSession().setAttribute("auth",user);
					}
					else {
						response.sendRedirect("login.jsp");
						out.print("<span style='color: red; font-size: 14px;'>Incorrect password or email.</span>");
					}
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
				}
			out.print(email+password);

			
		
		}
	}

}
