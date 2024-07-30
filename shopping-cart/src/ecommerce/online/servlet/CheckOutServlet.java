package ecommerce.online.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.online.connection.DbCon;
import ecommerce.online.dao.OrderDao;
import ecommerce.online.model.Cart;
import ecommerce.online.model.Order;
import ecommerce.online.model.User;

@WebServlet("/check-out")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            LocalDate date = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = date.format(formatter);

            // Retrieve all cart Products
            ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            // User authentication
            User auth = (User) request.getSession().getAttribute("auth");

            if (cartList != null && auth != null) {
                OrderDao orderDao = new OrderDao(DbCon.getConnection());

                for (Cart cart : cartList) {
                    Order order = new Order();
                    order.setUserId(auth.getUserId());
                    order.setProductId(cart.getProductId());
                    order.setQuantity(cart.getQuantity());
                    order.setDate(formattedDate);
                    order.setOrderStatus("Pending");
                    order.setShippingMethod(request.getParameter("shippingMethod")); // Assuming shipping method is passed as a parameter
                    order.setTotalPrice(Double.parseDouble(request.getParameter("totalPrice"))); // Assuming total price is passed as a parameter

                    int orderId = orderDao.insertOrder(order);
                    if (orderId == -1) {
                        request.setAttribute("errorMessage", "Failed to place the order");
                        request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
                        return;
                    }
                }

                cartList.clear();
                response.sendRedirect("order.jsp");

            } else if (auth == null) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("order.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
