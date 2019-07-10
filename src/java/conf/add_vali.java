
package conf;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class add_vali extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
  
            int result = 0;
        String ty=request.getParameter("vale");
        String conf_id=request.getParameter("conf_id"); 
        /* Chief guest paramters */
        
        String c_username=request.getParameter("c_username");
        String c_desig=request.getParameter("c_desig");
        String c_clg=request.getParameter("c_clg");
        
        
        /* Chief guest paramters */
        /* Key note speaker start*/
        
         String k_username=request.getParameter("k_username");
        String k_desig=request.getParameter("k_desig");
        String k_clg=request.getParameter("k_clg");
        try{
        /* Key note speaker end */
                Connection con = dbconnection.DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from chief_guest where conf_id = ? and (cg_name LIKE ? or spk_name LIKE ?)");
            ps.setString(1,conf_id);
            ps.setString(2,c_username);
            ps.setString(3, c_username);
        
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                response.sendRedirect("valedictory.jsp?status=dup");
            }
            else
            {
                try {
                PreparedStatement pst = con.prepareStatement("insert into chief_guest(conf_id,cg_name,desig,college,spk_name,spk_desig,spk_coll) values(?,?,?,?,?,?,?)");
                pst.setString(1, conf_id);
                pst.setString(2, c_username);
                pst.setString(3,c_desig);
                pst.setString(4,c_clg);
                pst.setString(5, k_username);
                pst.setString(6,k_desig);
                pst.setString(7,k_clg);
                
                result = pst.executeUpdate();
                        if(result > 0)
                        {
                             response.sendRedirect("valedictory.jsp?status=success");
                        }
                        else
                        {
                             response.sendRedirect("valedictory.jsp?status=fail");
                        }
                
            } catch (IOException | SQLException e) {
              out.println(e);
            }
               
           
        }
    }catch(IOException | SQLException e)
    {
       out.println(e);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(add_vali.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(add_vali.class.getName()).log(Level.SEVERE, null, ex);
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
