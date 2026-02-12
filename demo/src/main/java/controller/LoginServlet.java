package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import model.*;

import java.io.IOException;


@WebServlet(name = "LoginServlet",value = "/login_servlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {         // reading parameters from request
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String emailAddress = request.getParameter("emailAddressLogin");
        String password = request.getParameter("passwordLogin");

        // LoggedCustomer bean instatiation to be given to authenticate as input
        LoggedCustomer customer = new LoggedCustomer();

        if(isEmailAddressValid(emailAddress) && isPasswordVaild(password)) {
            customer.setEmailAddress(emailAddress);
            customer.setPassword(password);

        }

            if (CustomerAuthentication.authenticate(customer)) {

                HttpSession session = request.getSession(false);

                if (session != null) {
                    session.setAttribute("loggedCustomer",customer);
                    String sessionId = session.getId();
                    Cookie cookie = new Cookie("sessionId", sessionId);
                    cookie.setMaxAge(30 * 60);
                    response.addCookie(cookie);
                    Cart cart = CartDAO.loadCart(CustomerDAO.retrieveCustomerID(emailAddress));
                    session.setAttribute("cart",cart);
                }


                response.getWriter().write("{\"message\": \"Login successful\"}");

            }


        else {
                response.getWriter().write("{\"message\": \"Invalid username or password\"}");
        }


    }

    public boolean isEmailAddressValid(String emailAddress) {
        if(emailAddress == null || emailAddress.isEmpty() || !emailAddress.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            return false;
        }
        return true;
    }


    public boolean isPasswordVaild(String password) {
        if(password == null || password.isEmpty() || !password.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*[a-zA-Z0-9]).{8,}"))
            return false;
        else
            return true;
    }







}