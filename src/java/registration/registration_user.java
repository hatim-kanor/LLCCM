
package registration;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import staff.add_convenor;
import java.text.SimpleDateFormat;
import java.util.Date;


public class registration_user extends HttpServlet {
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int res1 = 0;
            String title="",conf_date="",d1="";
            String payment_confid="";
              String email_username = "conference.lalacollege@gmail.com";
         String email_password = "admin@root";
         String d_host = "smtp.gmail.com";
         int d_port = 465;
         String payment_mode = "";
        Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
        int c =0;
            try {
                String uname = request.getParameter("uname");
                String email = request.getParameter("uemail");
                String addr = request.getParameter("uaddress");
                String contact = request.getParameter("ucontact");
                String p_type = request.getParameter("payment_type");
                String design = request.getParameter("desig");
                String conf_id = request.getParameter("conf_id");
                String coll = request.getParameter("coll");
                Connection con = dbconnection.DbConnection.getConnection();
                
                PreparedStatement a = con.prepareStatement("select c.title,c.conf_date from conference c where c.conf_id="+conf_id);
                ResultSet aa = a.executeQuery();
                while(aa.next())
                {
                    title = aa.getString("c.title");
                    conf_date = aa.getString("c.conf_date");
                }
                
                PreparedStatement dd = con.prepareStatement("select * from payment_amount where conf_id="+ conf_id +" and p_type = '"+design+"'");
                ResultSet rr = dd.executeQuery();
                if(rr.next())
                {
                    payment_confid = rr.getString("id");
                }
                PreparedStatement c1 = con.prepareStatement("select * from payment where payment_id="+p_type);
                ResultSet cc = c1.executeQuery();
                while(cc.next())
                {
                    payment_mode = cc.getString("p_type");
                }
                PreparedStatement ps = con.prepareStatement("select * from registration where contact = ? and conf_id = ?");
                ps.setString(1, contact);
                ps.setString(2,conf_id);
                ResultSet rs = ps.executeQuery();
                String message ="Registration successful";
                
                if(rs.next())
                {
                    
                    
                    response.sendRedirect("conference_registration.jsp?reg=fail");
                    
                    
                }
                else
                {
                    
                    PreparedStatement pst = con.prepareStatement("insert into registration(uname,address,email,contact,payment_id,designation,conf_id,user_status,pa_id,payment_status,feed_status,coll) values(?,?,?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1,uname);
                    pst.setString(2,addr);
                    pst.setString(3,email);
                    pst.setString(4,contact);
                    pst.setString(5,p_type);
                    pst.setString(6,design);
                    pst.setString(7,conf_id);
                    pst.setString(8,"Not Attended");
                    pst.setString(9,payment_confid);
                    pst.setString(10,"UNPAID");
                    pst.setString(11,"Not Updated");
                    pst.setString(12,coll);
                    res1 = pst.executeUpdate();
                    if(res1 > 0 )
                    {
                      c = (conf_date).compareTo(c_year);
                         String msg = "<h4>HELLO " + uname + "</h4><br><p style='text-align:center'>REGISTRATION SUCCESSFUL FOR CONFERENCE  </p>    <br><p style='text-align:center;background-color:yellow'><h3><b>" + title + "</b></h3></p> <br><center>ON</center><br><p style='text-align:center'> Date: " + conf_date +" DAYS TO GO: "+ c +" </p><br><p style='text-align:center'> DESIGNATION:  "+ design +" PAYMENT MODE: "+ payment_mode +"</p><br>Kindly login into your account to complete details <br><br> <i>Regards,<br>Thanks,<br>Team Lala Conference</i>";
                    String email_title = "REGISTRATION SUCCESSFUL";
                        Properties prop = new Properties();
                                
                                add_convenor.SMTPAuthenticator auth = new add_convenor.SMTPAuthenticator();
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
                                        
                        response.sendRedirect("conference_registration.jsp?reg=success");
                    }catch(Exception e)
                    {
                        out.println(e);
                    }
                    }
                    else
                    {
                        response.sendRedirect("conference_registration.jsp?reg=unsuccess");
                    }
                }
                
            } catch (Exception e) {
                out.println(e);
            }
            
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
