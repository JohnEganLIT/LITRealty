/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.Agents;
import Entities.Properties;
import Model.AgentsDB;
import Model.PropertiesDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author John
 */
@WebServlet(name = "editPropertyController", urlPatterns = {"/editPropertyController"})
public class editPropertyController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Agents a = AgentsDB.getAgentByUsername(request.getParameter("username"));  

            String style = request.getParameter("style");
            Integer styleId = 0;
            switch(style) {
                case "bungalow":
                    styleId = 1;
                    break;
                case "semi-detached":
                    styleId = 2;
                    break;
                case "detached":
                    styleId = 3;
                    break;
                case "cottage":
                    styleId = 4;
                    break;
                case "terrace":
                    styleId = 5;
                    break;
                case "duplex":
                    styleId = 8;
                    break;
                case "condo": 
                    styleId = 9;
                    break;
                case "apartment": 
                    styleId = 10;
                    break;
                case "other":
                    styleId = 11;
                    break;   
            }
            
            String propertyType = request.getParameter("propertyType");
            Integer typeId = 0;
            switch(propertyType) {
                case "residential-single":
                    typeId = 1;
                    break;
                case "residential-multi":
                    typeId = 2;
                    break;
                case "commercial":
                    typeId = 3;
                    break;
            }
            
            String garageType = request.getParameter("garageType");
            Integer garageId = 0;
            
            switch(garageType) {
                case "attached":
                    garageId = 1;
                    break;
                case "detached":
                    garageId = 2;
                    break;
                case "carport":
                    garageId = 3;
                    break;
            }
            
            Integer id = Integer.parseInt(request.getParameter("id"));
            Properties p = PropertiesDB.getPropertyByID(id);
            
            String vendor = request.getParameter("vendor");
            Integer vendorId = 0;
            
            switch(vendor){
                case "alanRyan":
                    vendorId = 1;
                    break;
                case "brendanWatson":
                    vendorId = 2;
                    break; 
                case "desOCarroll":
                    vendorId = 3;
                    break;
                case "seamusDoyle":
                    vendorId = 4;
                    break;
                case "itaKavanagh":
                    vendorId=5;
                    break;
            }

            p.setId(Integer.parseInt(request.getParameter("id")));
            p.setStreet(request.getParameter("street"));
            p.setCity(request.getParameter("city"));
            p.setListingNum(Integer.parseInt(request.getParameter("listingNum")));
            p.setStyleId(styleId);
            p.setTypeId(typeId);
            p.setBedrooms(Integer.parseInt(request.getParameter("bedrooms")));
            p.setBathrooms(Float.parseFloat(request.getParameter("bathrooms")));
            p.setSquarefeet(Integer.parseInt(request.getParameter("squarefeet")));
            p.setBerRating(request.getParameter("berRating"));
            p.setDescription(request.getParameter("description"));
            p.setLotsize(request.getParameter("lotsize"));
            p.setGaragesize(Short.parseShort(request.getParameter("garagesize")));
            p.setGarageId(garageId);
            p.setAgentId(Integer.parseInt(request.getParameter("agentId")));
            p.setPhoto(request.getParameter("photo"));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            //String dateAddedStr = request.getParameter("dateAdded");
            //String pattern = "EEEEE MMMMM dd HH:mm:ss";
            //SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            //Date dateAdded = sdf.parse(dateAddedStr);
            long millis = System.currentTimeMillis();
            Date dateAdded = new Date(millis);
            p.setDateAdded(dateAdded);           
            PropertiesDB.editProperty(p);
            
            request.setAttribute("agent", a);
            
            RequestDispatcher rd = request.getRequestDispatcher("agent/updateSuccessful.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(editPropertyController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(editPropertyController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
