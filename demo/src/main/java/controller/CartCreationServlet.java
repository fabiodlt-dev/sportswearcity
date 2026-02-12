package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CartServlet",value = "/cart_servlet")
public class CartCreationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        for(Cookie c : cookies) {
            if(c.getName().equals("isRegistered"))
                cookie = c;
        }

        if(cookie != null) {
            String csId = request.getParameter("customerID");
            int customerId = Integer.parseInt(csId);

            //CartBean bean instatiation to be given to createCart method as input

            HttpSession session = request.getSession(false);

            if(session != null) {
                Cart cart = (Cart)session.getAttribute("cart");


                if(cart == null) {
                    cart = new Cart();
                    cart.setItems(new ArrayList<CartItem>());
                    cart.setNumberofItems(cart.getItems().size());
                    cart.setTotalPrice(0);

                }

                CartDAO.createCart(cart,customerId);
                cart.setCartID(CartDAO.loadCart(customerId).getCartID());
                session.setAttribute("cart",cart);


               for(CartItem cartItem : cart.getItems()) {
                    cartItem.setCartId(cart.getCartID());
                    CartItemDAO.addCartItem(cartItem);
              }





            }

            cookie.setMaxAge(0);
            response.addCookie(cookie);
            response.sendRedirect("index.jsp");
    }

    else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }

}