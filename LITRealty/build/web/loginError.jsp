<%-- 
    Document   : loginError
    Created on : 15-Nov-2018, 20:04:00
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header><img src="images/site/logo.gif" /></header>
        <h1>Something went wrong. Please try to <a href="login.jsp">login</a> again</h1>
        <p>${ex}</p>
    </body>
</html>
