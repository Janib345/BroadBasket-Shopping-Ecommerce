package ecommerce.online.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.online.connection.DbCon;
import ecommerce.online.dao.ProductDao;
import ecommerce.online.model.Product;


@WebServlet("/filterProducts")
public class FilterProductsServlet extends HttpServlet {
    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        try {
			productDao = new ProductDao(DbCon.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");
        double minPrice = Double.parseDouble(request.getParameter("minPrice"));
        double maxPrice = Double.parseDouble(request.getParameter("maxPrice"));

        List<Product> filteredProducts;

        if (!category.isEmpty()) {
            try {
                filteredProducts = productDao.getProductsByCategory(category);
            } catch (SQLException e) {
                throw new ServletException("Error fetching products by category", e);
            }
        } else {
            try {
                filteredProducts = productDao.getProductsByPriceRange(minPrice, maxPrice);
            } catch (SQLException e) {
                throw new ServletException("Error fetching products by price range", e);
            }
        }

        request.setAttribute("filteredProducts", filteredProducts);
        request.getRequestDispatcher("your-existing-jsp-page.jsp").forward(request, response);
    }
}


