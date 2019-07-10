package staff;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


@WebServlet(name = "add_convenor", urlPatterns = {"/add_convenor"})
public class add_convenor extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String email_username = "conference.lalacollege@gmail.com";
         String email_password = "admin@root";
         String d_host = "smtp.gmail.com";
         int d_port = 465;
         String email = "",name="",conf_title="",conf_date="";
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        
            try {
                Connection con = dbconnection.DbConnection.getConnection();
                String conf_id = request.getParameter("conf_id");
                String stream_id = request.getParameter("stream_id");
                String staff_id = request.getParameter("staff_id");
                PreparedStatement a = con.prepareStatement("select sl.email,sl.staff_name,c.title,c.conf_date from staff_list sl,conference c where sl.staff_id=?");
                a.setString(1,staff_id);
                ResultSet aa = a.executeQuery();
                while(aa.next())
                {
                    email = aa.getString("sl.email");
                    name = aa.getString("sl.staff_name");
                    conf_title = aa.getString("c.title");
                    conf_date = aa.getString("c.conf_date");
                }
                PreparedStatement ps = con.prepareStatement("select * from committee_list where conf_id =?");
                ps.setString(1,conf_id);
                
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    response.sendRedirect("add_convenor.jsp?msg=dup");
                }
                else
                {
                    PreparedStatement pst = con.prepareStatement("insert into committee_list(c_name,conf_id,staff_id,cm_role) values(?,?,?,?)");
                    pst.setString(1, "convenor");
                    pst.setString(2, conf_id);
                    pst.setString(3, staff_id);
                    pst.setString(4, "convenor");
                    
                   int res = pst.executeUpdate();
                    if(res > 0)
                    {
                        
                    String msg = "<h4>HELLO <i>" + name + "</i></h4><br><p style='text-align:center'>Lala Lajpatrai College of Commerce And Economics is Coming up With A New Conference Entitled <br><h3><b>" + conf_title + "</b></h3> <br>on <br> Date: " + conf_date +"<br> YOU HAVE BEEN ASSIGNED AS THE <br><b>CONVENOR</b> FOR THE CONFERENCE <br><br> <i>Regards,<br>Thanks,<br>Team Lala Conference</i></p>";
                    String email_title = "NEW CONVENOR FOR CONFERENCE";
                        Properties prop = new Properties();
                                
                                SMTPAuthenticator auth = new SMTPAuthenticator();
                                Session ses = Session.getInstance(prop,auth);
                                
                                
                                MimeMessage mime = new MimeMessage(ses);
                                mime.setContent(msg,"text/html");
                                mime.setSubject(email_title);
                                
                                mime.setFrom(new InternetAddress(email_username));
                                mime.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
                                mime.addRecipient(Message.RecipientType.BCC,new InternetAddress("hatimkanor21@gmail.com") );
                                
                                try {
                                        Transport transport = ses.getTransport("smtps");
                                        transport.connect(d_host,d_port,email_username,email_password);
                                        transport.sendMessage(mime,mime.getAllRecipients());
                                        
                                        transport.close();
                                        
                                        out.println("Added Successfully to committee List");
                        response.sendRedirect("add_convenor.jsp?msg=success");
                    }catch(Exception e)
                    {
                        
                    }
                    }else
                    {
                        response.sendRedirect("add_convenor.jsp?msg=fail");
                    }
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    
    public static class SMTPAuthenticator extends Authenticator{
public PasswordAuthentication getPasswordAuthentictation()
{
return new PasswordAuthentication("conference.lalacollege@gmail.com","admin@root");
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
