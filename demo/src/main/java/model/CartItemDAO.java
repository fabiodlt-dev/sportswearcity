package model;
import model.CartItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class CartItemDAO {

    public static void addCartItem(CartItem cartItem) {
        String query = "INSERT INTO cartItem (cartId,itemId, amount) VALUES (?,?,?)";

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, cartItem.getCartId());
            statement.setInt(2, cartItem.getItemId());
            statement.setInt(3, cartItem.getAmount());
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void removeCartItem(CartItem cartItem) {
        String query = "DELETE FROM cartItem WHERE cartId = ? AND itemId = ? AND amount = ?";

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, cartItem.getCartId());
            statement.setInt(2, cartItem.getItemId());
            statement.setInt(3, cartItem.getAmount());
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void updateCartItemAmount(CartItem cartItem) {
        String query = "UPDATE cartitem SET amount = ? WHERE cartId = ? and Itemid = ?";

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, cartItem.getAmount());
            statement.setInt(2, cartItem.getCartId());
            statement.setInt(3, cartItem.getItemId());
            statement.executeUpdate();

        } catch(SQLException e) {
            throw new RuntimeException();
        }

    }

}
