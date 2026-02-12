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
    <h1>  You have successfully logged out  </h1>
    <h2> We're redirecting you to home page </h2>
    <% response.setHeader("Refresh", "2;url=index.jsp"); %>

</div>
</body>
</html>