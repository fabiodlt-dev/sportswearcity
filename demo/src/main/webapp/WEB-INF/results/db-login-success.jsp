<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Refresh" content="5;url=index.jsp">
    <title> Successful registration </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/insertSuccess.css">
</head>
<body>
<div id="main-container">
    <h1>  Welcome back ${loggedCustomer.getFirstName()} ${loggedCustomer.getLastName()},  </h1>
    <div class="content-container">
        <p> You have successfully logged in. </p>
        <% response.setHeader("Refresh", "2;url=index.jsp"); %>

    </div>
</div>
</body>
</html>