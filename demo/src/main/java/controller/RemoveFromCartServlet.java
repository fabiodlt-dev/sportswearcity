package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RemoveFromCartServlet",value = "/remove_from_cart")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String itemId = request.getParameter("itemId");
        int idItem = Integer.parseInt(itemId);

        HttpSession session = request.getSession(false);

        if(session != null) {

            Cart cart = (Cart)session.getAttribute("cart");
            ArrayList<CartItem> cartItems = cart.getItems();
            CartItem item = null;
            for(int i = 0; i < cartItems.size(); i++) {

                if(cartItems.get(i).getItemId() == idItem) {
                     item = cartItems.remove(i);
                }

            }

            cart.setItems(cartItems);

            if ((LoggedCustomer) session.getAttribute("loggedCustomer") != null) {
                CartDAO.updateCart(cart);
                CartItemDAO.removeCartItem(item);
            }

            response.getWriter().write("null");

        }

    }
}
