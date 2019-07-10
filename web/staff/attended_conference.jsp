<%-- 
    Document   : attended_conference
    Created on : Apr 22, 2019, 11:56:57 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW ATTENDED CONFERENCES</title>
        <%@include file="../cssfile.jsp" %>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
         <%@include file="staff_lef_panel.jsp" %>
        <div class="container">
        <%
            Connection con = dbconnection.DbConnection.getConnection();
            String uname = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("staff_email");
            String role = (String) session.getAttribute("role");
            
        %>
        <table border="1" style="width: 100%">
            <tr>
                <th>ID</th>
                <th>STREAM</th>
                <th>NAME</th>
                <th>COMMITTEE</th>
            </tr>
        <%
            PreparedStatement ps = con.prepareStatement("select c.title,cl.c_name,sl.staff_name,sl.stream from committee_list cl,conference c,staff_list sl where c.conf_id=cl.conf_id and cl.staff_id=sl.staff_id and r.email='"+email+"'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                %><tr>
                    <td><%= rs.getString("c.title") %></td>
                    <td><%= rs.getString("cl.c_name") %></td>
                    <td><%= rs.getString("sl.staff_name") %></td>
                    <td><%= rs.getString("sl.stream") %></td>
</tr><%
            }
            
        %>
        </table>
        </div>
    </body>
</html>
