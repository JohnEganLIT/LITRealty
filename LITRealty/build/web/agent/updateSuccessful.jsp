<%-- 
    Document   : updateSuccessful
    Created on : 02-Nov-2018, 18:59:59
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
        
        <h1>Update Successful</h1>
        <p>Go <a href="allPropertiesController?username=${agent.username}">Back</a> to Index page</p>
    </shiro:user>
    <shiro:guest>
        <p>You do not have permission to access this part of the site</p>
    </shiro:guest>
    </body>
</html>
