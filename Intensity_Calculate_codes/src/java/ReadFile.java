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
public class ReadFile extends HttpServlet {

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
        
        FileRead obj = new FileRead();
        String res = obj.getData();
        String[] results = res.split("#");
        
        double longi = Double.parseDouble(results[2]);
        double lati = Double.parseDouble(results[1]);
        double magni = Double.parseDouble(results[0]);
        double heigh = Double.parseDouble(results[3]);
        String date = results[4];
        String[] dates = date.split("-");
        date = dates[2]+"-"+dates[1]+"-"+dates[0];
        String timeutc = results[5];
        String timeitc = "invalid UTC format";
        
        
        UTCtoIST istobj = new UTCtoIST();
        timeitc = istobj.convertUTC(date+" "+timeutc);
        
        String data = date+"#"+timeitc+"#"+timeutc+"#"+lati+"#"+longi+"#"+magni+"#"+heigh;
        SaveData sd1 = new SaveData();
        sd1.saveToFile(data);
        
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
