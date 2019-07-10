
package add_conf;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name="add_conf",urlPatterns = {"/add_conf"})
@MultipartConfig(maxFileSize = 1073741824 )
public class add_conf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            InputStream is;
            int result = 0;
            Connection con = dbconnection.DbConnection.getConnection();
            ResultSet res;
            Date d = new Date();
            String c_year = new SimpleDateFormat("yy").format(d);
            String c_date1 = new SimpleDateFormat("dd-mm-yyy").format(d);
            String conference_aim = request.getParameter("conf_aim");
            
          
          
            
            String title = request.getParameter("c_title");
            String c_date = request.getParameter("c_date");
         
            String c_venue = request.getParameter("c_venue");
            Part part = request.getPart("conf_banner");
            String about = request.getParameter("about_c");
            String icw = request.getParameter("c_with");
            
        
            if(part != null)
            {
               
                
                try {
                    
                    
                    PreparedStatement pst = con.prepareStatement("insert into conference(title,about_conf,conf_date,venue,conf_image,collab_with,moto) values(?,?,?,?,?,?,?)");
                    
                    pst.setString(1, title);
                    pst.setString(2,about);
                    pst.setString(3, c_date);
                    pst.setString(4,c_venue);
                    pst.setString(6,icw);
                    pst.setString(7, conference_aim);
                 
                        is = part.getInputStream();
                
                pst.setBlob(5, is);
                result = pst.executeUpdate();
    
                        
                        if(result > 0 )
                        {
                           response.sendRedirect("new_conference.jsp?status=success");
                            
                        }
                        else
                        {
                             response.sendRedirect("new_conference.jsp?status=fail");
                        }
                    }
                   
                    
                 catch (Exception e) {
                  out.println(e);
                }
                
            }
            
            else
            {
                out.println("Part is equal ... not entered part");
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
            Logger.getLogger(add_conf.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(add_conf.class.getName()).log(Level.SEVERE, null, ex);
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
