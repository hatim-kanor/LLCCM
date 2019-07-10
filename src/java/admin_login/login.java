
package admin_login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import dbconnection.DbConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String username,password;          
      
        username = request.getParameter("uname");
         password = request.getParameter("admin_pass");
     
         
          
           try{
             try (Connection con = DbConnection.getConnection()) {
                 String query = "select * from user where username = ?  and password = ?";
                 PreparedStatement ps = con.prepareStatement(query);
                 ps.setString(1, username);
                 ps.setString(2, password);
                 
                 ResultSet rs = ps.executeQuery();
                 if(rs.next()){
              HttpSession session = request.getSession();
              session.setAttribute("username", username);
              session.setAttribute("password", password);
              session.setAttribute("role", "admin");
              response.sendRedirect("admin_profile.jsp");
                     
                     
                 }
                 else
                 {
                     
                     response.sendRedirect("login.jsp?msg=fail");
                     
                     
                 }  }
           }catch(Exception e){
               out.println(e);
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
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
    } catch (SQLException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
