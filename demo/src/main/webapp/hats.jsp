<%@ page import="model.Item" %>
<%@ page import="model.ItemDAO" %>
<html>
<head>
    <title>hats</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/dcc66202c8.js" crossorigin="anonymous"> </script>
    <script src ="javascript/script.js"></script>
    <script src ="javascript/script2.js"></script>
    <link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="css/articles.css">
    <link rel="stylesheet" href="css/mobile.css">
    <link rel="stylesheet" href="css/mobile2.css">
</head>
<body>
<div id="main-container">
    <div class="navbar-container clearfix">
        <div class="logo">
            <img src="images/logo.jpeg" alt="logo">
        </div>
        <nav class="navbar">
            <ul class="navbar-list">
                <% String brand = request.getParameter("brand");
                   String category = request.getParameter("category"); %>
                <li class="navbar-list-item"> <a href="jerseys.jsp?category=jersey&brand=<%=brand%>"> Jerseys </a> </li>
                <li class="navbar-list-item"> <a href="tshirts.jsp?category=tshirts&brand=<%=brand%>"> T-shirts </a> </li>
                <li class="navbar-list-item"> <a href="hats.jsp?category=hats&brand=<%=brand%>"> Hats  </a> </li>
                <li class="navbar-list-item"> <a href="accessories.jsp?category=accessories&brand=<%=brand%>"> Accessories  </a> </li>
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
                        <% }  else { %> <li> <a href="logout_servlet"> Log out </a> </li> <% } %>

                    </ul>
                </li>
                <li class="navbar-list-item"> <a href="cart.jsp"> <i class="fa-solid fa-cart-shopping" data-content="${(cart.getNumberofItems() == null) ? "0" : cart.getNumberofItems()}"> </i> </a> </li>
                <li class="navbar-list-item hamburger-menu"> <a href="#" onclick="hamburgerMenu()"> <i class="fa-solid fa-bars hamburger-icon"> </i> </a> </li>
            </ul>
        </nav>
        <nav class="mobile-navbar">
            <ul class="mobile-navbar-list">
                <li class="mobile-navbar-list-item"> <a href="#"> Jerseys </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> T-shirts </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Hats </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Accessories </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Filter by team <i class="fa-solid fa-angle-down"></i> </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Filter by brand <i class="fa-solid fa-angle-down"></i> </a> </li>
                <li class="mobile-navbar-list-item"> <a href="#"> Filter by price <i class="fa-solid fa-angle-down"></i> </a> </li>
            </ul>
        </nav>
    </div>
    <div class="content-container">
        <div class="sidebar">
            <div class="filter-by-team"> <a href="#" onclick="showOrHide2()"> Filter by team  <i class="fa-solid fa-angle-down" id="angle-down1"></i> </a> </div>
            <div class="nba-teams-container" id = "nba-teams-container">
                <ul>
                    <li class="nba-team">Atlanta Hawks</li>
                    <li class="nba-team">Boston Celtics</li>
                    <li class="nba-team">Brooklyn Nets</li>
                    <li class="nba-team">Charlotte Hornets</li>
                    <li class="nba-team">Chicago Bulls</li>
                    <li class="nba-team">Cleveland Cavaliers</li>
                    <li class="nba-team">Dallas Mavericks</li>
                    <li class="nba-team">Denver Nuggets</li>
                    <li class="nba-team">Detroit Pistons</li>
                    <li class="nba-team">Golden State Warriors</li>
                    <li class="nba-team">Houston Rockets</li>
                    <li class="nba-team">Indiana Pacers</li>
                    <li class="nba-team">Los Angeles Clippers</li>
                    <li class="nba-team">Los Angeles Lakers</li>
                    <li class="nba-team">Memphis Grizzlies</li>
                    <li class="nba-team">Miami Heat</li>
                    <li class="nba-team">Milwaukee Bucks</li>
                    <li class="nba-team">Minnesota Timberwolves</li>
                    <li class="nba-team">New Orleans Pelicans</li>
                    <li class="nba-team">New York Knicks</li>
                    <li class="nba-team">Oklahoma City Thunder</li>
                    <li class="nba-team">Orlando Magic</li>
                    <li class="nba-team">Philadelphia 76ers</li>
                    <li class="nba-team">Phoenix Suns</li>
                    <li class="nba-team">Portland Trail Blazers</li>
                    <li class="nba-team">Sacramento Kings</li>
                    <li class="nba-team">San Antonio Spurs</li>
                    <li class="nba-team">Toronto Raptors</li>
                    <li class="nba-team">Utah Jazz</li>
                    <li class="nba-team">Washington Wizards</li>
                </ul>
            </div>
            <div class="filter-by-size"> <a href="#" onclick="showOrHide()"> Filter by size  <i class="fa-solid fa-angle-down" id="angle-down2"></i></a></div>
            <div class="sizes-container" id="sizes-container">
                <div class="row">
                    <button class="size" value="XS"> XS </button>
                    <button class="size" value="S"> S </button>
                    <button class="size" value="M"> M </button>
                </div>
                <div class="row">
                    <button class="size" value="L"> L </button>
                    <button class="size" value="XL"> XL </button>
                    <button class="size" value="XXL"> XXL </button>
                </div>
            </div>
            <div class="filter-by-price">
                <form action="" method = "get">
                    <span> Filter by price </span>
                    <div class="ascending-order">
                        <label for="ascending-order"> Ascending order </label>
                        <input type="radio" name="sorting-order" id="ascending-order">
                    </div>
                    <div class="descending-order">
                        <label for="descending-order"> Descending order </label>
                        <input type="radio" name="sorting-order" id="descending-order">
                    </div>
                    <div class="initial-price">
                        <label for="first-value">  Starting price </label>
                        <input type="number" name="first-value" id="first-value" min="1" max="9999" value="">
                    </div>
                    <div class="ending-price">
                        <label for="second-value"> Ending price&nbsp; </label>
                        <input type="number" name="second-value" id="second-value" min="1" max="9999" value="">
                    </div>
                    <div class="button-container">
                        <input type="submit" value ="Search" id="search">
                    </div>
            </div>
            </form>
        </div>
        <div class="items-container">
            <div class="items-row">
                <%
                    StringBuilder teams = new StringBuilder(20);
                    String teamsParameters = request.getParameter("teams");

                    if(teamsParameters != null) {
                        teams.append(teamsParameters);
                        for(int i = teams.length(); i < 20; i++) {
                            teams.append(' ');
                        }
                    }

                    teamsParameters = teams.toString();
                    if(teamsParameters.isEmpty())
                        teamsParameters = null;

                    String sortingOrder = request.getParameter("sorting-order");
                    String initialPrice = request.getParameter("initial-price");
                    String endingPrice = request.getParameter("ending-price");

                    Item items[] = ItemDAO.getItems(category, brand, teamsParameters, sortingOrder, initialPrice, endingPrice);
                    for(int i = 0; i < items.length; i++) { %>
                <div class="item">
                    <a href="item.jsp?itemId=<%= items[i].getItemID()%>">  <img src="<%= items[i].getImageURL() %>" alt="item"> </a>
                    <p> <a href="item.jsp?itemId=<%= items[i].getItemID()%>"> <%=items[i].getItemDescription() %>
                        <br> &euro; <%= items[i].getPrice() %> </a>  </p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>