
package Controller;

import Entities.Agents;
import Entities.Properties;
import Entities.Vendors;
import Model.AgentsDB;
import Model.PropertiesDB;
import Model.VendorsDB;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.imageio.ImageIO;
import org.apache.shiro.subject.Subject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;


@WebServlet(name = "propertyDrilldown", urlPatterns = {"/propertyDrilldown"})
public class propertyDrilldownController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Properties p = PropertiesDB.getPropertyByID(id);
            
            Integer agentId = p.getAgentId();
            Agents a = AgentsDB.getAgentById(agentId);
            
            Integer vendorId = p.getVendorID();
            Vendors v = VendorsDB.getVendorById(vendorId);
            
            String relativePath = "/images/properties/large/" + p.getListingNum() + "/";
            String absolutePath = getServletContext().getRealPath(relativePath);
            List imageUrlList = new ArrayList();
            
            File imageDir = new File(absolutePath);
            try {
            for (File imageFile : imageDir.listFiles()) {
                String imageFileName = imageFile.getName();

                imageUrlList.add(imageFileName);
            }}catch(Exception ex) {
                out.println(ex);
            }
            if(!imageUrlList.isEmpty()) {
            request.setAttribute("images", imageUrlList);
            }
            
            List<Properties> properties = PropertiesDB.getAveragePriceByCity(p.getCity());
            if(properties == null) {
                //request.setAttribute("recentPropertyList", recentPropertyList);
                //request.setAttribute("propertyList", propertyList);
                request.setAttribute("message", "Could not find properties in that City. Try again.");

                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
            Double total = 0.0;
            for (Properties property : properties) {
                total += property.getPrice();
            }

            Double average = total/properties.size();
            
            request.setAttribute("averagePrice", average);
            request.setAttribute("property", p);
            request.setAttribute("agent", a);
            request.setAttribute("vendor", v);

            RequestDispatcher rd = request.getRequestDispatcher("propertyDrilldown.jsp");
            rd.forward(request, response);
        }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

