
<%@page import="staff.add_convenor.SMTPAuthenticator"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title></title>
    </head>
    <body>
        <% try{
            Connection con = dbconnection.DbConnection.getConnection();
                String email_username = "conference.lalacollege@gmail.com";
         String email_password = "admin@root";
         String d_host = "smtp.gmail.com";
         int d_port = 465;
         String email = "",name="",conf_title="",conf_date="";
     
            String btn_update = request.getParameter("update_data");
            String conf_id = request.getParameter("conf_id");
            String reg_id = request.getParameter("reg_id");
            String payment_status = request.getParameter("payment_status");
            String user_status = request.getParameter("user_status");
            String uname = request.getParameter("uname");
            String title = request.getParameter("title");
            String email_user = request.getParameter("email_user");
            if(btn_update!=null)
            {
                if(conf_id!=null || reg_id !=null)
                {
                    if(payment_status.equals("UNPAID") && user_status.equals("Attended"))
                    {
                        response.sendRedirect("attendance.jsp?m=ne");
                    }
                    else if(payment_status.equals("UNPAID")  && user_status.equals("Not Attended"))
                    {
                        response.sendRedirect("attendance.jsp?m=ud");
                    }
                    else if(payment_status.equals("PAID") && user_status.equals("Attended"))
                    {
                        PreparedStatement pst = con.prepareStatement("update registration set payment_status=? ,user_status=? where reg_id=? and conf_id = ?");
                        pst.setString(1,payment_status);
                        pst.setString(2,user_status);
                        pst.setString(3,reg_id);
                        pst.setString(4,conf_id);
                        int res = pst.executeUpdate();
                        if(res > 0)
                        {
                             String msg = "<h4>HELLO, "+ uname +"</h4><br><p style='text-align:center'>THANKS FOR ATTENDING THE CONFERENCE </p><br> <p style='text-align:center'>"+title+"</p><br><br><i>Thanks,</i><br><i>Regards,</i><br><i>Team Lala Conference.</i>";
                    String email_title = "CONFERENCE REGISTRATION UPDATED";
                        Properties prop = new Properties();
                                
                                SMTPAuthenticator auth = new SMTPAuthenticator();
                                Session ses = Session.getInstance(prop,auth);
                                
                                
                                MimeMessage mime = new MimeMessage(ses);
                                mime.setContent(msg,"text/html");
                                mime.setSubject(email_title);
                                
                                mime.setFrom(new InternetAddress(email_username));
                                mime.addRecipient(Message.RecipientType.TO,new InternetAddress(email_user));
                                mime.addRecipient(Message.RecipientType.BCC,new InternetAddress("hatimkanor21@gmail.com") );
                                
                                try {
                                        Transport transport = ses.getTransport("smtps");
                                        transport.connect(d_host,d_port,email_username,email_password);
                                        transport.sendMessage(mime,mime.getAllRecipients());
                                        
                                        transport.close();
                                        
                                        response.sendRedirect("attendance.jsp?m=s");
                                }catch(Exception e)
                                {
                                    out.println(e);
                                }
                        }
                    }
                    else if(payment_status.equals("UNPAID") && user_status.equals("Not Attended"))
                    {
                        out.println("UNPAID AND NOT ATTENDED");
                    }
                }
            }
        }catch(Exception e)
        {
            out.println(e);
        }
        %>
    </body>
</html>
