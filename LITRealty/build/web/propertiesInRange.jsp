<%-- 
    Document   : propertiesInRange
    Created on : 04-Dec-2018, 12:34:04
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script type="text/javascript" src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#propertiesTable').DataTable();
              });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Properties In Your Price Range</h1>
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
            </thead>
            <tbody>
                <c:forEach var="property" items="${properties}">
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
                        <td><a href="propertyDrilldown?id=${property.id}"><img src="images/properties/thumbs/${property.listingNum}.JPG" width="75" height="50" alt="image of property"/></a></td>                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button type="button" value="Back" onClick="history.back()">Back</button>
    </body>
</html>
