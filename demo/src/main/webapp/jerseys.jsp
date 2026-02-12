<%@ page import="model.Item" %>
<%@ page import="model.ItemDAO" %>

<html>
<head>
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
                <% String brand = request.getParameter("brand");  %>
                <li class="navbar-list-item"> <a href="jerseys.jsp?category=jerseys&brand=<%=brand%>"> Jerseys </a> </li>
                <li class="navbar-list-item"> <a href="tshirts.jsp?category=tshirts&brand=<%=brand%>"> T-shirts </a> </li>
                <li class="navbar-list-item"> <a href="hats.jsp?category=hats&brand=<%=brand%>"> Hats  </a> </li>
                <li class="navbar-list-item"> <a href="accessories.jsp?category=accessories&brand=<%=brand%>"> Accessories  </a> </li>
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
    <div id="content-container" class="content-container">
        <div id="sidebar" class="sidebar">
            <div class="filter-by-team"> <a href="#" onclick="showOrHide2()"> Filter by team  <i class="fa-solid fa-angle-down" id="angle-down1"></i> </a> </div>
            <div class="nba-teams-container" id = "nba-teams-container">

                <ul>
                    <li class="nba-team" value="BOS" onclick="select(this);">Boston Celtics</li>
                    <li class="nba-team" value="BKN" onclick="select(this);">Brooklyn Nets</li>
                    <li class="nba-team" value="CHA" onclick="select(this);">Charlotte Hornets</li>
                    <li class="nba-team" value="CHI" onclick="select(this);">Chicago Bulls</li>
                    <li class="nba-team" value="CLE" onclick="select(this);">Cleveland Cavaliers</li>
                    <li class="nba-team" value="DAL" onclick="select(this);">Dallas Mavericks</li>
                    <li class="nba-team" value="DEN" onclick="select(this);">Denver Nuggets</li>
                    <li class="nba-team" value="DET" onclick="select(this);">Detroit Pistons</li>
                    <li class="nba-team" value="GSW" onclick="select(this);">Golden State Warriors</li>
                    <li class="nba-team" value="HOU" onclick="select(this);">Houston Rockets</li>
                    <li class="nba-team" value="IND" onclick="select(this);">Indiana Pacers</li>
                    <li class="nba-team" value="LAC" onclick="select(this);">Los Angeles Clippers</li>
                    <li class="nba-team" value="LAL" onclick="select(this);">Los Angeles Lakers</li>
                    <li class="nba-team" value="MEM" onclick="select(this);">Memphis Grizzlies</li>
                    <li class="nba-team" value="MIA" onclick="select(this);">Miami Heat</li>
                    <li class="nba-team" value="MIL" onclick="select(this);">Milwaukee Bucks</li>
                    <li class="nba-team" value="MIN" onclick="select(this);">Minnesota Timberwolves</li>
                    <li class="nba-team" value="NOP" onclick="select(this);">New Orleans Pelicans</li>
                    <li class="nba-team" value="NYK" onclick="select(this);">New York Knicks</li>
                    <li class="nba-team" value="OKC" onclick="select(this);">Oklahoma City Thunder</li>
                    <li class="nba-team" value="ORL" onclick="select(this);">Orlando Magic</li>
                    <li class="nba-team" value="PHI" onclick="select(this);">Philadelphia 76ers</li>
                    <li class="nba-team" value="PHX" onclick="select(this);">Phoenix Suns</li>
                    <li class="nba-team" value="POR" onclick="select(this);">Portland Trail Blazers</li>
                    <li class="nba-team" value="SAC" onclick="select(this);">Sacramento Kings</li>
                    <li class="nba-team" value="SAS" onclick="select(this);">San Antonio Spurs</li>
                    <li class="nba-team" value="TOR" onclick="select(this);">Toronto Raptors</li>
                    <li class="nba-team" value="UTA" onclick="select(this);">Utah Jazz</li>
                    <li class="nba-team" value="WAS" onclick="select(this);">Washington Wizards</li>
                </ul>

                <script>
                    let numberOfSelectedTeams = 0;
                    function select(element) {
                        if(element.style.backgroundColor === "white") {
                            element.style.backgroundColor = "#021848";
                            element.style.color = "white";
                            numberOfSelectedTeams--;
                        }
                        else if(numberOfSelectedTeams < 5) {
                            element.style.backgroundColor = "white";
                            element.style.color = "#021848";
                            numberOfSelectedTeams++;
                        }
                    }

                    function getParameters() {
                        const elements = document.getElementsByClassName("nba-team");
                        let teamsElement = document.getElementById("teams");
                        let teamValues = "";
                        for(let i = 0; i < elements.length; i++) {
                            if(elements[i].style.backgroundColor === "white") {
                                teamValues += elements[i].getAttribute("value") +"_";
                            }
                        }
                        teamsElement.setAttribute("value",teamValues);
                    }
                </script>


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
                <form method="GET" onsubmit="getParameters()">
                    <span> Filter by price </span>
                    <div class="ascending-order">
                        <label for="ascending-order"> Ascending order </label>
                        <input type="radio" name="sorting-order" id="ascending-order" value="asc">
                    </div>
                    <div class="descending-order">
                        <label for="descending-order"> Descending order </label>
                        <input type="radio" name="sorting-order" id="descending-order" value="desc">
                    </div>
                    <div class="initial-price">
                        <label for="initial-price">  Starting price </label>
                        <input type="number" name="initial-price" id="initial-price" min="1" max="9999">
                    </div>
                    <div class="ending-price">
                        <label for="ending-price"> Ending price&nbsp; </label>
                        <input type="number" name="ending-price" id="ending-price" min="1" max="9999">
                    </div>
                    <div class="button-container">
                        <%  String category = request.getParameter("category");
                            %>
                        <input type="submit" value ="Search" id="search">
                        <input type="hidden" name="teams" value="" id="teams">
                        <input type="hidden" name="category" value="<%=category%>" id="category">
                        <input type="hidden" name="brand" value="<%=brand%>" id="brand">
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