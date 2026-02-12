package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDAO {

    public static void saveOrder(Order order) {
        String query = "INSERT INTO orders (shipping_FullName, shipping_address, shipping_city, shipping_state,shipping_zip,shipping_country, payment_method, payment_amount) " +
                "VALUES (?,?,?,?,?,?,?,?)";

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1,order.getShipping_fullName());
            statement.setString(2,order.getShipping_address());
            statement.setString(3, order.getShipping_city());
            statement.setString(4, order.getShipping_state());
            statement.setString(5,order.getShipping_zip());
            statement.setString(6, order.getShipping_country());
            statement.setString(7, order.getPayment_method());
            statement.setFloat(8, order.getPayment_amount());

            statement.executeUpdate();

        } catch(SQLException exception) {
            throw new RuntimeException(exception);
        }
    }

}
