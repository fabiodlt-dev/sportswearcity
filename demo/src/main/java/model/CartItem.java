package model;

import java.util.Objects;

public class CartItem {
  private int cartId;
  private int itemId;
  private int amount;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }


    public boolean equals(CartItem cartItem) {
        if (this == cartItem) return true;
        if (cartItem == null || getClass() != cartItem.getClass()) return false;
        return cartId == cartItem.cartId && itemId == cartItem.itemId && amount == cartItem.amount;
    }


}