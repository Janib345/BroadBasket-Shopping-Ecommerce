package ecommerce.online.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ecommerce.online.connection.DbCon;
import ecommerce.online.model.Shipping;

public class ShippingDao {
    private Connection connection;

    public ShippingDao() throws ClassNotFoundException, SQLException {
        connection = DbCon.getConnection();
    }

    public int addShipping(Shipping shipping) throws SQLException {
        String query = "INSERT INTO shipping (address, city, state, country, postal_code) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, shipping.getAddress());
            preparedStatement.setString(2, shipping.getCity());
            preparedStatement.setString(3, shipping.getState());
            preparedStatement.setString(4, shipping.getCountry());
            preparedStatement.setString(5, shipping.getPostalCode());
            preparedStatement.executeUpdate();

            // Retrieve the generated orderId
            try (ResultSet resultSet = preparedStatement.getGeneratedKeys()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        }
        return -1; // Return -1 if orderId retrieval fails
    }
}
