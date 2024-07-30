// SearchProductServlet.java

package ecommerce.online.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.online.connection.DbCon;
import ecommerce.online.dao.ProductDao;
import ecommerce.online.model.Product;

@WebServlet("/search-products")
public class SearchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String query = request.getParameter("query");
        
        if (query != null && !query.isEmpty()) {
            try {
                ProductDao productDao = new ProductDao(DbCon.getConnection());
                List<Product> products = productDao.searchProducts(query);

                request.setAttribute("products", products);
                request.getRequestDispatcher("search.jsp").forward(request, response);
            } catch (Exception e) {
            	e.printStackTrace();
                request.setAttribute("errorMessage", "Error occurred while searching: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
