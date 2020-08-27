<%-- 
    Document   : addSuccessful
    Created on : 08-Nov-2018, 17:21:42
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header><img src="images/site/logo.gif" /></header>
    <shiro:user>
        <img src="images/agents/${agent.agentId}.jpg" />
        <p>${agent.name}</p>
        <p>${message}</p>
        
        <h1>Property has been added to the database</h1>
        <p><a href="allPropertiesController?username=${agent.username}">Back to index</a></p>
    </shiro:user>
    <shiro:guest>
        <p>You do not have permission to access this part of the site</p>
    </shiro:guest>
    </body>
</html>
