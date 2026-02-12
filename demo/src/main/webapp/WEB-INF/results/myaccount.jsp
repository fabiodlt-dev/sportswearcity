<%--
  Created by IntelliJ IDEA.
  User: Famiglia Di Lieto
  Date: 20/08/2024
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.LoggedCustomer" %>
<%@ page import="model.RegisteredCustomer" %>
<%@ page import="model.CustomerDAO" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>  My account </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myaccount.css">
</head>
<body>
<%  LoggedCustomer loggedCustomer = (LoggedCustomer) session.getAttribute("loggedCustomer");
    RegisteredCustomer registeredCustomer = CustomerDAO.getCustomerInformation(loggedCustomer.getEmailAddress()); %>
    <div id="main-container">
            <div id="content-container">
            <div class="account-details-orders-container">
                <div class="account-details">
                    Account details
                </div>
                <div class="my-orders">
                    My orders
                </div>
            </div>

            <div class="account-details-container">
                <table class="account-details-table">
                    <tr>
                        <th> First Name: </th>
                        <td> <%= registeredCustomer.getFirstName() %>  </td>
                    </tr>
                    <tr>
                        <th> Last Name: </th>
                        <td> <%=registeredCustomer.getLastName() %></td>
                    </tr>

                    <tr>
                        <th> Date of Birth: </th>
                        <td> <%=registeredCustomer.getDateOfBirth() %> </td>
                    </tr>

                    <tr>
                        <th> Email address: </th>
                        <td> <%=registeredCustomer.getEmailAddress() %> </td>
                    </tr>

                    <tr>
                        <th> Phone number: </th>
                        <td> <%=registeredCustomer.getPhoneNumber() %> </td>
                    </tr>
                    <tr>
                        <th> Credit Cart number:  </th>
                        <td> XXXX - XXXX - XXXX - XXXX </td>
                    </tr>
                    <tr>
                        <th> Shipping address: </th>
                        <td> Via Marino Guerritore 19 Pagani <br> Salerno </td>
                    </tr>
                </table>
            </div>
            </div>
        </div>
</body>
</html>
