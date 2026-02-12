package model;

import java.util.ArrayList;

public class Cart {
    private int cartID;
    private int customerID;

    private ArrayList<CartItem> items;
    private int numberofItems;

    private float totalPrice;

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }


    public ArrayList<CartItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<CartItem> items) {
        this.items = items;
    }

    public int getNumberofItems() {
        return items.size();
    }

    public void setNumberofItems(int numberofItems) {
        this.numberofItems = numberofItems;
    }

    public float getTotalPrice() {
        float totalPrice = 0.0f;
        for(CartItem cartItem : getItems()) {
            totalPrice += ItemDAO.getItem(cartItem.getItemId()).getPrice() * cartItem.getAmount();
        }

        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
}
