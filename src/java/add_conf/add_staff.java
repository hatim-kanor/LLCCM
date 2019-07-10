
package add_conf;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbconnection.DbConnection.*;
import java.sql.*;

public class add_staff extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String staff_name = request.getParameter("staff_name");
            String staff_contact = request.getParameter("staff_contact");
            String staff_email = request.getParameter("staff_email");
            String department = request.getParameter("staff_department");
            String dept = "";
            int jr = 0;
            int sr = 0;
            int sf = 0;
            int nts = 0;
            
            int result = 0;
               Connection con = dbconnection.DbConnection.getConnection();
            switch(department)
            {
                
                case "jr_college":
                    dept = "Junior College";
                    break;
                case "sr_college":
                    dept = "Senior College";
                    break;
                case "self_finance":
                    dept = "Self Finance";
                    break;
                case "non_teaching":
                    dept = "Non Teaching";
                    break;
                   
            }
            try{
            PreparedStatement ps = con.prepareStatement("select * from staff_list where email = ? and contact = ?");
            ps.setString(1,staff_email);
            ps.setString(2, staff_contact);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                response.sendRedirect("add_staff.jsp?status=dup");
            }
            else
            {
                try {
                PreparedStatement pst = con.prepareStatement("insert into staff_list(staff_name,email,contact,stream) values(?,?,?,?)");
                pst.setString(1, staff_name);
                pst.setString(2, staff_email);
                pst.setString(3,staff_contact);
                pst.setString(4,dept);
                
                result = pst.executeUpdate();
                        if(result > 0)
                        {
                             response.sendRedirect("add_staff.jsp?status=success");
                        }
                        else
                        {
                             response.sendRedirect("add_staff.jsp?status=fail");
                        }
                
            } catch (Exception e) {
              out.println(e);
            }
                
            }
            }
            catch(Exception e)
            {
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
