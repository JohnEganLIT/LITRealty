<%-- 
    Document   : index
    Created on : 24-Oct-2018, 11:28:23
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script type="text/javascript" src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#propertiesTable').DataTable();
              });
        </script>
        
    <title>Agent Index</title>
    </head>
    <body>
        <header><img src="images/site/logo.gif" /></header>
    <shiro:user>
        <img src="images/agents/${agent.agentId}.jpg" alt="picture of agent"/>
        <a href="loadAddProperty?username=${agent.username}">Add Property</a>
        <p>To <a href="logoutController">logout</a>, click here</p>
        <table id="propertiesTable">
            <thead>
                <th>Property ID</th>
                <th>Street</th>
                <th>City</th>
                <th>Listing Number</th>
                <th>Bedrooms</th>
                <th>Bathrooms</th>
                <th>Square Ft.</th>
                <th>BER Rating</th>
                <th>Lot Size</th>
                <th>Garage Size</th>
                <th>Price</th>
                <th>Image</th>
                <th>Edit</th>
                <th>Delete</th>
            </thead>
            <tbody>
                <c:forEach var="property" items="${propertyList}">
                    <tr>
                        <td>${property.id}</td>
                        <td>${property.street}</td>
                        <td>${property.city}</td>
                        <td>${property.listingNum}</td>
                        <td>${property.bedrooms}</td>
                        <td>${property.bathrooms}</td>
                        <td>${property.squarefeet}</td>
                        <td><img src="images/BER/${property.berRating}.png" alt="image of BER Rating"/></td>
                        <td>${property.lotsize}</td>
                        <td>${property.garagesize}</td>
                        <td><fmt:formatNumber value="${property.price}" type="currency"></fmt:formatNumber></td>
                        <td><a href="propertyDrilldown?id=${property.id}"><img src="images/properties/thumbs/${property.listingNum}.JPG" width="75" height="50" alt="image of property"/></a></td>
                        <td><a href="loadEditProperty?id=${property.id}&username=${agent.username}">Edit</a></td>
                        <td><a href="deletePropertyController?id=${property.id}&username=${agent.username}" onclick="return confirm('Are you sure you want to delete ${property.id}, ${property.street}, ${property.city}?');">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </shiro:user>
    <shiro:guest>
        <p>You do not have permission to access this part of the site</p>
    </shiro:guest>
    </body>
</html>
