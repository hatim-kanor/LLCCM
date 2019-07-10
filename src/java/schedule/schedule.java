
package schedule;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class schedule extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                Connection con = dbconnection.DbConnection.getConnection();
            String conf_id = request.getParameter("conf_id");
            String reg_time = request.getParameter("reg_time");
            String bf = request.getParameter("bf");
            String inaug = request.getParameter("inaug");
            String intro = request.getParameter("intro");
            String sbp= request.getParameter("sbp");
            String sbcg = request.getParameter("sbcg");
            String sbkns = request.getParameter("sbkns");
            String pp1 = request.getParameter("pp1");
            String lb = request.getParameter("lb");
            String pp2 = request.getParameter("pp2");
            String racd= request.getParameter("racd");
            String vot = request.getParameter("vot");
            
            PreparedStatement p2 = con.prepareStatement("select conf_id from schedule where conf_id = " + conf_id);
            ResultSet r2 = p2.executeQuery();
            if(r2.next())
            {
                response.sendRedirect("schedule_list.jsp?msg=dup");
            }
            else
            {
                
            PreparedStatement p = con.prepareStatement("insert into schedule(conf_id,register,bf,inaug,intro,sbp,sbcg,sbkns,pp1,lb,pp2,racd,vot) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            p.setString(1,conf_id);
            p.setString(2,reg_time);
            p.setString(3, bf);
            p.setString(4, inaug);
            p.setString(5, intro);
            p.setString(6, sbp);
            p.setString(7, sbcg);
            p.setString(8, sbkns);
            p.setString(9, pp1);
            p.setString(10, lb);
            p.setString(11, pp2);
            p.setString(12, racd);
            p.setString(13, vot);
            int res = p.executeUpdate();
            if(res > 0)
            {
                response.sendRedirect("schedule_list.jsp?msg=success");
      
            }
            else
            {
                response.sendRedirect("schedule_list.jsp?msg=success");
            }
            }
            
            
            
            
        }catch(Exception e)
        {
            out.println(e);
        }
    }}

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
