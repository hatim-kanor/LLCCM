<%-- 
    Document   : add_conf
    Created on : 3 Mar, 2019, 2:04:13 PM
    Author     : lenovo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            InputStream is;
            int result = 0;
            String title = request.getParameter("c_title");
            String c_date = request.getParameter("c_date");
            String c_venue = request.getParameter("c_venue");
            Part part = request.getPart("conf_banner");
            int b=0;
           Date d = new Date();
            String c_year = new SimpleDateFormat("yy").format(d);
            if(part != null)
            {
                String c = c_year + String.valueOf(b++);
               
                
               
                try {
                    
                    Connection con = dbconnection.DbConnection.getConnection();
                    
                    PreparedStatement pst = con.prepareStatement("insert into conference(conf_id,title,conf_date,venue,conf_image) values(?,?,?,?,?)");
                    
                    pst.setString(1, c);
                    pst.setString(2, title);
                    pst.setString(3, c_date);
                    pst.setString(4,c_venue);
                is = part.getInputStream();
                    pst.setBlob(5, is);
                    
                    if(is!=null)
                    {
                        result = pst.executeUpdate();
                        if(result > 0)
                        {
                             response.sendRedirect("new_conference.jsp?status=success");
                        }
                        else
                        {
                             response.sendRedirect("new_conference.jsp?status=fail");
                        }
                    }
                    
                } catch (Exception e) {
                }
            }
            
            
        %>
    </body>
</html>
