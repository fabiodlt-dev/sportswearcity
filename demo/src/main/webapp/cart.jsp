<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page import="model.ItemDAO" %>
<%@ page import="model.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Cart </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="css/mobile.css">
    <script src="https://kit.fontawesome.com/dcc66202c8.js" crossorigin="anonymous"> </script>
    <script src="javascript/script.js"> </script>
</head>
<body>
<div id="main-container">
    <div class="navbar-container clearfix">
        <div class="logo">
            <img src="images/logo.jpeg" alt="logo">
        </div>
        <nav class="navbar">
            <ul class="navbar-list">
                <li class="navbar-list-item"> <a href="#"> Home </a> </li>
                <li class="navbar-list-item"> <a href="#"> Brands <i class="fa-solid fa-angle-down"> </i> </a> </li>
                <li class="navbar-list-item"> <a href="#"> Contacts </a> </li>
                <li class="navbar-list-item"> <a href="#"> About us </a> </li>
            </ul>
        </nav>
        <nav class="navbar-icons">
            <ul class="navbar-icons-list">
                <li class="navbar-list-item">
                    <a href="my_account" class="user-icon"> <i class="fa-regular fa-user"> </i> </a>
                    <ul class="registration-login-logout">
                        <li> <a href="my_account"> My account </a> </li>
                        <% if(session.getAttribute("loggedCustomer") == null) { %>
                        <li> <a href="registration.jsp"> Register </a> </li>
                        <li> <a href="registration.jsp#sign-in-content"> Login  </a> </li>
                        <% }  else { %> <li> <a href=""> My orders </a> </li>
                        <li> <a href="logout_servlet"> Log out </a> </li>
                        <% } %>

                    </ul>
                </li>
                <li class="navbar-list-item"> <a href="cart.jsp"> <i class="fa-solid fa-cart-shopping" data-content="${(cart.getNumberofItems() == null) ? "0" : cart.getNumberofItems()}"> </i> </a> </li>
                <li class="navbar-list-item hamburger-menu"> <a href="#" onclick="hamburgerMenu()"> <i class="fa-solid fa-bars hamburger-icon"> </i> </a> </li>
            </ul>
        </nav>
        <nav class="mobile-navbar">
            <ul class="mobile-navbar-list">
                <li class="mobile-navbar-list-item"> <a href="#"> Home </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Brands </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Contacts </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> About us </a> </li>
            </ul>
        </nav>
    </div>
    <div class="content-container">
        <div></div>
        <script>
            function removeFromCart(itemId) {
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "remove_from_cart", true); // Adjust the URL to match your servlet mapping
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        let response = JSON.parse(xhr.responseText);
                        setTimeout(function(){
                            location.reload();
                        }, 500);
                    }
                };
                xhr.send("itemId=" + encodeURIComponent(itemId));
            }
        </script>
        <div class="cart-container">
            <%
                Cart cart = (Cart) session.getAttribute("cart");
                if(cart != null) {
                 for(CartItem cartItem : cart.getItems()) {
                    Item item = ItemDAO.getItem(cartItem.getItemId());
                        %>
                    <div class="cart-item">
                         <div class="cart-item-image">
                              <img src="<%= item.getImageURL() %> " alt="durant-jersey" onclick="location.href = 'item.jsp?itemId=<%=item.getItemID()%>';">
                </div>
                <div class="cart-item-content">
                    <div class="cart-item-description">
                        <a href="item.jsp?itemId=<%=item.getItemID()%>">  <%= item.getItemDescription() %> </a>
                    </div>
                    <div class="cart-item-price">
                            Price:
                        <em> <%= Math.round((item.getPrice() * cartItem.getAmount()) * 100.0)  / 100.0  %> &euro;</em>
                    </div>
                    <div class="cart-item-amount">
                            Amount: <%= cartItem.getAmount() %>
                            </div>
                    <div class="remove-from-cart">
                        <button class="remove-from-cart-btn" onclick="removeFromCart(<%= item.getItemID() %>)">
                            Remove from Cart
                        </button>
                    </div>
                </div>
            </div>
          <%   }
          }
                %>
        </div>
        <div class="total-order-container">
            <div class="total-order-content-container">
                <h1> Order details: </h1>
                <h2> The total of your order is: </h2>
                <div class="total-details">
                    <div class="subtotal"> Subtotal: ${(cart.getTotalPrice() == null) || (cart.getTotalPrice() == 0) ? "0.00" : Math.round(cart.getTotalPrice() * 100.00) / 100.00} &euro; </div>
                    <div class="number-of-items"> Number of items:${(cart.getNumberofItems() == null) ? "0" : cart.getNumberofItems()} </div>
                    <div class="shipping"> Shipping:  ${(cart.getTotalPrice() == null) || (cart.getTotalPrice() == 0) ? "0.00" : "10.00"} &euro; </div>
                    <div class="total"> Total: ${(cart.getTotalPrice() == null) || (cart.getTotalPrice() == 0) ? "0.00" : Math.round((cart.getTotalPrice() + 10.00) * 100.00) / 100.00}  &euro;</div>
                </div>
                <script>
                    function makeOrder() {
                        let xhr = new XMLHttpRequest();
                        xhr.open("POST", "check_cart", true); // Adjust the URL to match your servlet mapping
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                let response = JSON.parse(xhr.responseText);
                                let responseElement =  document.getElementById("response-message-order");
                                responseElement.innerText = response.message;
                                if(responseElement.innerText !== "Your cart is currently empty. Please add items to proceed.") {
                                    // Crea un form dinamico per fare il redirect con POST
                                    let form = document.createElement("form");
                                    form.method = "POST";
                                    form.action = "./checkout_redirect";  // URL della servlet o pagina che gestisce la POST


                                    // Aggiungi il form al body e invialo
                                    document.body.appendChild(form);
                                    form.submit();
                                }
                            }
                        };

                        xhr.send();

                    }
                </script>
                <div class="proceed-to-checkout-button">
                    <button class="proceed-to-checkout-btn" onclick="makeOrder()">
                        Proceed to checkout
                    </button>
                    <div id="response-message-order">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
