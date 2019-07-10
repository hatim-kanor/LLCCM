package registration;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class fees_disp extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String conf_id = request.getParameter("payment_conf");
            out.println("<table border=1 style='width:100%'>");
            out.println("<tr >");
            out.println("<td style='background-color:grey;font-size:15px;color:white'>ID</td>");
            out.println("<td style='background-color:grey;font-size:15px;color:white'>TITLE</td>");
            out.println("<td style='background-color:grey;font-size:15px;color:white'>TYPE</td>");
            out.println("<td style='background-color:grey;font-size:15px;color:white'>AMOUNT</td></tr>");
            try {
                Connection con = dbconnection.DbConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("select p.id,c.title,p.p_type,p.amount from payment_amount p,conference c where c.conf_id=p.conf_id and p.conf_id = " + conf_id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    out.println("<tr>");
                    out.println("<td>"+ rs.getString("p.id") +"</td>");
                    out.println("<td>"+ rs.getString("c.title") +"</td>");
                    out.println("<td>"+ rs.getString("p.p_type") +"</td>");
                    out.println("<td>"+ rs.getString("p.amount") +"</td>");
                    out.println("</tr>");
                }
             out.println("</table>");   
            } catch (Exception e) {
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
