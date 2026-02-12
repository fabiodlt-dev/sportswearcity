<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/item.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile4.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css">

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
                        <li class="navbar-list-item"> <a href=""> <i class="fa-regular fa-user"> </i> </a> </li>
                        <li class="navbar-list-item"> <a href=""> <i class="fa-solid fa-cart-shopping">  </i> </a>
                                <a href="#" class="items-counter">  ${cart.getNumberofItems()} </a> </li>
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
      <div id="content-container">
        <div class="item-container">
            <div class="item">
                <img src="images/booker-jersey.png" alt="">
            </div>
            <div class="item-details">
                <div class="item-title"> 
                Jersey Phoenix Sun Nike Jordan <br> -Devin Booker 
                </div>
                <div class="item-price">
                   Price: <em> 90,00 EUR </em>
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
                <div class="item-quantity">
                    Amount:
                    <input type="number" min="1" max="10" value="1">
                </div>
                <div class="add-to-cart-button">
                    <form action="add_to_cart" method="get">
                        <button class="add-to-cart-btn" type="submit"> Add to Cart </button>
                        <input type="hidden" name="itemId" value="1">
                    </form>
                </div>
                <div class="item-added">
                    <p> Item added to Cart successfully </p>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>
</body>
</html>