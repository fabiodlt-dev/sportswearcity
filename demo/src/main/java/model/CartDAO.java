package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAO {
    public static void createCart(Cart cart, int customerID) {
        String query = "INSERT INTO Cart (customerID, numberOfItems, totalPrice) VALUES (?, ?, ?)";

        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement psCart = conn.prepareStatement(query);

            // Inserimento nella tabella Cart
            psCart.setInt(1, customerID);
            psCart.setInt(2, cart.getNumberofItems());
            psCart.setDouble(3, cart.getTotalPrice());
            psCart.executeUpdate();

        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        }
    }


    public static Cart loadCart(int customerID) {
        String query = "SELECT * FROM cart WHERE customerID = ?";
        Cart cart = new Cart();
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, customerID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if(resultSet.next()) {
                    cart.setCartID(resultSet.getInt("cartID"));
                    cart.setCustomerID(resultSet.getInt("customerID"));
                    cart.setNumberofItems(resultSet.getInt("numberOfItems"));
                    cart.setItems(loadCartItems(resultSet.getInt("cartID")));
                    cart.setTotalPrice(resultSet.getFloat("totalPrice"));
                }
            }
            catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        catch(SQLException e) {
            throw new RuntimeException(e);
        }
            return cart;
    }


    public static ArrayList<CartItem> loadCartItems(int cartId) {
        ArrayList <CartItem> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cartitem WHERE cartId = ?";
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, cartId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                CartItem cartItem = new CartItem();
                cartItem.setCartId(resultSet.getInt("cartId"));
                cartItem.setItemId(resultSet.getInt("itemId"));
                cartItem.setAmount(resultSet.getInt("amount"));
                cartItems.add(cartItem);
            }

        } catch (SQLException e) {
            throw new RuntimeException();
        }

            return cartItems;
    }


    public static void updateCart(Cart cart) {
        String query = "UPDATE cart SET numberOfItems = ?,totalPrice = ? WHERE cartID = ?";
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,cart.getNumberofItems());
            statement.setFloat(2,cart.getTotalPrice());
            statement.setInt(3,cart.getCartID());
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
