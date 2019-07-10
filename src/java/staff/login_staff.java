package staff;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Calendar;
import java.sql.*;
import java.text.SimpleDateFormat;

public class login_staff extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int c = 0;
        String d1 = "", conf_date = "";
        Date d = new Date();
        String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("staff_email");
            String contact = request.getParameter("staff_contact");

            try {

                Connection con = dbconnection.DbConnection.getConnection();
                PreparedStatement pst = con.prepareStatement("select conf_date from conference where conf_date = '" + c_year + "'");
                ResultSet rst = pst.executeQuery();
                if (rst.next()) {
                    conf_date = rst.getString("conf_date");
                }
c = (conf_date).compareTo(c_year);
                String query = "select s.staff_name,s.staff_id,c.cm_role,s.contact from committee_list c,staff_list s,conference f where s.email = ?  and s.contact = ? and s.staff_id=c.staff_id;";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, contact);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String vrf = rs.getString("c.cm_role");
                    String sn = rs.getString("s.staff_name");
                    String s_contact = rs.getString("s.contact");

                    if (vrf.equalsIgnoreCase("convenor")) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", email);
                        session.setAttribute("role", vrf);
                        session.setAttribute("contact", s_contact);
                        response.sendRedirect("convenor_home.jsp");

                    } else {
                        HttpSession session = request.getSession();
                        
                        if (vrf.equalsIgnoreCase("ORGANIZING") || vrf.equalsIgnoreCase("REGISTRATION") || vrf.equalsIgnoreCase("organzing") || vrf.equalsIgnoreCase("registration")) {
                            
                            if (c == 0) {
                                session.setAttribute("username", email);
                                session.setAttribute("role", vrf);
                                session.setAttribute("contact", s_contact);
                                session.setAttribute("calll", "equal to 0");
                                session.setAttribute("dura", c);
                                session.setAttribute("header_type", "editable");
                                response.sendRedirect("staff/staff_home.jsp");
                            } else if (c >= 1) {
                                session.setAttribute("username", email);
                                session.setAttribute("role", vrf);
                                session.setAttribute("header_type", "soon");
                                session.setAttribute("dura", c);
                                session.setAttribute("calll", "greater than 1");
                                session.setAttribute("contact", s_contact);
                                response.sendRedirect("staff/staff_home.jsp");
                            } else if (c < 0) {
                                session.setAttribute("username", email);
                                session.setAttribute("role", vrf);
                                session.setAttribute("dura", c);
                                session.setAttribute("header_type", "normal");
                                session.setAttribute("calll", "less than 1");
                                session.setAttribute("contact", s_contact);
                                response.sendRedirect("staff/staff_home.jsp");
                            } else {
                                

                                response.sendRedirect("staff/staff_home.jsp");
                            }
                        }else
                        {
                            session.setAttribute("username", email);
                                session.setAttribute("role", vrf);
                                session.setAttribute("dura", c);
                                session.setAttribute("calll", "else_part_called");
                                session.setAttribute("header_type", "normal");
                                session.setAttribute("contact", s_contact);
                                response.sendRedirect("staff/staff_home.jsp");
                        }
                    }

                } else {

                    response.sendRedirect("login.jsp?msg=fail");

                }
            } catch (Exception e) {
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
