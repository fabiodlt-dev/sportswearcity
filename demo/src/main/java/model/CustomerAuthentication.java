package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerAuthentication {
    public static boolean authenticate(LoggedCustomer loggedCustomer) {
        String query = "SELECT * FROM registeredcustomer WHERE emailaddress = ? AND password = ?";

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, loggedCustomer.getEmailAddress());
            statement.setString(2, loggedCustomer.getPassword());

            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()) {  // Returns true if a match is found
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                loggedCustomer.setFirstName(firstName);
                loggedCustomer.setLastName(lastName);
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }



}
