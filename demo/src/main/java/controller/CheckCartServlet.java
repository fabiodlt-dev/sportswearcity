package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

import java.io.IOException;

@WebServlet(name = "CheckCartServlet", value="/check_cart")
public class CheckCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {         // reading parameters from request
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession ssn = request.getSession(false);

        if (ssn != null) {
            Cart cart = (Cart) ssn.getAttribute("cart");
            if (cart == null || cart.getNumberofItems() == 0) {
                response.getWriter().write("{\"message\": \"Your cart is currently empty. Please add items to proceed.\"}");
            }
            else {
                response.getWriter().write("{\"message\": \" \"}");

            }
        }
    }
    }
