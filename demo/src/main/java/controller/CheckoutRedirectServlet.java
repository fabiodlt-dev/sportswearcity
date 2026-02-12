package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;



@WebServlet("/checkout_redirect")
public class CheckoutRedirectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gestione della richiesta e creazione della pagina di destinazione
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/results/checkout.jsp");
        dispatcher.forward(request, response);
    }
}