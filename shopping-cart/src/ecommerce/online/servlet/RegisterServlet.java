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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");

            User user = new User();
            user.setName(name);
            user.setPassword(password);
            user.setEmail(email);

            UserDao userDao = new UserDao(DbCon.getConnection());
            boolean status = userDao.registerUser(user);

            if (status) {
                out.println("<h3 style='color:green; text-align:center'>Registration Successful</h3>");
                request.getRequestDispatcher("login.jsp").include(request, response);
            } else {
                out.println("<h3 style='color:red; text-align:center'>Registration Failed</h3>");
                request.getRequestDispatcher("register.jsp").include(request, response);
            }
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
