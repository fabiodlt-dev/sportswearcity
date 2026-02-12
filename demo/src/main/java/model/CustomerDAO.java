package model;
import jdk.jfr.Registered;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {
    public void createAccount(RegisteredCustomer customer) {
        String insertCustomerSQL = "INSERT INTO customer (customerType) VALUES (?)";
        String insertRegisteredCustomerSQL = "INSERT INTO registeredcustomer (customerID, firstName, lastName, dateOfBirth, emailAddress, emailAddressConfirmation, password, passwordConfirmation,phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?,?, ?)";

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement psCustomer = con.prepareStatement(insertCustomerSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            PreparedStatement psRegisteredCustomer = con.prepareStatement(insertRegisteredCustomerSQL);

            // Inserimento nella tabella Customer
            psCustomer.setString(1, "RegisteredCustomer");
            psCustomer.executeUpdate();
            try (ResultSet rs = psCustomer.getGeneratedKeys()) {
                if (rs.next()) {
                    int customerID = rs.getInt(1);
                    customer.setCustomerID(customerID);
                    psRegisteredCustomer.setInt(1, customerID);
                    psRegisteredCustomer.setString(2, customer.getFirstName());
                    psRegisteredCustomer.setString(3, customer.getLastName());
                    psRegisteredCustomer.setString(4, customer.getDateOfBirth());
                    psRegisteredCustomer.setString(5, customer.getEmailAddress());
                    psRegisteredCustomer.setString(6, customer.getConfirmationEmailAddress());
                    psRegisteredCustomer.setString(7, customer.getPassword());
                    psRegisteredCustomer.setString(8, customer.getConfirmationPassword());
                    psRegisteredCustomer.setString(9, customer.getPhoneNumber());
                    psRegisteredCustomer.executeUpdate();

                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static int retrieveCustomerID(String emailAddress) {
        String query = "SELECT CustomerID FROM RegisteredCustomer WHERE emailAddress = ?";
        int customerID = 0;
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, emailAddress);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    customerID = resultSet.getInt("customerID");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return customerID;
    }

    public static RegisteredCustomer getCustomerInformation(String emailAddress) {
        String query = "SELECT * FROM RegisteredCustomer WHERE emailAddress = ?";
        RegisteredCustomer registeredCustomer = new RegisteredCustomer();
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, emailAddress);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if(resultSet.next()) {
                    registeredCustomer.setFirstName(resultSet.getString("firstName"));
                    registeredCustomer.setLastName(resultSet.getString("lastName"));
                    registeredCustomer.setEmailAddress(resultSet.getString("emailAddress"));
                    registeredCustomer.setDateOfBirth(resultSet.getString("dateofBirth"));
                    registeredCustomer.setPhoneNumber(resultSet.getString("phoneNumber"));
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return registeredCustomer;
    }
}
