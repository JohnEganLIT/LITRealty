<%-- 
    Document   : propertyDrilldown
    Created on : 02-Nov-2018, 15:03:02
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgDGTjk4x9b1C94Cl6J44tWop0ENxXzKg"></script>
        <script>  
            var geocoder;
            var map;
            function initialize() {
              geocoder = new google.maps.Geocoder();
              var latlng = new google.maps.LatLng(53.350140, -6.266155);
              var mapOptions = {
                zoom: 8,
                center: latlng
              }
              map = new google.maps.Map(document.getElementById('map'), mapOptions);
              codeAddress();
            }

            function codeAddress() {
              var address = document.getElementById('address').value;
              geocoder.geocode( { 'address': address}, function(results, status) {
                if (status == 'OK') {
                  map.setCenter(results[0].geometry.location);
                  var marker = new google.maps.Marker({
                      map: map,
                      position: results[0].geometry.location
                  });
                } else {
                  alert('Geocode was not successful for the following reason: ' + status);
                }
              });
            }
            
        </script>
        <title>JSP Page</title>
    </head>
    <body onload="initialize()">

        <div id="map" style="width: 320px; height: 480px; float:right;"></div>

        <div>
            <input id="address" type="hidden" value="${property.street}, ${property.city}">
          </div>
        <header><img src="images/site/logo.gif" />
        <shiro:user>
            <p>${agent.name}</p>
            <img src="images/agents/${agent.agentId}.jpg" />
        </shiro:user>
        </header>
        <h1>Property Drilldown</h1>
        
        <p>Average Price of a property in this area: <fmt:formatNumber value="${averagePrice}" type="currency"></fmt:formatNumber></p>
        
        <c:forEach items="${images}" var="img">  
            <img src="images/properties/large/${property.listingNum}/${img}" width="300" height="300"/>
        </c:forEach>
            
        <p>Property Street: ${property.street}</p>
        <p>Property City: ${property.city}</p>
        <p>Property Listing Number: ${property.listingNum}</p>
        
        <c:choose>
        <c:when test="${property.styleId == 1}">
            <p>Property Style: Bungalow</p>
        </c:when>
            <c:when test="${property.styleId == 2}">
            <p>Property Style: Semi-Detached</p>
        </c:when>
            <c:when test="${property.styleId == 3}">
            <p>Property Style: Detached</p>
        </c:when>
            <c:when test="${property.styleId == 4}">
            <p>Property Style: Cottage</p>
        </c:when>
            <c:when test="${property.styleId == 5}">
            <p>Property Style: Terrace</p>
        </c:when>
            <c:when test="${property.styleId == 8}">
            <p>Property Style: Duplex</p>
        </c:when>
            <c:when test="${property.styleId == 9}">
            <p>Property Style: Condo</p>
        </c:when>
            <c:when test="${property.styleId == 10}">
            <p>Property Style: Apartment</p>
        </c:when>
            <c:when test="${property.styleId == 11}">
            <p>Property Style: Other</p>
        </c:when>
        </c:choose>
            
        <c:choose>
            <c:when test="${property.typeId == 1}">
                <p>Property Type: Residential-Single</p>
            </c:when>
                <c:when test="${property.typeId == 2}">
                <p>Property Type: Residential-Multi</p>
            </c:when>
                <c:when test="${property.typeId == 3}">
                <p>Property Type: Commercial</p>
            </c:when>
        </c:choose>
                
        <p>No of Bedrooms: ${property.bedrooms}</p>
        <p>No of Bathrooms: ${property.bathrooms}</p>
        <p>Square Feet: ${property.squarefeet}</p>
        <p>BER Rating: <img src="images/BER/${property.berRating}.png" alt="image of BER Rating"></p>
        <p>Description: ${property.description}</p>
        <p>Lot Size: ${property.lotsize}</p>
        <p>Garage Size: ${property.garagesize}</p>
        
        <c:choose>
            <c:when test="${property.garageId == 1}">
                <p>Garage Type: Attached</p>
            </c:when>
                <c:when test="${property.garageId == 2}">
                <p>Garage Type: Detached</p>
            </c:when>
                <c:when test="${property.garageId == 3}">
                <p>Garage Type: Carport</p>
            </c:when>
        </c:choose>
                
        <p>Agent ID: ${property.agentId}</p>
        <c:choose>
            <c:when test="${property.price > averagePrice}"><p style="color:red;">Price: <fmt:formatNumber value="${property.price}" type="currency"></fmt:formatNumber> is higher than average for the area</p></c:when>
            <c:when test="${property.price == averagePrice}"><p>Price: <fmt:formatNumber value="${property.price}" type="currency"></fmt:formatNumber> is average for the area</p></c:when>
            <c:otherwise><p style="color:green;">Price: <fmt:formatNumber value="${property.price}" type="currency"></fmt:formatNumber>  is lower than average for the area</p></c:otherwise>
        </c:choose>
        <p>Date Added: ${property.dateAdded}</p>
        <p hidden id="property-address">${property.street}, ${property.city}</p>
        
        <hr>
        <h2>Agent Information</h2>
        <p>Name: ${agent.name}</p>
        <p>Phone No: ${agent.phone}</p>
        <p>Fax: ${agent.fax}</p>
        <p>Email: ${agent.email}</p>
        
        <shiro:user>
        <hr>
        <h2>Vendor</h2>
        <p>Vendor ID: ${vendor.vendorID}</p>
        <p>Vendor Email: ${vendor.vendorEmail}</p>
        <p>Vendor Name: ${vendor.vendorName}</p>
        <p>Vendor Phone: ${vendor.vendorPhone}</p>
        </shiro:user>
        
        <button type="button" value="Back" onClick="history.back()">Back</button>
    </body>
</html>
