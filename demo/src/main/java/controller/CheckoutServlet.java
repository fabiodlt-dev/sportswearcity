package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.LoggedCustomer;
import model.Order;
import model.OrderDAO;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

@WebServlet(name = "CheckoutServlet", value = "/check_out")
public class CheckoutServlet extends HttpServlet {
    @Override
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


            /* Shipping details */
            String fullName = request.getParameter("full-name");
            String streetAddress = request.getParameter("street-address");
            String city = request.getParameter("city");
            String stateOrProvince = request.getParameter("state-province");
            String zipOrPostalCode = request.getParameter("zip-postal-code");
            String country = request.getParameter("country");

            /*   Payment details  */

            String paymentMethod = request.getParameter("payment-method");
            float paymentAmount = 0.0f;

            HttpSession ssn = request.getSession(false);

            if(ssn != null) {
                Cart cart = (Cart) ssn.getAttribute("cart");
                paymentAmount = cart.getTotalPrice() + 10.f;

                Order order = new Order();
                order.setShipping_fullName(fullName);
                order.setShipping_address(streetAddress);
                order.setShipping_city(city);
                order.setShipping_state(stateOrProvince);
                order.setShipping_zip(zipOrPostalCode);
                order.setShipping_country(country);
                order.setOrderDate(new Date());
                order.setPayment_method(paymentMethod);
                order.setPayment_amount(Math.round((paymentAmount + 10.00) * 100.00) / 100.0f);
                OrderDAO.saveOrder(order);

                request.setAttribute("order",order);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/results/order.jsp");
                requestDispatcher.forward(request,response);

            }

    }
}
