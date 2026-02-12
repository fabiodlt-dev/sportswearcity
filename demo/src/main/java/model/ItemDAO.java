package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.sql.DataSource;

public class ItemDAO {

    public static Item getItem(int itemId) {
        String query = "SELECT * FROM item  WHERE itemID = ?";
        Item item = new Item();
        try (Connection conn = ConPool.getConnection()) {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, itemId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    item.setItemID(resultSet.getInt("itemID"));
                    item.setAmount(resultSet.getInt("amount"));
                    item.setSize(resultSet.getString("size"));
                    item.setPrice(resultSet.getFloat("price"));
                    item.setImageURL(resultSet.getString("imageURL"));
                    item.setItemDescription(resultSet.getString("itemDescription"));
                    item.setBrand(resultSet.getString("brand"));
                    item.setCategory(resultSet.getString("category"));
                    item.setTeam(resultSet.getString("team"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return item;
    }

    public static Item[] getItems(String category, String brand, String teams, String sortingOrder, String initialPrice, String endingPrice) {
        ArrayList<Item> items = new ArrayList<>();
        String query = "";
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = null;
            query = "SELECT * FROM item WHERE category = ? AND brand = ? ";

            if(teams == null && initialPrice == null && endingPrice == null) {
                 statement = con.prepareStatement(query);
                 statement.setString(1,category);
                 statement.setString(2,brand);
             }

            else {
                query += "AND team IN (?,?,?,?,?) AND (price >= ? AND price <= ?) ";

                if(sortingOrder != null && sortingOrder.equals("asc")) {
                    query += "ORDER BY price ASC";
                }

                else if(sortingOrder != null && sortingOrder.equals("desc")) {
                    query += "ORDER BY price DESC";
                }
                statement = con.prepareStatement(query);
                statement.setString(1,category);
                statement.setString(2,brand);
                statement.setString(3,teams.substring(0,3));
                statement.setString(4,teams.substring(4,7));
                statement.setString(5,teams.substring(8,11));
                statement.setString(6,teams.substring(12,15));
                statement.setString(7,teams.substring(16,19));

                if(initialPrice.isEmpty()) {
                    statement.setFloat(8,0);
                }
                else {
                    statement.setFloat(8,Float.parseFloat(initialPrice));;
                }

                if(endingPrice.isEmpty()) {
                    statement.setFloat(9,9999);
                }

                else {
                    statement.setFloat(9,Float.parseFloat(endingPrice));
                }
            }

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setItemID(resultSet.getInt("itemID"));
                item.setAmount(resultSet.getInt("amount"));
                item.setSize(resultSet.getString("size"));
                item.setPrice(resultSet.getFloat("price"));
                item.setImageURL(resultSet.getString("imageURL"));
                item.setItemDescription(resultSet.getString("itemDescription"));
                item.setBrand(resultSet.getString("brand"));
                item.setCategory(resultSet.getString("category"));
                item.setTeam(resultSet.getString("team"));
                // Add the item to the list
                items.add(item);
            }

        } catch (SQLException e) {
            throw new RuntimeException();
        }

        return items.toArray(new Item[0]);
    }

    public static void updateItemAmount(Item item, int amount) {
        String query = "UPDATE item SET amount = ? WHERE itemID = ?";
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,item.getAmount() - amount);
            statement.setInt(2,item.getItemID());
            statement.executeUpdate();

        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }


}