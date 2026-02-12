package controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;
import model.Cart;
import model.CartItem;
import model.CustomerAuthentication;
import model.LoggedCustomer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet(name = "LogoutServlet",value = "/logout_servlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {         // reading parameters from request
        HttpSession session = request.getSession(false);
        String sessionId = session.getId();
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;

        for(Cookie c : cookies) {
            if(c.getName().toLowerCase().equals("jsessionid")) {
                cookie = c;
            }
        }

        if(session != null) {
                if((LoggedCustomer)session.getAttribute("loggedCustomer") != null) {
                    session.invalidate();
                    HttpSession ssn = request.getSession();
                    if(ssn != null) {
                        Cart cart = new Cart();
                        cart.setItems(new ArrayList<CartItem>());
                        cart.setNumberofItems(cart.getItems().size());
                        cart.setTotalPrice(0);
                        cookie.setMaxAge(0);
                        ssn.setAttribute("cart", cart);
                    }

                    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/results/log-out-success.jsp");
                    dispatcher.forward(request, response);
                }
                else {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }

        }

        }
}