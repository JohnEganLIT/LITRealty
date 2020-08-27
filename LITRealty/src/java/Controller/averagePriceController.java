/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.Properties;
import Model.PropertiesDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;
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
@WebServlet(name = "averagePriceController", urlPatterns = {"/averagePriceController"})
public class averagePriceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Integer numberOfDaysToLookBack = 7;
            Calendar calendar = new GregorianCalendar();
            calendar.setTimeZone(TimeZone.getTimeZone("GMT+1"));//Munich time
            calendar.setTime(new Date());
            calendar.add(Calendar.DATE, -numberOfDaysToLookBack);//substract the number of days to look back
            Date dateToLookBackAfter = calendar.getTime();
        
            List<Properties> recentPropertyList = PropertiesDB.getRecentProperties(dateToLookBackAfter);
            List<Properties> propertyList = PropertiesDB.getAllProperties();

            List<Properties> properties = PropertiesDB.getAveragePriceByCity(request.getParameter("city"));
            if(properties == null) {
                request.setAttribute("recentPropertyList", recentPropertyList);
                request.setAttribute("propertyList", propertyList);
                request.setAttribute("message", "Could not find properties in that City. Try again.");

                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
            Double total = 0.0;
            for (Properties property : properties) {
                total += property.getPrice();
            }

            Double average = total/properties.size();

            String successMessage = "Average price of a house in this area: ";
            request.setAttribute("averagePrice", average);
            request.setAttribute("recentPropertyList", recentPropertyList);
            request.setAttribute("propertyList", propertyList);
            request.setAttribute("message", successMessage);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);  
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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