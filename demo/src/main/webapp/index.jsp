<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="css/mobile.css">
    <script src="https://kit.fontawesome.com/dcc66202c8.js" crossorigin="anonymous"> </script>
    <script src="javascript/script.js"> </script>
    <title> Sportswear City </title>
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
                    <li class="mobile-navbar-list-item"> <a href="index.jsp"> Home </a> </li>
                    <li class="mobile-navbar-list-item"> <a href="brands.jsp"> Brands </a> </li>
                    <li class="mobile-navbar-list-item"> <a href="contacts.jsp"> Contacts </a> </li>
                    <li class="mobile-navbar-list-item"> <a href="aboutus.jsp"> About us </a> </li>
                </ul>
            </nav>
    </div>
        <div class="content-container">
            <div class="nba card">
                    <img src="images/Kelly-Oubre.jpg" alt="Kelly-Oubre">
                    <div class="shop-now-btn-container">
                        <a href="jerseys.jsp?category=jerseys&brand=nba" class="shop-now-btn"> Shop now <i class="fa-solid fa-arrow-right-to-bracket"></i> </a>
                    </div>
            </div>
            <div class="nhl card">
                <img src="images/nhl.png" alt="Kelly-Oubre">            
                <div class="shop-now-btn-container">
                    <a href="jerseys.jsp?category=jerseys&brand=nhl" class="shop-now-btn"> Shop now <i class="fa-solid fa-arrow-right-to-bracket"></i> </a>
                </div>
            </div> 
            <div class="nfl card">
                <img src="images/nfl.png" alt="Kelly-Oubre">
                <div class="shop-now-btn-container">
                    <a href="jerseys.jsp?category=jerseys&brand=nfl" class="shop-now-btn"> Shop now <i class="fa-solid fa-arrow-right-to-bracket"></i> </a>
                </div>
            </div>
            <div class="nhl card">
                <img src="images/mlb.png" class="displayed" alt="Kelly-Oubre">
                <div class="shop-now-btn-container">
                    <a href="jerseys.jsp?category=jerseys&brand=mlb" class="shop-now-btn"> Shop now <i class="fa-solid fa-arrow-right-to-bracket"></i> </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>