<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="model.RegisteredCustomer" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Refresh" content="5;url=index.jsp">
    <title> Successful registration </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/insertSuccess.css">
</head>
<body>
    <div id="main-container">
        <h1>  Successful registration  </h1>
        <div class="content-container">
            <p> Dear ${customer.getFirstName()}, </p>
            <p> Congratulations! <br> Your registration with Sportswear City has been successfully completed. </p>
            <p> Your registration details: <br>
                First name: ${customer.getFirstName()} <br>
                Last name: ${customer.getLastName()} <br>
                Email address: ${customer.getEmailAddress()}
            </p>
            <p>
                Thank you for joining us. We look forward to serving you! <br>
                Best regards.
            </p>

            <%
                RegisteredCustomer cstm = (RegisteredCustomer) request.getAttribute("customer");
                response.setHeader("Refresh", "2;url=cart_servlet?" + "customerID=" + cstm.getCustomerID());
            %>
        </div>
    </div>
</body>
</html>