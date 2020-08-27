<%-- 
    Document   : editProperty
    Created on : 02-Nov-2018, 14:13:01
    Author     : John
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header><img src="images/site/logo.gif" /></header>
    <shiro:user>
        <h1>${agent.name}</h1>
        <img src="images/agents/${agent.agentId}.jpg" alt="picture of agent"/>
            
    <form action="editPropertyController">
        
        <table width ="500" border="0">
            <tbody>
                 <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="${property.id}" readonly /></td>
                </tr>
                <tr>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street" value="${property.street}" /></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city" value="${property.city}" /></td>
                </tr>
                <tr>
                    <td>Listing Number</td>
                    <td><input type="text" name="listingNum" value="${property.listingNum}" readonly /></td>
                </tr>
                <tr>
                    <td>Style</td>
                    <td>
                        <select name="style">
                            <option value="bungalow" <c:if test="${property.styleId == 1}">selected</c:if>>Bungalow</option>
                            <option value="semi-detached" <c:if test="${property.styleId == 2}">selected</c:if>>Semi-Detached</option>
                            <option value="detached" <c:if test="${property.styleId == 3}">selected</c:if>>Detached</option>
                            <option value="cottage" <c:if test="${property.styleId == 4}">selected</c:if>>Cottage</option>
                            <option value="terrace" <c:if test="${property.styleId == 5}">selected</c:if>>Terrace</option>
                            <option value="duplex" <c:if test="${property.styleId == 8}">selected</c:if>>Duplex</option>
                            <option value="condo" <c:if test="${property.styleId == 9}">selected</c:if>>Condo</option>
                            <option value="apartment" <c:if test="${property.styleId == 10}">selected</c:if>>Apartment</option>
                            <option value="other" <c:if test="${property.styleId == 11}">selected</c:if>>Other</option>
                          </select>
                    </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td>
                        <select name="propertyType">
                            <option value="residential-single" <c:if test="${property.typeId == 1}">selected</c:if>>Residential-Single</option>
                            <option value="residential-multi" <c:if test="${property.typeId == 2}">selected</c:if>>Residential-Multi</option>
                            <option value="commercial" <c:if test="${property.typeId == 3}">selected</c:if>>Commercial</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Bedrooms</td>
                    <td><input type="text" name="bedrooms" value="${property.bedrooms}" /></td>
                </tr>
                <tr>
                    <td>Bathrooms</td>
                    <td><input type="text" name="bathrooms" value="${property.bathrooms}" /></td>
                </tr>
                <tr>
                    <td>Square Feet</td>
                    <td><input type="text" name="squarefeet" value="${property.squarefeet}" /></td>
                </tr>
                <tr>
                    <td>BER Rating</td>
                    <td><input type="text" name="berRating" value="${property.berRating}" /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" value="${property.description}" /></td>
                </tr>
                <tr>
                    <td>Lot Size</td>
                    <td><input type="text" name="lotsize" value="${property.lotsize}" /></td>
                </tr>
                <tr>
                    <td>Garage Size</td>
                    <td>
                        <select name="garagesize">
                            <option value="0" <c:if test="${property.garagesize == 0}">selected</c:if>>0</option>
                            <option value="1" <c:if test="${property.garagesize == 1}">selected</c:if>>1</option>
                            <option value="2" <c:if test="${property.garagesize == 2}">selected</c:if>>2</option>
                            <option value="3" <c:if test="${property.garagesize == 3}">selected</c:if>>3</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Garage ID</td>
                    <td>
                        <select name="garageType">
                            <option value="attached" <c:if test="${property.garageId == 1}">selected</c:if>>Attached</option>
                            <option value="detached" <c:if test="${property.garageId == 2}">selected</c:if>>Detached</option>
                            <option value="carport" <c:if test="${property.garageId == 3}">selected</c:if>>Carport</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" name="agentId" value="${agent.agentId}" readonly/></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="text" name="photo" value="${property.photo}" /></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" value="${property.price}" /></td>
                </tr>
                <tr>
                    <td>Date Added</td>
                    <td><input type="text" name="dateAdded" value="${property.dateAdded}" readonly /></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="username" value="${agent.username}" readonly /></td>
                </tr>
                <tr>
                    <td>Vendor</td>
                    <td>
                        <select name="vendor" disabled>
                            <option value="alanRyan" <c:if test="${property.vendorID == 1}">selected</c:if>>Alan Ryan</option>
                            <option value="brendanWatson" <c:if test="${property.vendorID == 2}">selected</c:if>>Brendan Watson</option>
                            <option value="desOCarroll" <c:if test="${property.vendorID == 3}">selected</c:if>>Des O'Carroll</option>
                            <option value="seamusDoyle" <c:if test="${property.vendorID == 4}">selected</c:if>>Seamus Doyle</option>
                            <option value="itaKavanagh" <c:if test="${property.vendorID == 5}">selected</c:if>>Ita Kavanagh</option>
                        </select>
                    </td>                
                </tr>
            </tbody>
        </table>
                <input type="submit" value="Submit" /> 
                <input type="button" value="Go Back" onclick="history.back()"/><br>
                <a href="deletePropertyController?id=${property.id}&username=${agent.username}"><input type="button" name="delete" value="Delete Property" onclick="return confirm('are you sure you want to delete ${property.id}, ${property.street}, ${property.city}?');" /></a>
    </form>
    </shiro:user>
    <shiro:guest>
        <p>You do not have permission to access this part of the site</p>
    </shiro:guest>
    </body>
</html>
