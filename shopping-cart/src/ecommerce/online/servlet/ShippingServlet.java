package ecommerce.online.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ecommerce.online.dao.ShippingDao;
import ecommerce.online.model.Shipping;

@WebServlet("/shipping")
public class ShippingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve shipping details from the request parameters
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String postalCode = request.getParameter("postalCode");

        // Create a Shipping object
        Shipping shipping = new Shipping(address, city, state, country, postalCode);

        // Add the shipping details to the database
        ShippingDao shippingDao = null;
		try {
			shippingDao = new ShippingDao();
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
			// Handle the error
			response.sendRedirect("error.jsp");
			return;
		}
        try {
            shippingDao.addShipping(shipping);
            // Redirect to the payment page
            response.sendRedirect("paymentPage.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the error
            response.sendRedirect("error.jsp");
        }
    }
}
