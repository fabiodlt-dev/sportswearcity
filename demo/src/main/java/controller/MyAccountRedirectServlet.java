package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LoggedCustomer;

import java.io.IOException;

@WebServlet(name = "MyAccountRedirectServlet", value = "/my_account")
public class MyAccountRedirectServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession ssn = request.getSession(false);

        if(ssn != null) {
            if(ssn.getAttribute("loggedCustomer") != null) {
                request.getRequestDispatcher("WEB-INF/results/myaccount.jsp").forward(request,response);
            }

            else {
                response.sendRedirect("registration.jsp#sign-in-content");
            }

        }
    }
}
