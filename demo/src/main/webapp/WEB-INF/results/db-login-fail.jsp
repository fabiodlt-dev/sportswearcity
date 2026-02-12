<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registration.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mobile3.css">
    <title>Sign up and Sign in</title>
</head>
<body>
<div id="main-container">
    <div id="content-container">
        <div class="sign-up-sign-in-box">
            <div class="sign-up-or-sign-in">
                <a href="#" class="sign-in" id="sign-in" style="background-color: #87062D"> Sign in </a>
            </div>
            <div class="sign-in-content" id="sign-in-content" style="display:block">
                <form action="login_servlet" method="POST">
                    <div class="row">
                        <label for="emailAddressLogin"> Email address </label>
                        <input type="email" name="emailAddressLogin" id="emailAddressLogin" oninvalid="this.setCustomValidity('Insert a valid email address')" oninput="setCustomValidity('')" required>
                    </div>
                    <div class="row">
                        <label for="passwordLogin"> Password </label>
                        <input type="password" name="passwordLogin" id="passwordLogin" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*[a-zA-Z0-9]).{8,}" oninvalid="this.setCustomValidity('Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character (@#$%^&+=)')" oninput="setCustomValidity('')" required>
                    </div>
                    <div class="row">
                        <p class="error-message" style="color:#e11f5a"> Username or password incorrect!  </p>
                    </div>
                    <div class="row submit-row">
                        <input type="submit" value="Sign in" class="sign-up-button" required>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>