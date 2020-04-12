
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PHOTO GALLERY</title>
        <style>

            * {
                 box-sizing: border-box;
            }
            .image_zoom:hover
            {
                  -ms-transform: scale(2.0); /* IE 9 */
                -webkit-transform: scale(2.0); /* Safari 3-8 */
                 transform: scale(2.0); 
            }
        </style>
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        <div class="container">
        <%@include file="header.jsp" %>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
        <div >
        <%
            String title="";
            String c=request.getParameter("c");
            String g = request.getParameter("g");
            PreparedStatement ps = con.prepareStatement("select g.g_id AS GALLERY_ID,c.title,c.conf_id from conference c,gallery g LIMIT 3");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            title = rs.getString("c.title");
        %><img src="img_view.jsp?n1=<%= rs.getString("GALLERY_ID") %>" height="150" width="150" class="image_zoom"> <%
            }

        %>
        
        </div>
        </div>
    </body>
</html>
