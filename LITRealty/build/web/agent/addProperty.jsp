<%-- 
    Document   : addProperty
    Created on : 07-Nov-2018, 21:34:38
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
        <h1>Add a Property</h1>
        <img src="images/agents/${agent.agentId}.jpg" alt="picture of agent"/>

        <p>${message}</p>
        <p>Photo - Select file to upload:</p>

        <form action="specifyPath?username=${agent.username}" method="post">
            Name the file you would like photos added to (Listing Number): <input type="text" name="listingNum" value="${listingNum}"/>
            <input type="Submit" value="Choose File" />
        </form>
        <form action="uploadFile?listingNum=${listingNum}&username=${agent.username}" method="post" enctype="multipart/form-data">  
                <input type="file" name="uploadFile" /><br>
                <input type="Submit" value="Upload" />
        </form>
            
            
        
        <form action="addPropertyController"  method="post">
        
        <table width ="500" border="0">
            <tbody>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street"/></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city"/></td>
                </tr>
                <tr>
                    <td>Listing Number</td>
                    <td><input type="text" name="listingNum"/></td>
                </tr>
                <tr>
                    <td>Style</td>
                    <td>
                    <select name="style">
                        <option value="bungalow">Bungalow</option>
                        <option value="semi-detached">Semi-Detached</option>
                        <option value="detached">Detached</option>
                        <option value="cottage">Cottage</option>
                        <option value="terrace">Terrace</option>
                        <option value="duplex">Duplex</option>
                        <option value="condo">Condo</option>
                        <option value="apartment">Apartment</option>
                        <option value="other">Other</option>
                      </select>
                    </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td>
                        <select name="propertyType">
                            <option value="residential-single">Residential-Single</option>
                            <option value="residential-multi">Residential-Multi</option>
                            <option value="commercial">Commercial</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Bedrooms</td>
                    <td><input type="text" name="bedrooms"/></td>
                </tr>
                <tr>
                    <td>Bathrooms</td>
                    <td><input type="text" name="bathrooms"/></td>
                </tr>
                <tr>
                    <td>Square Feet</td>
                    <td><input type="text" name="squarefeet"/></td>
                </tr>
                <tr>
                    <td>BER Rating</td>
                    <td><input type="text" name="berRating"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description"/></td>
                </tr>
                <tr>
                    <td>Lot Size</td>
                    <td><input type="text" name="lotsize"/></td>
                </tr>
                <tr>
                    <td>Garage Size</td>
                    <td>
                        <select name="garagesize">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Garage ID</td>
                    <td>
                        <select name="garageType">
                            <option value="attached">Attached</option>
                            <option value="detached">Detached</option>
                            <option value="carport">Carport</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" name="agentId" value="${agent.agentId}"/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price"/></td>
                </tr>
                <tr>
                    <td>Vendor</td>
                    <td>
                        <select name="vendor">
                            <option value="alanRyan">Alan Ryan</option>
                            <option value="brendanWatson">Brendan Watson</option>
                            <option value="desOCarroll">Des O'Carroll</option>
                            <option value="seamusDoyle">Seamus Doyle</option>
                            <option value="itaKavanagh">Ita Kavanagh</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" name="username" value="${agent.username}"/></td>
                </tr>
            </tbody>
        </table>
                <input type="submit" value="Add Property" /> <input type="button" value="Go Back" onclick="history.back()"/>
    </form>
        </shiro:user>
        <shiro:guest>
            <p>You do not have permission to access this part of the site</p>
        </shiro:guest>
    </body>
</html>
