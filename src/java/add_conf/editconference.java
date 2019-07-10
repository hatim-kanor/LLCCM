
package add_conf;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class editconference extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String conf_id = request.getParameter("conf_id");
            String conf_venue = request.getParameter("conf_venue");
            String conf_date = request.getParameter("conf_date");
            String about = request.getParameter("conf_about");
            String collab_with = request.getParameter("conf_collab");
            String title = request.getParameter("conf_title");
            
            try {
                Connection con = dbconnection.DbConnection.getConnection();
                              PreparedStatement st = con.prepareStatement("update conference set venue =?,about_conf=?,collab_with=?,conf_date=?,title=? where conf_id = " + conf_id);
                            st.setString(1,conf_venue);
                          st.setString(2, about);
                        st.setString(3, collab_with);
                        st.setString(4, conf_date);
                        st.setString(5,title);
                            
                              int i = st.executeUpdate();
                              if(i > 0 )
                              {
                               
                                  response.sendRedirect("view_edit_conference.jsp?update=success");
                              }
                              else
                              {
                                  response.sendRedirect("view_edit_conference.jsp?update=fail");
                              }
             
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
