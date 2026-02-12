<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Famiglia Di Lieto
  Date: 10/09/2024
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanks for your order </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
</head>
<body>
    <div id="main-container">
        <div class="content-container">
            <h1> Dear ${order.getShipping_fullName()} </h1>
            <h2> Thank you for shopping with us! Your order has been successfully placed and is being processed. <br> Below are the details of your purchase:</h2>
            <div class="order-summary">
                <h1> Order Summary: </h1>
                <h3> Order Number: </h3>
                <h3> Order Date: ${order.getOrderDate()} </h3>
            </div>
            <div class="items-ordered">
                <h1> Items details</h1>
                <h2> Items ordered: ${cart.getNumberofItems()} </h2>
            </div>

            <div class="payment-details">
                <h1>  Payment details  </h1>
                <h2> Total amount: ${order.getPayment_amount()} &euro;</h2>
                <h2> Payment method: ${order.getPayment_method()} </h2>
            </div>

            <div class="shipping-details">
                <h1> Shipping details: </h1>
                <h2> Full Name: ${order.getShipping_fullName()} </h2>
                <h2> Shipping address: ${order.getShipping_address()} </h2>
                <h2> Shipping city: ${order.getShipping_city()} </h2>
                <h2> Shipping state/province: ${order.getShipping_state()} </h2>
                <h2> Shipping zip/postal code: ${order.getShipping_zip()} </h2>
                <h2> Shipping country: ${order.getShipping_country()} </h2>
                <%
                    HttpSession ssn = request.getSession(false);
                    if(ssn != null) {
                        Cart cart = (Cart)session.getAttribute("cart");

                        for(CartItem item : cart.getItems()) {
                            if((LoggedCustomer)ssn.getAttribute("loggedCustomer") != null)
                                CartItemDAO.removeCartItem(item);
                                ItemDAO.updateItemAmount(ItemDAO.getItem(item.getItemId()),item.getAmount());
                        }

                        if((LoggedCustomer)ssn.getAttribute("loggedCustomer") != null)
                            CartDAO.updateCart(cart);

                        cart.setItems(new ArrayList<CartItem>());
                        cart.setNumberofItems(cart.getItems().size());
                        cart.setTotalPrice(0);
                        ssn.removeAttribute("cart");
                        ssn.setAttribute("cart",cart);
                    }
                    response.setHeader("Refresh", "8;url=index.jsp");
                %>

            </div>
        </div>
    </div>
</body>
</html>
