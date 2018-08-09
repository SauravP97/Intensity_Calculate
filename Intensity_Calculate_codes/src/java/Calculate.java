/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Calculate extends HttpServlet {

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
          
        String date = request.getParameter("date");
        String longitude = request.getParameter("long");
        String latitude = request.getParameter("lat");
        String magnitude = request.getParameter("mag");
        String height = request.getParameter("heig");
        String utc = request.getParameter("utc");
        String itc = "invalid UTC format";
        
        
        UTCtoIST istobj = new UTCtoIST();
        itc = istobj.convertUTC(date+" "+utc);
        String data = date+"#"+itc+"#"+utc+"#"+latitude+"#"+longitude+"#"+magnitude+"#"+height;
        
        SaveData sd1 = new SaveData();
        sd1.saveToFile(data);
        
        double longi = Double.parseDouble(longitude);
        double lati = Double.parseDouble(latitude);
        double magni = Double.parseDouble(magnitude);
        double heigh = Double.parseDouble(height);
        
        TopCities toc1 = new TopCities(lati,longi,magni,heigh);
        String[] det = toc1.getDetails();
        
        request.setAttribute("Longitude",longi);
        request.setAttribute("Latitude",lati);
        request.setAttribute("Magnitude",magni);
        request.setAttribute("Height",heigh);
        request.setAttribute("City1",det[0]);
        request.setAttribute("City2",det[1]);
        request.setAttribute("City3",det[2]);
        request.setAttribute("City4",det[3]);
        request.setAttribute("City5",det[4]);
       
        RequestDispatcher obj1 = request.getRequestDispatcher("map1.jsp");
        obj1.forward(request,response);
        
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
