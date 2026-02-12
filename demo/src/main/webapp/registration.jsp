<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/registration.css">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="css/mobile3.css">
    <script src="javascript/script3.js"> </script>

    <title>Sign up and Sign in</title>
</head>
<body>
    <div id="main-container">
        <div id="content-container">
            <div class="sign-up-sign-in-box">
                <div class="sign-up-or-sign-in">
                   <a href="#" class="sign-up" id="sign-up" onclick="signUp()"> Sign up </a>
                   <a href="#" class="sign-in" id="sign-in" onclick="signIn()"> Sign in </a>
                </div>
                <div class="sign-up-content" id="sign-up-content">
                 <form action="registration_servlet" method="POST">
                    <div class="row"> 
                        <label for="firstName"> First Name </label>
                        <input type="text" name="firstName" id="firstName" required>
                    </div>
                    <div class="row">
                        <label for="lastName"> Last Name </label>
                        <input type="text" name="lastName" id="lastName" required>
                    </div>
                    <div class="row">
                        <label for="dateOfBirth"> Date of Birth </label>
                        <input type="text" name="dateOfBirth" id="dateOfBirth" pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$" oninvalid="this.setCustomValidity('Date of Birth must follow this format DD/MM/YYYY')" oninput="setCustomValidity('')" required>
                    </div>
                    <div class="row">
                        <label for="emailAddress"> Email address </label>
                        <input type="email" name="emailAddress" id="emailAddress"  oninvalid="this.setCustomValidity('Insert a valid email address')" oninput="setCustomValidity('')" required >
                    </div>
                    <div class="row">
                        <label for="emailAddressConfirmation"> Confirm Email  </label>
                        <input type="email" name="emailAddressConfirmation" id="emailAddressConfirmation"  oninvalid="this.setCustomValidity('Insert a valid email address')" oninput="setCustomValidity('')" required>
                    </div>
                    <div class="row">
                        <label for="password"> Password </label>
                        <input type="password" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*[a-zA-Z0-9]).{8,}" oninvalid="this.setCustomValidity('Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character (@#$%^&+=)')" oninput="setCustomValidity('')" required>
                    </div>
                     <div class="row">
                         <label for="passwordConfirmation"> Confirm Password </label>
                         <input type="password" name="confirmationPassword" id="passwordConfirmation" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*[a-zA-Z0-9]).{8,}" oninvalid="this.setCustomValidity('Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character (@#$%^&+=)')" oninput="setCustomValidity('')" required>
                     </div>
                    <div class="row">
                        <label for="phoneNumber"> Phone Number </label>
                        <input type="tel" name="phoneNumber" id="phoneNumber" pattern="^\d{10}$" oninvalid="this.setCustomValidity('Phone number must contain 10 digits')" oninput="setCustomValidity('')"  required>
                    </div>
                    <div class="row submit-row">
                        <input type="submit" value="Sign up" class="sign-up-button" required>
                    </div>
               </form> 
                </div>

                <div class="sign-in-content" id="sign-in-content">
                    <form method="POST" action="javascript:void(0)" onsubmit="sendAjaxRequest()">
                        <div class="row">
                            <label for="emailAddressLogin"> Email address </label>
                            <input type="email" name="emailAddressLogin" id="emailAddressLogin"
                                   oninvalid="this.setCustomValidity('Insert a valid email address')"
                                   oninput="setCustomValidity('')" required>
                        </div>
                        <div class="row">
                            <label for="passwordLogin"> Password </label>
                            <input type="password" name="passwordLogin" id="passwordLogin" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*[a-zA-Z0-9]).{8,}" oninvalid="this.setCustomValidity('Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character (@#$%^&+=)')" oninput="setCustomValidity('')" required>
                        </div>

                        <div class="response-message-container">
                            <p id="response-message" class="response-message">   </p>
                        </div>

                        <div class="row submit-row">
                            <input type="submit" value="Sign in" class="sign-up-button" required>
                        </div>

                </form>
                    <script>
                        if(window.location.hash) {
                            let hash = window.location.hash.substring(1);
                            if(hash === "sign-in-content") {
                                signIn();
                            }
                        }
                    </script>
                </div>
            </div>
            <script>

                function sendAjaxRequest() {
                    let emailAddress = document.getElementById("emailAddressLogin").value;
                    let password = document.getElementById("passwordLogin").value;

                    let xhr = new XMLHttpRequest();
                    xhr.open("POST", "login_servlet", true); // Adjust the URL to match your servlet mapping
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            let response = JSON.parse(xhr.responseText);
                            let responseElement =  document.getElementById("response-message");
                            responseElement.innerText = response.message;
                            if(response.message == "Login successful") {
                                window.location.href = "login_redirect";
                                responseElement.style.color = "#008000";
                            }
                            else {
                                responseElement.style.color = "#87062D";
                            }
                        }
                    };

                    xhr.send("emailAddressLogin=" + encodeURIComponent(emailAddress) + "&passwordLogin=" + encodeURIComponent(password));

                }
            </script>


        </div>
    </div>
</body>
</html>