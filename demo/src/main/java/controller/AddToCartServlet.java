package controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddToCartServlet",value = "/add_to_cart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        //reading itemId and amount from request
        String idItem = request.getParameter("itemId");
        String amount = request.getParameter("amount");

        Item item = ItemDAO.getItem(Integer.parseInt(idItem));


        HttpSession session = request.getSession(false);


        if(session != null) {
            Cart cart = (Cart) session.getAttribute("cart");

            if(cart == null) {
                cart = new Cart();
                cart.setItems(new ArrayList<CartItem>());
                cart.setNumberofItems(cart.getItems().size());
                cart.setTotalPrice(0);
                session.setAttribute("cart",cart);
            }

                try {

                    int itemAmount = Integer.parseInt(amount);
                    int itemId = Integer.parseInt(idItem);
                    int itemAlreadyInCart = 0;

                    for(CartItem cartItem : cart.getItems()) {
                        if(cartItem.getItemId() == itemId)
                            itemAlreadyInCart += cartItem.getAmount();
                    }


                       if (itemAmount > 0 && item.getAmount() >= itemAmount && item.getAmount() >=  itemAmount +  itemAlreadyInCart) {

                               CartItem cartItem = null;

                               if((cartItem = getCartItem(cart, itemId)) != null) {
                                    cartItem.setAmount(cartItem.getAmount() + itemAmount);
                                   if ((LoggedCustomer) session.getAttribute("loggedCustomer") != null) {
                                       CartItemDAO.updateCartItemAmount(cartItem);
                                   }

                              }

                               else {
                                   cartItem = new CartItem();
                                   cartItem.setCartId(cart.getCartID());
                                   cartItem.setItemId(itemId);
                                   cartItem.setAmount(itemAmount);
                                   ArrayList<CartItem> cartItems = cart.getItems();
                                   cartItems.add(cartItem);
                                   cart.setItems(cartItems);
                                   cart.setNumberofItems(cart.getItems().size());
                                   cart.setTotalPrice(cart.getTotalPrice());

                                   if ((LoggedCustomer) session.getAttribute("loggedCustomer") != null) {
                                       CartItemDAO.addCartItem(cartItem);
                                       CartDAO.updateCart(cart);
                                   }

                               }


                           response.getWriter().write("{\"message\": \"Item added to Cart successfully\"}");

                       } else if(itemAmount + itemAlreadyInCart > item.getAmount()) {
                           response.getWriter().write("{\"message\": \"Oops! The amount you've requested exceeds our current stock.\\n Please modify your order and try again\"}");
                       }
                       else if(itemAmount <= 0) {
                           response.getWriter().write("{\"message\": \"Invalid quantity: Please enter a valid number for the quantity. \"}");
                       }
            }

                catch(NumberFormatException e) {
                    response.getWriter().write("{\"message\": \"Invalid quantity: Please enter a valid number for the quantity. \"}");
                }

        }
     }

    public CartItem getCartItem(Cart cart, int itemId) {
        for(CartItem cartItem : cart.getItems()) {
            if(cartItem.getItemId() == itemId)
                return cartItem;
        }
        return null;
    }

}