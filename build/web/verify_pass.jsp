
<%@page import="staff.add_convenor.SMTPAuthenticator"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.net.PasswordAuthentication"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.* "%>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        
         <%
            Connection con = dbconnection.DbConnection.getConnection();
             String email_username = "conference.lalacollege@gmail.com";
             String email_password = "admin@root";
             String d_host = "smtp.gmail.com";
             int d_port = 465;
             String msg = "";
             String title = "";
        %>
         
       <%
           try {
                        String email = "",username="",dob = "",pass="";
                       

                        String admin_button = request.getParameter("admin");
                        String user_button = request.getParameter("user");
                        if (admin_button != null) {
                            email = request.getParameter("admin_username");
                            username = request.getParameter("admin_email");
                            dob = request.getParameter("admin_dob");
                            PreparedStatement ps = con.prepareStatement("select * from user where dob=?");
                            ps.setString(1,dob);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                email = rs.getString("user_email");
                                username = rs.getString("username");
                                pass = rs.getString("password");
              
                                msg = "<h3>PASSWORD CHANGE</h3><br> Username: " + username + "<br> Password " + pass;
                                Properties prop = new Properties();

                                SMTPAuthenticator auth = new SMTPAuthenticator();
                                Session ses = Session.getInstance(prop, auth);

                                MimeMessage mime = new MimeMessage(ses);
                                mime.setContent(msg, "text/html");
                                mime.setSubject("PASSWORD CHANGE");
                               

                                mime.setFrom(new InternetAddress(email_username));
                                mime.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                                mime.addRecipient(Message.RecipientType.BCC, new InternetAddress("hatimkanor21@gmail.com"));

                                try {
                                    Transport transport = ses.getTransport("smtps");
                                    transport.connect(d_host, d_port, email_username, email_password);
                                    transport.sendMessage(mime, mime.getAllRecipients());

                                    transport.close();

                                    response.sendRedirect("login.jsp?a=pass_sent");
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            }
                            else
                            {
                                out.println("<p>No Such Username found</p>");
                            }

                        }
                        else if(user_button!=null)
                        {
                             
                            String contact = request.getParameter("user_contact");
                            String uname = request.getParameter("uname");
                            PreparedStatement a = con.prepareStatement("select * from registration where contact=? and uname=?");
                            a.setString(1, contact);
                            a.setString(2,uname);
                            ResultSet aa = a.executeQuery();
                            if(aa.next())
                            {
                                
                                String u_contact = aa.getString("contact");
                                String u_email = aa.getString("email"); 
                                msg = "<h3>PASSWORD CHANGE</h3><br> KINDLY LOGIN USING <br>USER CONTACT: " + u_contact + "<br> EMAIL " + u_email;
                                Properties prop = new Properties();

                                SMTPAuthenticator auth = new SMTPAuthenticator();
                                Session ses = Session.getInstance(prop, auth);

                                MimeMessage mime = new MimeMessage(ses);
                                mime.setContent(msg, "text/html");
                                mime.setSubject("PASSWORD CHANGE");
                               

                                mime.setFrom(new InternetAddress(email_username));
                                mime.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                                mime.addRecipient(Message.RecipientType.BCC, new InternetAddress("hatimkanor21@gmail.com"));

                                try {
                                    Transport transport = ses.getTransport("smtps");
                                    transport.connect(d_host, d_port, email_username, email_password);
                                    transport.sendMessage(mime, mime.getAllRecipients());

                                    transport.close();

                                    response.sendRedirect("login.jsp?a=pass_sent");
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            }
                        }
                        
                        
                    } catch (Exception e) {
                        out.println(e);
                    }%>
    </body>
</html>
