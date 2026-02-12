<%@ page import="model.Item" %>
<%@ page import="model.ItemDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="css/mobile.css">
    <link rel="stylesheet" href="css/item.css">
    <link rel="stylesheet" href="css/mobile4.css">
    <script src="javascript/script.js"></script>
    <script src="https://kit.fontawesome.com/dcc66202c8.js" crossorigin="anonymous"> </script>
    <title>Document</title> 
</head>
<body>
    <div id="main-container">
        <div id="navbar-container">
            <div class="navbar-container clearfix">
                <div class="logo"> 
                    <img src="images/logo.jpeg" alt="logo">
                </div>
                <nav class="navbar">
                    <ul class="navbar-list">
                        <li class="navbar-list-item"> <a href="#"> Jerseys </a> </li>
                        <li class="navbar-list-item"> <a href="#"> T-shirts </a> </li>
                        <li class="navbar-list-item"> <a href="#"> Hats  </a> </li>
                        <li class="navbar-list-item"> <a href="#"> Accessories  </a> </li>
                    </ul>
            </nav>  
                <nav class="navbar-icons">
                    <ul class="navbar-icons-list">
                        <li class="navbar-list-item">
                            <a href="" class="user-icon"> <i class="fa-regular fa-user"> </i> </a>
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
                        <li class="navbar-list-item"> <a href="cart.jsp"> <i class="fa-solid fa-cart-shopping" data-content="${(cart.getNumberofItems() == null) ? "0" : cart.getNumberofItems()}" id="cart-icon"> </i> </a> </li>
                        <li class="navbar-list-item hamburger-menu"> <a href="#" onclick="hamburgerMenu()"> <i class="fa-solid fa-bars hamburger-icon"> </i> </a> </li>
                    </ul>
                </nav>
                <nav class="mobile-navbar">
                    <ul class="mobile-navbar-list">
                        <li class="mobile-navbar-list-item"> <a href="#"> Jerseys </a> </li>
                        <li class="mobile-navbar-list-item"> <a href="#"> T-shirts </a> </li>
                        <li class="mobile-navbar-list-item"> <a href="#"> Hats </a> </li>
                        <li class="mobile-navbar-list-item"> <a href="#"> Accessories </a> </li>
                    </ul>
                </nav>
        </div>
        </div>

        <%        String itemId = request.getParameter("itemId");
                  Item item = ItemDAO.getItem(Integer.parseInt(itemId));
        %>
      <div id="content-container">
        <div class="item-container">
            <div class="item">
                <img src="<%= item.getImageURL() %>" alt="">
            </div>
            <div class="item-details">
                <div class="item-title"> 
                        <%= item.getItemDescription() %>
                </div>
                <div class="item-price">
                   Price: <em> <%= item.getPrice() %> &euro;</em>
                </div>
                <div class="item-size">
                    Select size: 
                    <button class="size" value="XS"> XS </button>
                    <button class="size" value="S"> S </button>
                    <button class="size" value="M"> M </button>
                    <button class="size" value="L"> L </button>
                    <button class="size" value="XL"> XL </button>   
                    <button class="size" value="XXL"> XXL </button>   
                   
                </div>
                <script>

                    function addToCartRequest() {
                        let urlParams = new URLSearchParams(window.location.search);
                        let itemId = urlParams.get("itemId");
                        let amount = document.getElementById("amount").value;

                        let xhr = new XMLHttpRequest();
                        xhr.open("POST", "add_to_cart", true); // Adjust the URL to match your servlet mapping
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                let response = JSON.parse(xhr.responseText);
                                let responseElement =  document.getElementById("response-message");
                                responseElement.innerText = response.message;
                                if(response.message === "Item added to Cart successfully") {
                                    responseElement.style.color = "#008000";
                                    setTimeout(function(){
                                        location.reload();
                                    }, 500);
                                }
                                else {
                                    responseElement.style.color = "#87062D";
                                }
                            }
                        };

                        xhr.send("itemId=" + encodeURIComponent(itemId) + "&amount=" + encodeURIComponent(amount));

                    }
                </script>

                <form method="POST" action="javascript:void(0)" onsubmit="addToCartRequest()">
                    <div class="item-quantity">
                       Amount:
                      <input type="number" min="1" max="10" value="1" name="amount" id="amount">
                    </div>
                    <div class="add-to-cart-button">
                        <button class="add-to-cart-btn" type="submit"> Add to Cart </button>
                    </div>
                    <div class="response-message-container">
                        <p id="response-message">  </p>
                    </div>
                </form>
            </div>
            </div>
        </div>
        </div>
    </div>
</body>
</html>